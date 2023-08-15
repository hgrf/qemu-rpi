FROM ubuntu:22.04

RUN apt update && \
    apt install -y \
        make \
        qemu-system-arm \
        wget \
        xz-utils \
        && \
    rm -rf /var/lib/apt/lists/*

COPY ./Makefile /
RUN make requirements

CMD ["/usr/bin/make", "run-qemu"]
