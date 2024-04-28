#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

docker build -t retrostick-rootfs -f Dockerfile ..
docker run --rm -e CHOWN_OUT="$(id -u):$(id -g)" \
    -v $(pwd)/out:/build/out \
    -v $(pwd)/../devices/${DEVICE_NAME}:/build/device \
    -v $(pwd)/../lib:/build/lib \
    retrostick-rootfs
