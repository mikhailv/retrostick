#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

docker build -t retrostick-base . --build-arg ROOTFS_DUMP=./rootfs-dumps/gamesticklite-v5/rootfs.squashfs
