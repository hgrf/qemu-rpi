#!/bin/bash -ex

# root.tar.xz is from 2022-04-04, we should use the image below instead
# wget https://downloads.raspberrypi.org/raspios_lite_arm64/root.tar.xz
# mkdir -p /opt/qemu-rpi/sysroot
# tar -xvf root.tar.xz -C /opt/qemu-rpi/sysroot
# rm root.tar.xz

wget https://downloads.raspberrypi.org/raspios_lite_arm64/images/raspios_lite_arm64-2023-05-03/2023-05-03-raspios-bullseye-arm64-lite.img.xz && \
mkdir -p /opt/qemu-rpi/sysroot
xz -d 2023-05-03-raspios-bullseye-arm64-lite.img.xz
guestfish -a 2023-05-03-raspios-bullseye-arm64-lite.img -m /dev/sda2 <<EOF
    copy-out / /opt/qemu-rpi/sysroot
    exit
EOF
rm 2023-05-03-raspios-bullseye-arm64-lite.img
