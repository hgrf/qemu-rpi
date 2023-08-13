download:
	wget https://downloads.raspberrypi.org/raspios_lite_armhf/images/raspios_lite_armhf-2023-02-22/2023-02-21-raspios-bullseye-armhf-lite.img.xz
	xz -d -v 2023-02-21-raspios-bullseye-armhf-lite.img.xz

kernel:
	fdisk -l 2023-02-21-raspios-bullseye-armhf-lite.img | grep .img1 | (read _ STARTSECTOR _; OFFSET=`expr $$STARTSECTOR \* 512`; \
		mkdir -p mnt && \
		sudo mount -o loop,offset=$$OFFSET 2023-02-21-raspios-bullseye-armhf-lite.img mnt; \
	)
	cp mnt/kernel7.img .
	cp mnt/bcm2709-rpi-2-b.dtb .
	sudo umount -l mnt
	rmdir mnt

resize:
	qemu-img resize 2023-02-21-raspios-bullseye-armhf-lite.img 4G

	# now reconfigure inside qemu, see
	# http://sentryytech.blogspot.com/2013/02/faster-compiling-on-emulated-raspberry.html

run: # raspi2b, USB does not work
	qemu-system-arm \
		-M raspi2b \
		-cpu arm1176 \
		-kernel ./kernel7.img \
		-append "root=/dev/mmcblk0p2 rootfstype=ext4 rootwait rw console=ttyAMA0,115200 dwc_otg.lpm_enable=0" \
		-sd ./2023-02-21-raspios-bullseye-armhf-lite.img \
		-m 1G \
		-smp 4 \
		-dtb ./bcm2709-rpi-2-b.dtb \
		-serial stdio \
		-no-reboot \
		#-device usb \
		#-device usb-mouse \
		#-device usb-kbd \
		#-device usb-net,netdev=eth0 -netdev user,id=eth0		# - https://stackoverflow.com/a/69182218
