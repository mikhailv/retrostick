export DEVICE_NAME ?= gamesticklite-v5

.PHONY: all
all: base retroarch rootfs

.PHONY: base
base:
	cd base && ./build.sh

.PHONY: retroarch
retroarch:
	$(MAKE) -C RetroArch

.PHONY: rootfs
rootfs:
	$(MAKE) -C rootfs

.PHONY: clean
clean:
	$(MAKE) -C RetroArch clean
	$(MAKE) -C rootfs clean
