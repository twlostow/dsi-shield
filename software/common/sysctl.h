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