FROM ubuntu:22.04

RUN apt update && \
    apt install -y qemu-system-aarch64

COPY ../Image.gz /
COPY ../initrd.gz /
COPY ../rootfs.qcow2 /

COPY ../run_qemu.sh /
RUN apt install -y seabios xauth x11-apps
