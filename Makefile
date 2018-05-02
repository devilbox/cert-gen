# Configuration
SHELL = /bin/sh

MKDIR_P = mkdir -p


help:
	@echo Options
	@echo "   make install"
	@echo "      Install everthing (requires sudo or root)"
	@echo ""
	@echo "   make help"
	@echo "      Show this help screen"


install:

	@echo "Installing files"
	@echo ""

	@# Create directories
	${MKDIR_P} /usr/local/bin

	@# Install binary
	install -m 0755 bin/ca-gen /usr/local/bin/ca-gen
	install -m 0755 bin/cert-gen /usr/local/bin/cert-gen


	@echo "Installation complete:"
	@echo "----------------------------------------------------------------------"
	@echo ""
