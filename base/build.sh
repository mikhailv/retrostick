#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

docker build -t retrostick-base -f Dockerfile .. --build-arg DEVICE_NAME=${DEVICE_NAME}
