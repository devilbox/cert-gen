#!/usr/bin/env bash

set -e
set -u
set -o pipefail


# -------------------------------------------------------------------------------------------------
# Functions
# -------------------------------------------------------------------------------------------------

###
### Run command
###
run() {
	local cmd="${1}"
	local retries=1
	local workdir=
	local verbose=1

	# retry?
	if [ "${#}" -gt "1" ]; then
		retries="${2}"
	fi
	# change directory?
	if [ "${#}" -gt "2" ]; then
		workdir="${3}"
	fi

	# be verbose?
	if [ "${#}" -gt "3" ]; then
		verbose="${4}"
	fi

	local red="\\033[0;31m"
	local green="\\033[0;32m"
	local yellow="\\033[0;33m"
	local reset="\\033[0m"

	# Set command
	if [ -n "${workdir}" ]; then
		cmd="cd ${workdir} && ${cmd}"
	else
		cmd="${cmd}"
	fi
	# Print command?
	if [ "${verbose}" -eq "1" ]; then
		>&2 printf "${yellow}%s \$${reset} %s\\n" "$(whoami)" "${cmd}"
	fi

	for ((i=0; i<retries; i++)); do
		if eval "set -e && set -u && set -o pipefail && ${cmd}"; then
			if [ "${verbose}" -eq "1" ]; then
				>&2 printf "${green}[%s: in %s rounds]${reset}\\n" "OK" "$((i+1))"
			fi
			return 0
		fi
		sleep 1
	done
	if [ "${verbose}" -eq "1" ]; then
		>&2 printf "${red}[%s: in %s rounds]${reset}\\n" "FAIL" "${retries}"
	fi
	return 1
}
