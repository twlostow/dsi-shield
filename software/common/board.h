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

/* board.h - system/hardware definitions */

#ifndef __BOARD_H
#define __BOARD_H

#include <stdint.h>

#define BASE_CLOCK 25000000 // Xtal frequency

#define BASE_UART 0x10000
#define BASE_DSI 0x20000
#define BASE_FBCTL 0x40000

#define BASE_SDRAM 0x40000000

#define UART_BAUDRATE 115200

#define FB_PLL_STATUS 0x40014

static inline void writel ( uint32_t reg, uint32_t val)
{
	*(volatile uint32_t *)(reg) = val;
}

static inline uint32_t readl ( uint32_t reg )
{
	return *(volatile uint32_t *)(reg);
}

static inline unsigned int board_system_freq()
{
    unsigned int pll_mul = readl (FB_PLL_STATUS) & 0x3f;
    unsigned int pll_div = (readl (FB_PLL_STATUS) >> 6) & 0x3f;
    return (unsigned int)BASE_CLOCK * pll_mul / pll_div;
}

static inline unsigned int board_phy_freq()
{
    unsigned int pll_mul = readl (FB_PLL_STATUS) & 0x3f;
    unsigned int pll_div = (readl (FB_PLL_STATUS) >> 12) & 0x3f;
    return (unsigned int)BASE_CLOCK * pll_mul / pll_div;
}

#endif
