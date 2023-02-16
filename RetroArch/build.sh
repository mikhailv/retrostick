#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

if [ ! -z "${RETROARCH_SRC-}" ]; then
  docker build -t retrostick-retroarch-src -f Dockerfile.src .
  docker run --rm -e CHOWN_OUT="$(id -u):$(id -g)" -v "${RETROARCH_SRC}:/build/RetroArch" -v $(pwd)/out:/build/out retrostick-retroarch-src
else
  docker build -t retrostick-retroarch .
  docker run --rm -e CHOWN_OUT="$(id -u):$(id -g)" -e APPLY_PATCH=1 -v $(pwd)/out:/build/out retrostick-retroarch
fi
