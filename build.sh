#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

(cd base && ./build.sh)
(cd RetroArch && ./build.sh)
