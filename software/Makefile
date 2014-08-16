all:	bootloader rev1
	dd if=rev1/rev1.bin of=bootloader/boot.bin seek=2048 bs=1
	./common/genraminit bootloader/boot.bin 4096 > bootloader/boot.ram

bootloader:  bootloader/boot.bin

bootloader/boot.bin:
	make -C bootloader

rev1: 	rev1/rev1.bin
	

rev1/rev1.bin:
	make -C rev1


clean:
	make -C bootloader clean
	make -C rev1 clean