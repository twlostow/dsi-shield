CROSS_COMPILE ?= /opt/gcc-riscv-5.2.0/bin/riscv64-unknown-elf-

BIN_DIR=../bin

SYN_DIR=../../hdl/syn/rev2
SYN_TOP_LEVEL=rev2_top

CC =		$(CROSS_COMPILE)gcc
LD =		$(CROSS_COMPILE)ld
OBJDUMP =	$(CROSS_COMPILE)objdump
OBJCOPY =	$(CROSS_COMPILE)objcopy
SIZE =		$(CROSS_COMPILE)size

ARCH = RV32IM

CFLAGS = -g -m32  -Os  -msoft-float -march=$(ARCH)  -I. -I../common -ffunction-sections -fdata-sections 
LDFLAGS = -m32  -g  -msoft-float  -march=$(ARCH) -nostartfiles -Wl,--gc-sections
OBJS = ../arch/risc-v/crtuser.o ../common/libhpdmc-c.o ../common/uart.o  main.o ../common/vsprintf-xint.o ../common/printf.o dsi_core.o fonts/font_helv17.o  fb.o i2c.o pll.o flash.o config.o panels/iphone4.o panels/panels.o panels/e980.o menu.o
LDS = ../arch/risc-v/user.ld
OUTPUT=rev2

# CFLAGS += -DSIMULATION

REVISION=$(shell git describe --dirty --always)

$(OUTPUT): $(LDS) $(OBJS)
	echo "const char *build_revision = \"$(REVISION)\";" > git-revision.c
	echo "const char *build_date = __DATE__ \", \" __TIME__ ;" >> git-revision.c
	${CC} $(CFLAGS) -c git-revision.c -o git-revision.o
	${CC} $(LDFLAGS) -o $(OUTPUT).elf  $(OBJS) git-revision.o -lm -T $(LDS) -lc
	${OBJCOPY} -O binary $(OUTPUT).elf $(OUTPUT).bin
	${OBJDUMP} -D $(OUTPUT).elf > disasm.S
	${OBJDUMP} -t $(OUTPUT).elf | sort > syms
	$(SIZE) $(OUTPUT).elf
	scp -P 12345 rev2.bin twl@localhost:~/gw

clean:
	rm -f $(OUTPUT).elf $(OUTPUT).bin $(OBJS)

%.o:	%.S
	${CC} -c -m32 -march=RV32IM $^ -o $@

%.o:	%.c
	${CC} -c $(CFLAGS) $^ -o $@

bitstream:
	dd if=/dev/zero of=_tmp.bin bs=1 count=32768
	dd if=../bootloader/boot.bin of=_tmp.bin bs=1 count=2560 conv=notrunc
#	dd if=$(OUTPUT).bin of=_tmp.bin bs=1 count=14000 seek=2560 conv=notrunc
	../tools/genmeminit _tmp.bin 8192 > _tmp.mem
	../tools/genraminit _tmp.bin 8192 > rev1.ram

	data2mem -o b $(BIN_DIR)/$(OUTPUT).bit -bt $(SYN_DIR)/$(SYN_TOP_LEVEL).bit -bm $(SYN_DIR)/$(SYN_TOP_LEVEL)_bd.bmm -bd _tmp.mem tag urv_iram
#	data2mem -o v $(SYN_TOP_LEVEL)_$(OUTPUT).v -bt $(SYN_DIR)/$(SYN_TOP_LEVEL).bit -bm $(SYN_DIR)/$(SYN_TOP_LEVEL)_bd.bmm -bd _tmp.mem tag urv_iram
	promgen -p mcs -o $(BIN_DIR)/rev2.mcs -spi -u 0 $(BIN_DIR)/$(OUTPUT).bit  -w
	rm -f _tmp.bin _tmp.mem

load:
	- killall -9 uart-bootloader.py
	../uart-bootloader.py rev2.bin
	com /dev/ttyUSB0 115200