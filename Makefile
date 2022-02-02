ifneq (,)
.error This Makefile requires GNU Make.
endif

# -------------------------------------------------------------------------------------------------
# Default configuration
# -------------------------------------------------------------------------------------------------
.PHONY: help lint test install

SHELL = /bin/sh

MKDIR_P = mkdir -p


# -------------------------------------------------------------------------------------------------
# Default target
# -------------------------------------------------------------------------------------------------
help:
	@echo Options
	@echo "   make install"
	@echo "      Install everthing (requires sudo or root)"
	@echo
	@echo "   make lint"
	@echo "      Shellcheck lint ca-gen and cert-gen"
	@echo
	@echo "   make test"
	@echo "      Verify that CA and certificates can be generated successfully"
	@echo
	@echo "   make help"
	@echo "      Show this help screen"


# -------------------------------------------------------------------------------------------------
# Test targets
# -------------------------------------------------------------------------------------------------
lint:
	docker run --rm -v "$(PWD)/bin:/mnt" koalaman/shellcheck:stable ca-gen
	docker run --rm -v "$(PWD)/bin:/mnt" koalaman/shellcheck:stable cert-gen

test:
	.tests/test.sh $(ARGS)


# -------------------------------------------------------------------------------------------------
# Install targets
# -------------------------------------------------------------------------------------------------
install:

	@echo "Installing files"
	@echo ""

	@# Create directories
	${MKDIR_P} /usr/local/bin

	@# Install binary
	install -m 0755 bin/ca-gen ~/.local/bin/ca-gen
	install -m 0755 bin/cert-gen ~/.local/bin/cert-gen
	install -m 0755 bin/cert-gen ~/.local/bin/configs


	@echo "Installation complete:"
	@echo "----------------------------------------------------------------------"
	@echo ""
