#!/bin/bash
qemu-system-aarch64 -M virt												\
    -machine virtualization=true -machine virt,gic-version=3					\
    -cpu max,pauth-impdef=on -smp 4 -m 4096										\
    -object rng-random,filename=/dev/urandom,id=rng0							\
    -device virtio-rng-pci,rng=rng0												\
    -device virtio-net-pci,netdev=net0											\
    -netdev user,id=net0,hostfwd=tcp::8022-:22									\
    -drive if=virtio,format=qcow2,file=./rootfs.qcow2							\
    -kernel Image.gz															\
    -initrd initrd.gz 															\
    -append "earlycon loglevel=6 root=/dev/vda2 rootwait rw console=tty0"		\
    -device qemu-xhci,id=ehci													\
    -device VGA,vgamem_mb=64													\
    -device usb-mouse															\
    -device usb-kbd
