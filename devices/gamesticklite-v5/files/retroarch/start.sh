#!/bin/sh

BASE=/retroarch
BASE_HOME=/

SD=/mnt/sdcard
SD_RA="$SD/retroarch"
SD_ROMS="$SD/roms"

mkdir -p "$SD_ROMS" "$SD_RA"

# copy files if not exist
{ test -f "$SD_RA/retroarch" || cp "$BASE/retroarch" "$SD_RA/retroarch"; }
{ test -f "$SD_RA/retroarch.cfg" || cp "$BASE/retroarch.cfg" "$SD_RA/retroarch.cfg"; }
{ test -d "$SD_RA/autoconfig" || cp -r "$BASE/autoconfig" "$SD_RA/autoconfig"; }

# start custom retroarch/start.sh from sdcard if exists
if [[ -f "$SD_RA/start.sh" ]]; then
  "$SD_RA/start.sh"
  exit $?
fi

export ROMS_HOME="$SD_ROMS" # start directory to scan content in RetroArch

if [[ -f "$SD_RA/retroarch" ]]; then
  export XDG_CONFIG_HOME="$SD"
  "$SD_RA/retroarch" -v --log-file /dev/console
else
  export XDG_CONFIG_HOME="$BASE_HOME"
  "$BASE/retroarch" -v --log-file /dev/console
fi
