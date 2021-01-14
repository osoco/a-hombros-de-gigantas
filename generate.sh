#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

GENERATOR_DIR="generator"
PHARO="./pharo Pharo.image --no-default-preferences"

[ -d "$GENERATOR_DIR" ] || ./download-generator.sh

cd "$GENERATOR_DIR"
${PHARO} eval "AHDGGenerator generate"
