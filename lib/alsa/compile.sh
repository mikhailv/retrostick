#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

OUT=../out/libasound.so.2.0.0

libtoolize --force --copy --automake
aclocal
autoheader
automake --foreign --copy --add-missing
autoconf

CFLAGS="-O3 -marm -mcpu=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -ffast-math" \
  ./configure --host=arm-linux-gnueabihf \
    --without-debug \
    --with-pic \
    --disable-python \
    --with-versioned=no \
    --disable-mixer \
    --disable-aload \
    --disable-ucm \
    --disable-topology \
    --disable-hwdep \
    --disable-rawmidi \
    --disable-alisp

make -j 8

arm-linux-gnueabihf-strip src/.libs/libasound.so.2.0.0

cp src/.libs/libasound.so.2.0.0 "${OUT}"

if [ ! -z "${CHOWN_OUT-}" ]; then
  chown "${CHOWN_OUT}" "${OUT}"
fi

