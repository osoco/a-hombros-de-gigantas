#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

PHARO_VERSION="${PHARO_VERSION:-80}"
PHARO="./pharo Pharo.image --no-default-preferences"
REPOSITORY_URL="github://osoco/ahdg-site-generator:main/src"
GENERATOR_DIR="generator"

rm -rf "$GENERATOR_DIR"
mkdir "$GENERATOR_DIR"
cd "$GENERATOR_DIR"
wget -O - get.pharo.org/64/${PHARO_VERSION}+vm | bash
${PHARO} eval --save "Metacello new baseline: 'AHDGGenerator'; repository: '${REPOSITORY_URL}'; load"
