all:	tools bootloader rev2

tools: tools/genraminit tools/genmeminit
	make -C tools

bootloader:  bootloader/boot.bin

bootloader/boot.bin:
	make -C bootloader

rev2: rev2/rev2.bin

rev2/rev2.bin:
	make -C rev2
	make -C rev2 bitstream

clean:
	make -C tools clean
	make -C bootloader clean
	make -C rev2 clean