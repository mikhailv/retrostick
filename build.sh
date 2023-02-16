#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

export DEVICE_NAME=gamesticklite-v5

(cd base && ./build.sh)
(cd RetroArch && ./build.sh)
