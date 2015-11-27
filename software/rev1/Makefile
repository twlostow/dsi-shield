
CROSS_COMPILE ?= /opt/gcc-riscv-5.2.0/bin/riscv64-unknown-elf-

SYN_DIR=../../hdl/syn/rev2
SYN_TOP_LEVEL=rev2_top

CC =		$(CROSS_COMPILE)gcc
LD =		$(CROSS_COMPILE)ld
OBJDUMP =	$(CROSS_COMPILE)objdump
OBJCOPY =	$(CROSS_COMPILE)objcopy
SIZE =		$(CROSS_COMPILE)size

ARCH = RV32I

CFLAGS = -g -m32  -Os  -msoft-float -march=$(ARCH)  -I. -I../common -ffunction-sections -fdata-sections 
LDFLAGS = -m32 -Wl,--gc-sections -g  -msoft-float  -march=$(ARCH) -nostartfiles
OBJS = ../arch/risc-v/crtuser.o ../common/libhpdmc-c.o ../common/uart.o  main.o ../common/vsprintf-xint.o ../common/printf.o memtest.o dsi_core.o fonts/font_helv17.o panels.o  fb.o i2c.o pll.o
LDS = ../arch/risc-v/user.ld
OUTPUT=rev2

$(OUTPUT): $(LDS) $(OBJS)
	${CC} $(LDFLAGS) -o $(OUTPUT).elf  $(OBJS)  -lm -T $(LDS) -lc
	${OBJCOPY} -O binary $(OUTPUT).elf $(OUTPUT).bin
	${OBJDUMP} -D $(OUTPUT).elf > disasm.S
	$(SIZE) $(OUTPUT).elf

clean:
	rm -f $(OUTPUT).elf $(OUTPUT).bin $(OBJS)

%.o:	%.S
	${CC} -c -m32 -march=RV32IM $^ -o $@

bitstream:
	dd if=/dev/zero of=_tmp.bin bs=1 count=16384
	dd if=../bootloader/boot.bin of=_tmp.bin bs=1 count=2560 conv=notrunc
	dd if=$(OUTPUT).bin of=_tmp.bin bs=1 count=14000 seek=2560 conv=notrunc
	../tools/genmeminit _tmp.bin 4096 > _tmp.mem
	../tools/genraminit _tmp.bin 4096 > rev1.ram

	data2mem -o b $(SYN_TOP_LEVEL)_$(OUTPUT).bit -bt $(SYN_DIR)/$(SYN_TOP_LEVEL).bit -bm $(SYN_DIR)/$(SYN_TOP_LEVEL)_bd.bmm -bd _tmp.mem tag urv_iram
	promgen -p mcs -o rev2.mcs -spi -u 0 $(SYN_TOP_LEVEL)_$(OUTPUT).bit  -w

load:
	- killall -9 uart-bootloader.py
	../uart-bootloader.py rev2.bin