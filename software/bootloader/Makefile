# and don't touch the rest unless you know what you're doing.
CROSS_COMPILE ?= /opt/gcc-riscv/bin/riscv64-unknown-elf-

CC =		$(CROSS_COMPILE)gcc
LD =		$(CROSS_COMPILE)ld
OBJDUMP =	$(CROSS_COMPILE)objdump
OBJCOPY =	$(CROSS_COMPILE)objcopy
SIZE =		$(CROSS_COMPILE)size

# keep RV32I: the bootloader also emulates DIV/MULH instuctions

CFLAGS = -g -Os -m32 -msoft-float -march=RV32I -I. -I../common -ffunction-sections -fdata-sections -I../arch -Wall
LDFLAGS = -Wl,--gc-sections 
OBJS = crtboot.o ../common/uart.o ../arch/risc-v/emulate.o ../arch/risc-v/irq.o ../common/flash.o main.o
LDS = boot.ld
OUTPUT= boot

#CFLAGS += -DSIMULATION

$(OUTPUT): $(LDS) $(OBJS)
	${CC} -g  -m32 -Wl,--gc-sections -march=RV32I -o $(OUTPUT).elf $(LDFLAGS) -nostartfiles $(OBJS)  -lm -T $(LDS)
	${OBJCOPY} -O binary $(OUTPUT).elf $(OUTPUT).bin
	${OBJDUMP} -D $(OUTPUT).elf > disasm.S
	$(SIZE) $(OUTPUT).elf
	../tools/genraminit $(OUTPUT).bin 1300 0 0 > $(OUTPUT).ram
	../tools/genmeminit $(OUTPUT).bin 1300 0 0 > $(OUTPUT).mem
	${OBJDUMP} -t $(OUTPUT).elf | sort > syms

clean:
	rm -f $(OUTPUT).elf $(OUTPUT).bin $(OBJS)
	

%.o:	%.S
	${CC} -c -m32 $^ -o $@