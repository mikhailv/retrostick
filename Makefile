export DEVICE_NAME ?= gamesticklite-v5

.PHONY: all
all: base alsa retroarch rootfs

.PHONY: base
base:
	cd base && ./build.sh

.PHONY: alsa
alsa:
	$(MAKE) -C lib/alsa

.PHONY: retroarch
retroarch:
	$(MAKE) -C RetroArch

.PHONY: rootfs
rootfs:
	$(MAKE) -C rootfs

.PHONY: clean
clean:
	$(MAKE) -C lib/alsa clean
	$(MAKE) -C RetroArch clean
	$(MAKE) -C rootfs clean
