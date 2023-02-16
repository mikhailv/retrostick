FROM debian:11.6-slim

RUN apt update && apt upgrade -y
# toolchain packages are pretty big - installing them as separate layer
RUN apt install -y gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf
# install other tools as separate layer after toolchain
RUN apt install -y openssl git make autoconf automake libtool squashfs-tools
# install required libraries to get headers
RUN apt install -y libudev-dev libxkbcommon-dev libgbm-dev libdrm-dev libasound2-dev libgles-dev libfreetype-dev libssl-dev

VOLUME /build/out

ARG DEVICE_NAME

# unpack squashfs dump
COPY "devices/${DEVICE_NAME}/rootfs.squashfs" /rootfs.squashfs
RUN unsquashfs /rootfs.squashfs

# copy required libraries for ARM from dumped rootfs
RUN bash -c 'cp /squashfs-root/usr/lib/lib{EGL,GL,Mali,mali,asound,crypto,drm,freetype,gbm,jpeg,png,ssl,udev,xkbcommon,z}* \
                /squashfs-root/lib/librt* \
                /usr/lib/arm-linux-gnueabihf/'

WORKDIR /build
