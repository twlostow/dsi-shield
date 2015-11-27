/*
 * This work is part of the White Rabbit project
 *
 * Copyright (C) 2011,2012 CERN (www.cern.ch)
 * Author: Tomasz Wlostowski <tomasz.wlostowski@cern.ch>
 * Author: Grzegorz Daniluk <grzegorz.daniluk@cern.ch>
 *
 * Released according to the GNU GPL, version 2 or any later version.
 */
#include "board.h"
#include "sysctl.h"

#define I2C_DELAY 300

void mi2c_delay()
{
	int i;
	for (i = 0; i < I2C_DELAY; i++)
		asm volatile ("nop");
}


void M_SDA_OUT(int if_, int v) 
{ 
    mi2c_delay();
    uint32_t cur = readl(SYS_GPIO_OUT);
    if(v)
	cur &= ~SYS_GPIO_OUT_SDA;
    else
	cur |= SYS_GPIO_OUT_SDA;
//    pp_printf("write %x\n", cur);
    writel(SYS_GPIO_OUT, cur);
}

void M_SCL_OUT(int if_, int v) 
{ 
    mi2c_delay();
    uint32_t cur = readl(SYS_GPIO_OUT);
    if(v)
	cur &= ~SYS_GPIO_OUT_SCL;
    else
	cur |= SYS_GPIO_OUT_SCL;

    writel(SYS_GPIO_OUT, cur);
}

int M_SDA_IN(int i)
{
    mi2c_delay();
    return ( readl(SYS_GPIO_IN) & SYS_GPIO_IN_SDA ) ? 1: 0;
}

void mi2c_start(uint8_t i2cif)
{
	M_SDA_OUT(i2cif, 0);
	M_SCL_OUT(i2cif, 0);
}

void mi2c_repeat_start(uint8_t i2cif)
{
	M_SDA_OUT(i2cif, 1);
	M_SCL_OUT(i2cif, 1);
	M_SDA_OUT(i2cif, 0);
	M_SCL_OUT(i2cif, 0);
}

void mi2c_stop(uint8_t i2cif)
{
	M_SDA_OUT(i2cif, 0);
	M_SCL_OUT(i2cif, 1);
	M_SDA_OUT(i2cif, 1);
}

unsigned char mi2c_put_byte(uint8_t i2cif, unsigned char data)
{
	char i;
	unsigned char ack;

	for (i = 0; i < 8; i++, data <<= 1) {
		M_SDA_OUT(i2cif, data & 0x80);
		M_SCL_OUT(i2cif, 1);
		M_SCL_OUT(i2cif, 0);
	}

	M_SDA_OUT(i2cif, 1);
	M_SCL_OUT(i2cif, 1);


	
	ack = M_SDA_IN(i2cif);	/* ack: sda is pulled low ->success.     */
//	printf("SDA State: %d\n", ack);

	M_SCL_OUT(i2cif, 0);
	M_SDA_OUT(i2cif, 0);

	return ack != 0;
}

void mi2c_get_byte(uint8_t i2cif, unsigned char *data, uint8_t last)
{

	int i;
	unsigned char indata = 0;

	M_SDA_OUT(i2cif, 1);
	/* assert: scl is low */
	M_SCL_OUT(i2cif, 0);

	for (i = 0; i < 8; i++) {
		M_SCL_OUT(i2cif, 1);
		indata <<= 1;
		if (M_SDA_IN(i2cif))
			indata |= 0x01;
		M_SCL_OUT(i2cif, 0);
	}

	if (last) {
		M_SDA_OUT(i2cif, 1);	//noack
		M_SCL_OUT(i2cif, 1);
		M_SCL_OUT(i2cif, 0);
	} else {
		M_SDA_OUT(i2cif, 0);	//ack
		M_SCL_OUT(i2cif, 1);
		M_SCL_OUT(i2cif, 0);
	}

	*data = indata;
}

void mi2c_init(uint8_t i2cif)
{
	M_SCL_OUT(i2cif, 1);
	M_SDA_OUT(i2cif, 1);
}

uint8_t mi2c_devprobe(uint8_t i2cif, uint8_t i2c_addr)
{
	uint8_t ret;
	mi2c_start(i2cif);
	ret = !mi2c_put_byte(i2cif, i2c_addr << 1);
	mi2c_stop(i2cif);

	return ret;
}

void mi2c_scan(uint8_t i2cif)
{
    int i;

    for(i=0;i<0xff;i+=2)
    {
     mi2c_start(i2cif);
     if(!mi2c_put_byte(i2cif, i)) pp_printf("found : %x\n", i); 
     mi2c_stop(i2cif);

    }
}