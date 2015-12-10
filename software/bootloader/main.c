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

/* main.c - main LM32 application */

#include <stdint.h>
#include <stdio.h>

#include "board.h"
#include "flash.h"
#include "uart.h"

#define CMD_INIT 1
#define CMD_ERASE_SECTOR 2
#define CMD_WRITE_PAGE 3
#define CMD_WRITE_RAM 4
#define CMD_GO 5

#define RSP_OK 1
#define RSP_HELLO 5
#define RSP_CRC_ERROR 2
#define RSP_VERIFY_ERROR 3
#define RSP_BAD_CRC 4

#define POLY 0x8408

#define RX_BUF_SIZE (256 + 16)

#define BOOT_TIMEOUT 500
#define UART_TIMEOUT 2000

#define USER_START 0x1400

uint8_t rxbuf[RX_BUF_SIZE];
int boot_wait;

typedef void (*voidfunc_t)();

uint16_t crc_xmodem_update (uint16_t crc, uint8_t data)
{
    int i;
    crc = crc ^ ( ((uint16_t)data) << 8);

for (i=0; i<8; i++)
{
if (crc & 0x8000)
{
crc = (crc << 1) ^ 0x1021;
} else {
crc <<= 1;
}
}
return crc;
}

uint16_t
crc16(unsigned char *buf, int len)
{
    int i;
    uint16_t cksum;

    cksum = 0;
    for (i = 0;  i < len;  i++) {
	cksum = crc_xmodem_update(cksum, buf[i]);
    }
    return cksum;
}

int timeout_hit = 0;


uint8_t uart_read_blocking()
{
    uint32_t t_end = get_ms_ticks() + UART_TIMEOUT;

    while(get_ms_ticks() < t_end)
	if ( uart_poll() )
	    return uart_read_byte();

    timeout_hit = 1;

    return 0;
}

void uart_readm_blocking(uint8_t *buf, int count)
{
    int i;

    for(i= 0; i < count;i++)
    {
	buf[i] = uart_read_blocking();
	if(timeout_hit)
	    return;
    }
}

void send_reply(uint8_t code)
{
    uint8_t buf[16];
    uint16_t crc, i;
    buf[0] = 0x55;
    buf[1] = 0xaa;
    buf[2] = code;
    buf[3] = 0;
    buf[4] = 0;

    crc = crc16(buf, 5);

    buf[5] = (crc >> 8);
    buf[6] = (crc & 0xff);

    for(i=0;i<7;i++)
	uart_write_byte(buf[i]);
}

void on_cmd_init()
{
    boot_wait = 0;
    send_reply(RSP_OK);
}

uint32_t unpack_be32(uint8_t *p)
{
    uint32_t rv = 0;
    rv |= p[3];
    rv |= ((uint32_t)p[2]) << 8;
    rv |= ((uint32_t)p[1]) << 16;
    rv |= ((uint32_t)p[0]) << 24;
    return rv;
}

void on_cmd_erase_sector(uint8_t *payload, int len)
{
    uint32_t base = unpack_be32(payload);
    flash_write_enable();
    flash_erase_sector(base);

    send_reply(RSP_OK);

}

void on_cmd_write_page(uint8_t *payload, int len)
{
    uint32_t base = unpack_be32(payload);
    flash_write_enable();
    flash_program_page(base, payload+4, len-4);

    send_reply(RSP_OK);
}

void on_cmd_write_ram(uint8_t *payload, int len)
{
    int i;
    uint32_t base = unpack_be32(payload);

    for(i=0;i<len-4;i++)
	*(uint8_t*)(base + i) = payload[i+4];

    send_reply(RSP_OK);
}

void on_cmd_go(uint8_t *payload, int len)
{
    uint32_t base = unpack_be32(payload);
    
    voidfunc_t f = (voidfunc_t) base;

    send_reply(RSP_OK);

    f();
}

void boot_fsm()
{
    uint32_t t_exit = get_ms_ticks() + BOOT_TIMEOUT;
    boot_wait = 1;

    send_reply(RSP_HELLO);
    for(;;)
    {
	int pos = 0, i;
        uint16_t crc;

	if(boot_wait && get_ms_ticks() > t_exit)
	    return;

	timeout_hit = 0;

	int c = uart_read_blocking();

	if(c != 0x55  || timeout_hit)
	{
	    continue;
	}
	rxbuf[pos++] = c;
    
	c = uart_read_blocking();

	if(c != 0xaa || timeout_hit)
	    continue;

	rxbuf[pos++] = c;

	uint8_t command = uart_read_blocking();

	rxbuf[pos++] = command;
	rxbuf[pos++] = uart_read_blocking();
	rxbuf[pos++] = uart_read_blocking();

	uint16_t len = (uint16_t) rxbuf[3] << 8 | rxbuf[4];

	if(timeout_hit)
	    continue;

	for(i=0;i<len;i++)
	    rxbuf[pos++] = uart_read_blocking();

	crc = (uint16_t) uart_read_blocking() << 8;		    
	crc |= (uint16_t) uart_read_blocking();		    

	if(timeout_hit)
	    continue;

    	if( crc != crc16(rxbuf, len + 5) )
	{
	    send_reply(RSP_BAD_CRC);
	}


	switch(command)
	{
	    case CMD_INIT:
		on_cmd_init(rxbuf+5, len);
		break;
	    case CMD_ERASE_SECTOR:
		on_cmd_erase_sector(rxbuf+5, len);
		break;
	    case CMD_WRITE_PAGE:
		on_cmd_write_page(rxbuf+5, len);
		break;
	    case CMD_WRITE_RAM:
		on_cmd_write_ram(rxbuf+5, len);
		break;
	    case CMD_GO:
		on_cmd_go(rxbuf+5, len);
		break;

	    default:
		break;
	}
    }
}

void start_user()
{
    voidfunc_t f = (voidfunc_t) USER_START;
    f();
}

int main()
{
        uart_init_hw();
        flash_init();
	boot_fsm();
	start_user();

        return 0;
}
