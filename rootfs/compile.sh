#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

OUT=out/rootfs.squashfs

(cd ./device && ROOT=/squashfs-root bash ./patch.sh)

mksquashfs /squashfs-root/ "${OUT}" -noappend

if [ ! -z "${CHOWN_OUT-}" ]; then
  chown "${CHOWN_OUT}" "${OUT}"
fi
