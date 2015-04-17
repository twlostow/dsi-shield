# and don't touch the rest unless you know what you're doing.
CROSS_COMPILE ?= lm32-elf-

CC =		$(CROSS_COMPILE)gcc
LD =		$(CROSS_COMPILE)ld
OBJDUMP =	$(CROSS_COMPILE)objdump
OBJCOPY =	$(CROSS_COMPILE)objcopy
SIZE =		$(CROSS_COMPILE)size

CFLAGS = -Os -I../common -I.  -mmultiply-enabled -mbarrel-shift-enabled -ffunction-sections -fdata-sections
OBJS = boot-crt0.o ../common/uart.o boot.o
LDS = boot.ld
LDFLAGS =  -mmultiply-enabled -mbarrel-shift-enabled -Wl,--gc-sections
OUTPUT=boot

$(OUTPUT): $(LDS) $(OBJS)
	gcc -o ../common/genraminit ../common/genraminit.c
	${CC} -o bootldr.elf -nostartfiles $(OBJS) -T $(LDS) -lgcc -lc
	${OBJCOPY} -O binary bootldr.elf bootldr.bin
	$(SIZE) bootldr.elf
	dd if=/dev/zero of=$(OUTPUT).bin bs=2048 count=1
	dd if=bootldr.bin of=$(OUTPUT).bin seek=0 conv=notrunc
	dd if=../rev1/rev1.bin of=$(OUTPUT).bin bs=1 seek=2048 conv=notrunc
	../common/genraminit $(OUTPUT).bin 512 > boot.ram

clean:
	rm -f $(OBJS) $(OUTPUT).bin