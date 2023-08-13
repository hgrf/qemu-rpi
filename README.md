## Raspberry Pi 2 Emulation with versatilepb kernel

### References

- https://openclassrooms.com/fr/courses/5281406-creez-un-linux-embarque-pour-la-domotique/5464241-emulez-une-raspberry-pi-avec-qemu
- https://hackernoon.com/raspberry-pi-cluster-emulation-with-docker-compose-xo3l3tyw
- https://stackoverflow.com/questions/28880833/how-to-emulate-the-raspberry-pi-2-on-qemu/45814913#45814913

## Raspberry Pi 4 Emulation 

### Setup

```sh
cd rpi4
make toolchain
make kernel
make busybox
make initrd
make rootfs
make docker
make run
```

### References

- http://cdn.kernel.org/pub/linux/kernel/people/will/docs/qemu/qemu-arm64-howto.html
- https://kitsunemimi.pw/notes/posts/headless-raspberry-pi-os-virtualization-64-bit-edition.html
- https://rs1.es/tutorials/2021/10/29/x11-forwarding-docker.html#without-ssh
- https://stackoverflow.com/questions/44429394/x11-forwarding-of-a-gui-app-running-in-docker

#### EFI

- https://docs.kernel.org/admin-guide/efi-stub.html
- https://forums.raspberrypi.com/viewtopic.php?t=306511
- https://github.com/pftf/RPi4#installation
- https://pete.akeo.ie/2019/07/installing-debian-arm64-on-raspberry-pi.html
- https://raduzaharia.medium.com/system-emulation-using-qemu-raspberry-pi-4-and-efi-87652ff203b7

#### Others

- https://wiki.beyondlogic.org/index.php?title=Cross_Compiling_BusyBox_for_ARM

### TODO

- make proper make targets
- build in GitHub workflow

## `qemu-rpi-user:` QEMU user mode emulation

### Setup

```
docker pull ghcr.io/hgrf/qemu-rpi-user:v0.1.4
```

### Usage

```
docker run --rm -it --privileged ghcr.io/hgrf/qemu-rpi-user:v0.1.4
```

### References

- https://github.com/abhiTronix/rpi_rootfs
- https://github.com/multiarch/qemu-user-static
- http://sentryytech.blogspot.com/2013/02/faster-compiling-on-emulated-raspberry.html
- https://wiki.debian.org/Arm64Qemu

### TODO

- `chroot-helper.sh`: only do bind mounts if not already mounted

#### debootstrap

- https://raspberrypi.stackexchange.com/a/78287

## TODO

- put rootfs modifications and other shared deps in a base image
