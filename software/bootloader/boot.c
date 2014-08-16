/*
 * DSI Shield
 *
 * Copyright (C) 2013-2014 twl
 *
 * This program is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/* boot.c - a trivial serial port bootloader for LM32 */

#include <stdint.h>

#include "board.h"
#include "uart.h"

#define USER_START 0x800

int read_blocking(uint8_t *what)
{
	int cnt = 500000;
	int b;
	while(cnt--)
	{ 
		b=uart_read_byte();
		if(b >= 0)
			break;
	}

	if(cnt)
	{
		*what = b;
		return 0;
	}else
		return -1;
}

main()
{
	int i;
	
	int len, boot_active = 0;
	
	uint8_t *ptr = (uint8_t*)USER_START;
	

	
	uart_init_hw();

	again:

	uart_write_byte('B');
	uart_write_byte('o');
	uart_write_byte('o');
	uart_write_byte('t');
	uart_write_byte('?');
	
	for(i=0;i<500000;i++)
		if(uart_read_byte () == 'Y')
		{
			boot_active = 1;
			break;
		}
	
	if(boot_active)
	{
		uint8_t lsb, msb;
		uart_write_byte('O');
		uart_write_byte('K');

		if(read_blocking(&msb) < 0) goto again;
		if(read_blocking(&lsb) < 0) goto again;

		len = (int)msb;
		len <<=8;
		len |= (int)lsb;
		
		for(i=0;i<len;i++)
		{
			if(read_blocking(ptr) < 0)
				goto again;
			ptr++;
		}
		
		uart_write_byte('G');
		uart_write_byte('o');
		uart_write_byte('!');

		void (*f)() = USER_START;	
		f();
		
	} else {
		uart_write_byte('T');
		uart_write_byte('o');
		uart_write_byte('u');
		uart_write_byte('t');

		void (*f)() = USER_START;	
		f();
//		goto again;
	}

	
}
