#!/usr/bin/env bash

set -e
set -u
set -o pipefail

TEST_PATH="$( cd "$(dirname "$0")" && pwd -P )"
ROOT_PATH="$( cd "${TEST_PATH}/.." && pwd -P )"
# shellcheck disable=SC1090
. "${TEST_PATH}/.lib.sh"


# -------------------------------------------------------------------------------------------------
# Pre-check
# -------------------------------------------------------------------------------------------------

###
### Clean-up for new round
###
rm -rf "${TEST_PATH}/tmp"
mkdir "${TEST_PATH}/tmp"


# -------------------------------------------------------------------------------------------------
# Variables
# -------------------------------------------------------------------------------------------------


###
### General
###
DOCKER_NAME="devilbox_openssl_server"
DOCKER_IMAGE="debian:buster-slim"
OPENSSL_PORT=4433


###
### Certificate Authority
###
CA_NAME="devilbox.org"
CA_KEYSIZE=2048
CA_VALIDITY=3650

CA_KEY_NAME="ca.key"
CA_KEY_PATH="${TEST_PATH}/tmp/${CA_KEY_NAME}"
CA_CRT_NAME="ca.crt"
CA_CRT_PATH="${TEST_PATH}/tmp/${CA_CRT_NAME}"


###
### Certificate
###
CERT_NAME="localhost"
CERT_KEYSIZE=2048
CERT_VALIDITY=400

CERT_KEY_NAME="cert.key"
CERT_KEY_PATH="${TEST_PATH}/tmp/${CERT_KEY_NAME}"
CERT_CSR_NAME="cert.csr"
CERT_CSR_PATH="${TEST_PATH}/tmp/${CERT_CSR_NAME}"
CERT_CRT_NAME="cert.crt"
CERT_CRT_PATH="${TEST_PATH}/tmp/${CERT_CRT_NAME}"


# -------------------------------------------------------------------------------------------------
# ENTRYPOINT
# -------------------------------------------------------------------------------------------------

echo
echo "# -------------------------------------------------------------------------------------------------"
echo "# Creating Certificate Authority"
echo "# -------------------------------------------------------------------------------------------------"
echo
run "${ROOT_PATH}/bin/ca-gen \
-v \
-k ${CA_KEYSIZE} \
-d ${CA_VALIDITY} \
-n ${CA_NAME} \
-c DE \
-s Berlin \
-l Berlin \
-o DevilboxOrg \
-u DevilboxUnit \
-e ca@${CA_NAME} \
${CA_KEY_PATH} \
${CA_CRT_PATH}"

# Verify CRT
echo
echo "[INFO] Verify CRT"
run "openssl x509 -noout -in ${CA_CRT_PATH}"
echo

# Verify KEY
echo
echo "[INFO] Verify KEY"
run "openssl rsa -check -noout -in ${CA_KEY_PATH}"

# Check that KEY matches CRT
echo
echo "[INFO] Verify KEY matches CRT"
run "diff -y \
<(openssl x509 -noout -modulus -in ${CA_CRT_PATH} | openssl md5) \
<(openssl rsa -noout -modulus -in ${CA_KEY_PATH} | openssl md5)"


echo
echo "# -------------------------------------------------------------------------------------------------"
echo "# Creating Certificate"
echo "# -------------------------------------------------------------------------------------------------"
echo

run "${ROOT_PATH}/bin/cert-gen \
-v \
-k ${CERT_KEYSIZE} \
-d ${CERT_VALIDITY} \
-n ${CERT_NAME} \
-c DE \
-s Berlin \
-l Berlin \
-o SomeOrg \
-u SomeUnit \
-e cert@${CERT_NAME} \
-a '*.${CERT_NAME},www.${CERT_NAME}' \
${CA_KEY_PATH} \
${CA_CRT_PATH} \
${CERT_KEY_PATH} \
${CERT_CSR_PATH} \
${CERT_CRT_PATH}"

# Verify CRT
echo
echo "[INFO] Verify CRT"
run "openssl x509 -noout -in ${CERT_CRT_PATH}"

# Verify KEY
echo
echo "[INFO] Verify KEY"
run "openssl rsa -check -noout -in ${CERT_KEY_PATH}"

# Verify CSR
echo
echo "[INFO] Verify CSR"
run "openssl req -noout -verify -in ${CERT_CSR_PATH}"

# Check that KEY matches CRT
echo
echo "[INFO] Verify KEY matches CRT"
run "diff -y \
<(openssl x509 -noout -modulus -in ${CERT_CRT_PATH} | openssl md5) \
<(openssl rsa -noout -modulus -in ${CERT_KEY_PATH} | openssl md5)"

# Check that KEY matches CSR
echo
echo "[INFO] Verify KEY matches CSR"
run "diff -y \
<(openssl x509 -noout -modulus -in ${CERT_CRT_PATH} | openssl md5) \
<(openssl req -noout -modulus -in ${CERT_CSR_PATH} | openssl md5)"

# Check certificate is issued by CA
echo
echo "[INFO] Verify certificate is issued by CA"
run "openssl verify -verbose -CAfile ${CA_CRT_PATH} ${CERT_CRT_PATH}"


echo
echo "# -------------------------------------------------------------------------------------------------"
echo "# Testing browser certificate"
echo "# -------------------------------------------------------------------------------------------------"
echo

echo "[INFO] Pulling Docker Image"
run "docker pull ${DOCKER_IMAGE}"

echo
echo "[INFO] Ensuring Docker Image is not running"
run "docker rm -f ${DOCKER_NAME} >/dev/null 2>&1 || true"

echo
echo "[INFO] Starting Docker Image with OpenSSL server"
run "docker run -d --rm --name ${DOCKER_NAME} -w /data -p '${OPENSSL_PORT}:${OPENSSL_PORT}' -v ${TEST_PATH}/tmp:/data ${DOCKER_IMAGE} sh -c '
	apt-get update &&
	apt-get install -y openssl &&
	set -x &&
	openssl s_server -key ${CERT_KEY_NAME} -cert ${CERT_CRT_NAME} -CAfile ${CA_CRT_NAME} -accept ${OPENSSL_PORT} -www' >/dev/null"

echo
echo "[INFO] Testing valid https connection with curl"
if ! run "curl -sS -o /dev/null -w '%{http_code}' --cacert ${CA_CRT_PATH} 'https://localhost:${OPENSSL_PORT}' | grep 200 >/dev/null" "60"; then
	echo "Failed"
	run "docker rm -f ${DOCKER_NAME} >/dev/null 2>&1" || true
	exit 1
fi

echo
echo "[INFO] Clean-up"
run "docker rm -f ${DOCKER_NAME} >/dev/null 2>&1" || true
