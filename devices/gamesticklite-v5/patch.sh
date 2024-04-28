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
rm ${ROOT}/etc/{.fstab.swp,MiniGUI.cfg,drirc,dropbear,mtab,resolv.conf,retroarch.cfg}
rm ${ROOT}/etc/init.d/{.usb_config,.S50ui.swp,testui}
rm ${ROOT}/etc/init.d/{S21mountall.sh,S40network,S49usbdevice,S50dropbear,S50ui}
rm ${ROOT}/init
rm ${ROOT}/lib/libhq2x.so
rm ${ROOT}/lib/libsqlite*
rm ${ROOT}/tmp/.gitkeep
rm ${ROOT}/udisk
rm ${ROOT}/usr/bin/{game,game_nosdcard,retroarch,retroarch-cg2glsl,sqlite3}
rm ${ROOT}/usr/bin/{dbclient,dropbearconvert,dropbearkey,drm-hotplug.sh,scp,ssh}
rm ${ROOT}/usr/bin/{glmarktest.sh,gstaudiotest.sh,gstmp3play.sh,gstmp4play.sh,gstvideoplay.sh,gstvideotest.sh,gstwavplay.sh}
rm ${ROOT}/usr/bin/{kms-steal-crtc,kmstest,kms-universal-planes}
rm ${ROOT}/usr/bin/{modeprint,modetest,mp3play.sh,resize-helper,vbltest,waylandtest.sh}
rm ${ROOT}/usr/etc/MiniGUI.cfg
rm ${ROOT}/usr/lib/libmali-utgard-400-r7p0-gbm.so
rm ${ROOT}/usr/lib/libminigui*
rm ${ROOT}/usr/sbin/dropbear
rm -r ${ROOT}/media/
rm -r ${ROOT}/userdata/
rm -r ${ROOT}/usr/local/share/minigui/
rm -r ${ROOT}/usr/share/{applications,libdrm,minigui,pixmaps,udhcpc}/

# Alsa cleanup
rm ${ROOT}/usr/sbin/alsaconf
rm ${ROOT}/usr/bin/{alsamixer,amixer,arecord,aserver}
rm ${ROOT}/usr/bin/av_{config,helper}.sh
rm ${ROOT}/usr/share/alsa/init/{ca0106,hda,test}
rm ${ROOT}/usr/share/alsa/sndo-mixer.alisp
rm -r ${ROOT}/usr/share/alsa/{cards,pcm,speaker-test,topology,ucm}/

# replace password for root to 123123
sed -i 's|$1$D365DXgu$l9XMXAsQyIkGBYcpisM531|$1$x$TKe3ZXqjjInoY/fk1nwNT/|g' ${ROOT}/etc/shadow
cp -R ./files/* "${ROOT}"

chmod -x ${ROOT}/etc/fstab
chown -R 0:0 ${ROOT}/retroarch
