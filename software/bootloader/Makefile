# and don't touch the rest unless you know what you're doing.
CROSS_COMPILE ?= /opt/gcc-riscv/bin/riscv64-unknown-elf-

CC =		$(CROSS_COMPILE)gcc
LD =		$(CROSS_COMPILE)ld
OBJDUMP =	$(CROSS_COMPILE)objdump
OBJCOPY =	$(CROSS_COMPILE)objcopy
SIZE =		$(CROSS_COMPILE)size

SYN_DIR=../../syn/rev2
SYN_TOP_LEVEL=rev2_top

# keep RV32I: the bootloader also emulates DIV/MULH instuctions

CFLAGS = -g -Os -m32 -msoft-float -march=RV32I -I. -I../common -ffunction-sections -fdata-sections # -DSIMULATION
LDFLAGS = -Wl,--gc-sections 
OBJS = crtboot.o  boot.o ../common/uart.o ../arch/risc-v/emulate.o ../arch/risc-v/irq.o 
LDS = boot.ld
OUTPUT= boot

$(OUTPUT): $(LDS) $(OBJS)
	${CC} -g  -m32 -Wl,--gc-sections -march=RV32I -o $(OUTPUT).elf $(LDFLAGS) -nostartfiles $(OBJS)  -lm -T $(LDS)
	${OBJCOPY} -O binary $(OUTPUT).elf $(OUTPUT).bin
	${OBJDUMP} -D $(OUTPUT).elf > disasm.S
	$(SIZE) $(OUTPUT).elf
	../tools/genraminit $(OUTPUT).bin 512 0 0 > $(OUTPUT).ram
	../tools/genmeminit $(OUTPUT).bin 512 0 0 > $(OUTPUT).mem

clean:
	rm -f $(OUTPUT).elf $(OUTPUT).bin $(OBJS)

bitstream: $(OUTPUT)
	data2mem -o b $(SYN_TOP_LEVEL)_$(OUTPUT).bit -bt $(SYN_DIR)/$(SYN_TOP_LEVEL).bit -bm $(SYN_DIR)/$(SYN_TOP_LEVEL)_bd.bmm -bd $(OUTPUT).mem tag urv_iram
#	data2mem -bx 1 -bt $(SYN_DIR)/$(SYN_TOP_LEVEL).bit -bm $(SYN_DIR)/$(SYN_TOP_LEVEL)_bd.bmm -bd $(OUTPUT).mem tag urv_iram
	

%.o:	%.S
	${CC} -c -m32 $^ -o $@