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


#ifndef __UART_H
#define __UART_H

void uart_init_sw(void);
void uart_init_hw(void);
void uart_write_byte(int b);
int uart_write_string(const char *s);
int puts(const char *s);
int uart_read_byte(void);

/* uart-sw is used by ppsi (but may be wrapped to normal uart) */
int uart_sw_write_string(const char *s);


#endif
