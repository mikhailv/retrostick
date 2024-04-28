#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

docker build -t retrostick-lib-alsa -f Dockerfile .
docker run --rm -e CHOWN_OUT="$(id -u):$(id -g)" -v $(pwd)/out:/build/out retrostick-lib-alsa
