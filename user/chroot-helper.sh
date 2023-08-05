#!/bin/bash -ex

mount --bind /sys ${RPI_ROOTFS_BASE}/sys
mount --bind /proc ${RPI_ROOTFS_BASE}/proc
mount --bind /dev ${RPI_ROOTFS_BASE}/dev
mount --bind /dev/pts ${RPI_ROOTFS_BASE}/dev/pts

/usr/sbin/chroot /opt/qemu-rpi/sysroot /usr/bin/qemu-aarch64-static /bin/bash
