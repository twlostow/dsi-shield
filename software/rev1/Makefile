CROSS_COMPILE ?= lm32-elf-

CC =		$(CROSS_COMPILE)gcc
LD =		$(CROSS_COMPILE)ld
OBJDUMP =	$(CROSS_COMPILE)objdump
OBJCOPY =	$(CROSS_COMPILE)objcopy
SIZE =		$(CROSS_COMPILE)size

CFLAGS = -Os -I../common -I. -I../testscreen -mmultiply-enabled -mbarrel-shift-enabled  -ffunction-sections -fdata-sections -Wl,--gc-sections
OBJS = ../common/crt0.o ../common/libhpdmc.o ../common/uart.o  main.o  ../common/vsprintf-xint.o ../common/printf.o memtest.o dsi_core.o fonts/font_helv17.o panels.o  fb.o pll.o
LDS = ../common/cpu.ld
OUTPUT=rev1

$(OUTPUT): $(LDS) $(OBJS)
	${CC} $(CFLAGS) -o $(OUTPUT).elf -nostartfiles $(OBJS) -T $(LDS) -lgcc -lc
	${OBJCOPY} -O binary $(OUTPUT).elf $(OUTPUT).bin
	${OBJDUMP} -D $(OUTPUT).elf  > disasm.S
	$(SIZE) $(OUTPUT).elf

clean:
	rm -f $(OBJS) $(OUTPUT).bin

load: 	$(OUTPUT)
	../bootloader.py rev1.bin