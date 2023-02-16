FROM retrostick-base

COPY RetroArch/out/retroarch /squashfs-root/retroarch/
COPY rootfs/compile.sh /build/

ENTRYPOINT ["bash", "/build/compile.sh"]
