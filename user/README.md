## Setup

```
docker build -t qemu-rpi-user .
```

## Usage

```
docker run --rm -it --privileged qemu-rpi-user
```

## References

- https://github.com/abhiTronix/rpi_rootfs
- https://github.com/multiarch/qemu-user-static
- http://sentryytech.blogspot.com/2013/02/faster-compiling-on-emulated-raspberry.html
- https://wiki.debian.org/Arm64Qemu

### debootstrap

- https://raspberrypi.stackexchange.com/a/78287
