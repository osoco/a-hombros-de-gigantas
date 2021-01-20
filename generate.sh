#!/usr/bin/env bash
set -euxo pipefail

GENERATOR_DIR="generator"
PHARO="./pharo Pharo.image --no-default-preferences"

[ -f "$GENERATOR_DIR/pharo" ] || ./download-generator.sh

cd "$GENERATOR_DIR"
${PHARO} eval "AHDGGenerator generate"

cp ../CNAME ../docs
