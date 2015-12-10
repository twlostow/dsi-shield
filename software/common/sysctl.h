/*
 * DSI Shield
 *
 * Copyright (C) 2013-2015 twl <twlostow@printf.cc>
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

#ifndef __SYSCTL_H
#define __SYSCTL_H

#include <stdint.h>

#include "board.h"

#define SYS_PLL_STATUS 0xc0040014
#define SYS_PLL_CONFIG0 0xc0040018
#define SYS_PLL_CONFIG1 0xc0040030

#define SYS_PWM_CTL  0xc004001c
#define SYS_GPIO_OUT  0xc0040020
#define SYS_GPIO_IN   0xc0040024

#define SYS_GPIO_OUT_EDID_EN (1<<0)
#define SYS_GPIO_OUT_SCL (1<<1)
#define SYS_GPIO_OUT_SDA (1<<2)
#define SYS_GPIO_IN_SDA (1<<2)


#define PLL_CFG0_ROM_ADDR_SHIFT 0
#define PLL_CFG0_DRP_ADDR_SHIFT 16
#define PLL_CFG0_WE (1<<5)
#define PLL_CFG0_TRIGGER (1<<6)
#define PLL_CFG0_N_REGS_SHIFT 7


static inline void gpio_set( int pin, int value )
{
    uint32_t cur = readl(SYS_GPIO_OUT);
    if(value)
	cur |= (1<<pin);
    else
	cur &= ~(1<<pin);

    writel(SYS_GPIO_OUT, cur);
}


static inline int gpio_get(int pin)
{
    return ( readl(SYS_GPIO_IN) & (1<<pin) ) ? 1: 0;
}

#endif
