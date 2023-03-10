#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

OUT=out/retroarch

if [ ! -z "${APPLY_PATCH-}" ]; then
  git apply --directory=RetroArch \
      01-sound-fix.patch \
      02-max-users.patch \
      03-scan-roms-home.patch
fi

# remove already built binary if exists to force rebuild
rm -f RetroArch/retroarch

make -C RetroArch -f Makefile.gslv5 -j

cp RetroArch/retroarch "${OUT}"

if [ ! -z "${CHOWN_OUT-}" ]; then
  chown "${CHOWN_OUT}" "${OUT}"
fi
