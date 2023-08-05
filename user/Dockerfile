FROM ubuntu:22.04

RUN apt update && \
    apt install -y \
        binfmt-support \
        guestfish \
        linux-image-5.19.0-46-generic \
        qemu-user-static \
        wget \
        xz-utils \
        && \
    rm -rf /var/lib/apt/lists/*

# TODO: isolate guestfish stuff

COPY build-rootfs.sh /usr/bin/build-rootfs.sh

RUN /usr/bin/build-rootfs.sh && \
    cp /usr/bin/qemu-aarch64-static /opt/qemu-rpi/sysroot/usr/bin/

COPY chroot-helper.sh /usr/bin/chroot-helper.sh

CMD [ "/usr/bin/chroot-helper.sh" ]
