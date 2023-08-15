PWD=$(shell pwd)

.PHONY: docker
docker:
	docker build -t qemu-rpi1 .

.PHONY: run
run:
	# X forwarding not yet operational without sudo
	xhost +
	sudo docker run --rm -it -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix qemu-rpi1

.PHONY: requirements
requirements:
	wget https://downloads.raspberrypi.org/raspios_lite_armhf/images/raspios_lite_armhf-2023-02-22/2023-02-21-raspios-bullseye-armhf-lite.img.xz
	xz -d -v 2023-02-21-raspios-bullseye-armhf-lite.img.xz

	wget https://github.com/dhruvvyas90/qemu-rpi-kernel/raw/9fb4fcf463df4341dbb7396df127374214b90841/kernel-qemu-5.10.63-bullseye
	wget https://github.com/dhruvvyas90/qemu-rpi-kernel/raw/9fb4fcf463df4341dbb7396df127374214b90841/versatile-pb-bullseye-5.10.63.dtb

.PHONY: run-qemu
run-qemu: # versatilepb, RAM limited to 256MB
	qemu-system-arm \
		-M versatilepb \
		-cpu arm1176 \
		-kernel /kernel-qemu-5.10.63-bullseye \
		-append "root=/dev/sda2 rootfstype=ext4 rw" \
		-hda /2023-02-21-raspios-bullseye-armhf-lite.img \
		-m 256 \
		-dtb /versatile-pb-bullseye-5.10.63.dtb \
		-serial stdio \
		-no-reboot \
		-net user,hostfwd=tcp::10022-:22 \
		-net nic
