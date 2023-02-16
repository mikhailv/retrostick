#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

if [ ! -z "${APPLY_PATCH-}" ]; then
  git apply --directory=RetroArch \
      01-sound-fix.patch \
      02-max-users.patch \
      03-scan-roms-home.patch
fi

make -B -C RetroArch -f Makefile.gslv5 -j

cp RetroArch/retroarch out/

if [ ! -z "${CHOWN_OUT-}" ]; then
  chown "${CHOWN_OUT}" out/retroarch
fi
