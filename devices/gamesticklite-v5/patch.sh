#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

# don't make this file executable, very dangerous to run it locally

ROOT=$(echo "${ROOT-}" | xargs) # trim spaces

if [ -z "${ROOT}" ]; then
  echo "ROOT path is empty"
  exit 1
fi

rm ${ROOT}/.gitkeep
rm ${ROOT}/data
rm ${ROOT}/dev/log
rm ${ROOT}/etc/.fstab.swp
rm ${ROOT}/etc/MiniGUI.cfg
rm ${ROOT}/etc/drirc
rm ${ROOT}/etc/dropbear
rm ${ROOT}/etc/init.d/.usb_config
rm ${ROOT}/etc/init.d/.S50ui.swp
rm ${ROOT}/etc/init.d/S21mountall.sh
rm ${ROOT}/etc/init.d/S40network
rm ${ROOT}/etc/init.d/S49usbdevice
rm ${ROOT}/etc/init.d/S50dropbear
rm ${ROOT}/etc/init.d/S50ui
rm ${ROOT}/etc/init.d/testui
rm ${ROOT}/etc/mtab
rm ${ROOT}/etc/resolv.conf
rm ${ROOT}/etc/retroarch.cfg
rm ${ROOT}/init
rm ${ROOT}/lib/libhq2x.so
rm ${ROOT}/lib/libsqlite*
rm ${ROOT}/tmp/.gitkeep
rm ${ROOT}/udisk
rm ${ROOT}/usr/bin/game
rm ${ROOT}/usr/bin/game_nosdcard
rm ${ROOT}/usr/bin/retroarch
rm ${ROOT}/usr/bin/retroarch-cg2glsl
rm ${ROOT}/usr/bin/sqlite3
rm ${ROOT}/usr/etc/MiniGUI.cfg
rm ${ROOT}/usr/lib/libmali-utgard-400-r7p0-gbm.so
rm ${ROOT}/usr/lib/libminigui*
rm ${ROOT}/usr/sbin/dropbear
rm -r ${ROOT}/media/
rm -r ${ROOT}/userdata/
rm -r ${ROOT}/usr/local/share/minigui/
rm -r ${ROOT}/usr/share/applications/
rm -r ${ROOT}/usr/share/minigui/
rm -r ${ROOT}/usr/share/pixmaps/

# replace password for root to 123123
sed -i 's|$1$D365DXgu$l9XMXAsQyIkGBYcpisM531|$1$x$TKe3ZXqjjInoY/fk1nwNT/|g' ${ROOT}/etc/shadow
cp -R ./files/* "${ROOT}"

chmod -x ${ROOT}/etc/fstab
chown -R 0:0 ${ROOT}/retroarch
