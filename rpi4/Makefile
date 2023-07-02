toolchain:
	wget -O downloads/cross-gcc-10.2.0-pi_3+.tar.gz \
		https://sourceforge.net/projects/raspberry-pi-cross-compilers/files/Raspberry%20Pi%20GCC%20Cross-Compiler%20Toolchains/Bullseye/GCC%2010.2.0/Raspberry%20Pi%203A%2B%2C%203B%2B%2C%204/cross-gcc-10.2.0-pi_3%2B.tar.gz
	tar -xvf downloads/cross-gcc-10.2.0-pi_3+.tar.gz

kernel:
	mkdir -p downloads
	wget -P downloads \
		http://mirror.archlinuxarm.org/aarch64/core/linux-aarch64-6.2.10-1-aarch64.pkg.tar.xz
	tar -xvf downloads/linux-aarch64*.pkg.tar.* --strip-components=1 boot/Image.gz

busybox:
	mkdir -p downloads
	wget -O downloads/busybox-1.36.1.tar.bz2 \
		https://busybox.net/downloads/busybox-1.36.1.tar.bz2
	tar -C downloads -xvf downloads/busybox*.tar.*
	mkdir -p build/busybox
	cd downloads/busybox-1.36.1 && \
		make O=../../build/busybox \
			CROSS_COMPILE=../../cross-pi-gcc-10.2.0-2/bin/arm-linux-gnueabihf- defconfig && \
		sed -i 's/# CONFIG_STATIC is not set/CONFIG_STATIC=y/' ../../build/busybox/.config && \
		make O=../../build/busybox \
			CROSS_COMPILE=../../cross-pi-gcc-10.2.0-2/bin/arm-linux-gnueabihf- -j4

initrd:
	./build_initramfs.sh

rootfs:
	wget -O downloads/2023-02-21-raspios-bullseye-armhf-lite.img.xz \
		https://downloads.raspberrypi.org/raspios_lite_armhf/images/raspios_lite_armhf-2023-02-22/2023-02-21-raspios-bullseye-armhf-lite.img.xz
	cd downloads && xz -d -k -v 2023-02-21-raspios-bullseye-armhf-lite.img.xz
	./build_rootfs.sh

.PHONY: docker
docker:
	cd docker && docker build -t qemu-rpi4 ..

.PHONY: run
run:
	# X forwarding not yet operational without sudo
	sudo docker run --rm -it -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix qemu-rpi4 /run_qemu.sh
