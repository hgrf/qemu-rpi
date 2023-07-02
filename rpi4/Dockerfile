FROM ubuntu:22.04

RUN apt update && \
    apt install -y \
        qemu-system-aarch64 \
        seabios \
        ssh \
        sshpass \
        && \
    rm -rf /var/lib/apt/lists/*

COPY ./Image.gz /
COPY ./initrd.gz /
COPY ./rootfs0.qcow2 /
COPY ./rootfs.qcow2 /
COPY ./run_qemu.sh /
COPY ./run_qemu_nographic.sh /
COPY ./init_qemu.sh /

RUN /init_qemu.sh