#!/bin/bash -ex

RPI_ROOTFS_BASE=/opt/qemu-rpi/sysroot

mount --bind /sys ${RPI_ROOTFS_BASE}/sys
mount --bind /proc ${RPI_ROOTFS_BASE}/proc
mount --bind /dev ${RPI_ROOTFS_BASE}/dev
mount --bind /dev/pts ${RPI_ROOTFS_BASE}/dev/pts
mount --bind /tmp ${RPI_ROOTFS_BASE}/tmp

/usr/sbin/chroot /opt/qemu-rpi/sysroot /usr/bin/qemu-aarch64-static /bin/bash $@
