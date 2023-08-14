download:
	wget https://downloads.raspberrypi.org/raspios_lite_armhf/images/raspios_lite_armhf-2023-02-22/2023-02-21-raspios-bullseye-armhf-lite.img.xz
	xz -d -v 2023-02-21-raspios-bullseye-armhf-lite.img.xz

grub:
	wget http://ftp.fr.debian.org/debian/pool/main/g/grub2/grub-efi-arm64-bin_2.06-3~deb11u5_arm64.deb
	# TODO: could do MD5 check here
	ar x grub-efi-arm64-bin_2.06-3~deb11u5_arm64.deb data.tar.xz
	tar -xf data.tar.xz
	rm data.tar.xz
	rm grub-efi-arm64-bin_2.06-3~deb11u5_arm64.deb

	sudo losetup -Pf --show 2023-02-21-raspios-bullseye-armhf-lite.img | (read LOOPDEV; \
		mkdir -p mnt; \
		sudo mount $${LOOPDEV}p1 mnt; \
		sudo grub-install --directory=./usr/lib/grub/arm64-efi --target=arm64-efi --boot-directory=./mnt --efi-directory=./mnt $$LOOPDEV; \
		sudo cp grub.cfg mnt/grub/; \
		sudo cp ../rpi4/Image.gz mnt/; \
		sudo cp ../rpi4/initrd.gz mnt/; \
		sudo umount mnt; \
		rmdir mnt; \
		sudo losetup --detach $$LOOPDEV; \
	)

	rm -rf usr

run:
	# TODO: full image is not needed since we have rootfs.qcow2
	qemu-system-aarch64 \
		-machine virt \
		-smp 8 \
		-m 2G \
		-cpu cortex-a72 \
		-bios /usr/share/qemu-efi-aarch64/QEMU_EFI.fd \
		-boot menu=on \
		-serial stdio \
	    -drive if=virtio,format=qcow2,file=../rpi4/rootfs.qcow2 \
		-drive if=none,file=./2023-02-21-raspios-bullseye-armhf-lite.img,format=raw,id=hd \
		-device qemu-xhci \
		-device usb-storage,drive=hd \
		-device VGA
