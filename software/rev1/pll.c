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


#include "pll.h"

#define SYS_PLL_STATUS 0xc0040014
#define SYS_PLL_CONFIG0 0xc0040018
#define SYS_PLL_CONFIG1 0xc0040028
#define SYS_PLL_FREQ 0xc004002c

#define SYS_PWM_CTL  0xc004001c
#define SYS_GPIO_OUT  0xc0040020
#define SYS_GPIO_IN   0xc0040024

#define GPIO_OUT_EDID_EN (1<<0)
#define GPIO_OUT_SCL (1<<1)
#define GPIO_OUT_SDA (1<<2)
#define GPIO_IN_SDA (1<<2)


#define PLL_CFG0_ROM_ADDR_SHIFT 0
#define PLL_CFG0_DRP_ADDR_SHIFT 16
#define PLL_CFG0_WE (1<<5)
#define PLL_CFG0_TRIGGER (1<<6)
#define PLL_CFG0_N_REGS_SHIFT 7

static uint64_t my_cfg[] =
{
// mul = 31
// sys_div = 8
// phy_div = 2
// phy_phase = 0
0x0550ff0000ULL,
0x06010b0000ULL,
0x07e02c0080ULL,
0x0840010200ULL,
0x090d030080ULL,
0x0ab0010000ULL,
0x0b01100020ULL,
0x0c0b004001ULL,
0x0d00088120ULL,
0x0e00d02000ULL,
0x0f00038000ULL,
0x10800c03e0ULL,
0x11fc000218ULL,
0x12f0ff0000ULL,
0x1351200200ULL,
0x142fff1000ULL,
0x15bff4400bULL,
0x160a55d420ULL,
0x17ffd00023ULL,
0x1810392106ULL,
0x19000040ebULL,
0x1afffc0002ULL,
0x1d2fff0000ULL,
0x0000000000ULL
};

struct pll_config cfg_default = {
31,8,2,0,
my_cfg
};

struct pll_config cfg_current = { 0xdeadbeef, 0xdeadbeef, 0xdeadbeef, 0xdeadbeef, 0xdeadbeef };


  /* wire [4:0] 	      r_cfg_addr = r_pll_ctl0_i[4:0];
   wire [39:0] 	      r_cfg_data = {r_pll_ctl1_i[23:16], r_pll_ctl1_i[31:0]};
   wire 	      r_cfg_we = r_pll_ctl0_i[5];
   wire 	      r_cfg_trigger = r_pll_ctl0_i[6];
   wire [4:0] 	      r_n_regs = r_pll_ctl0_i[11:7];*/

void pll_reconfigure( struct pll_config *cfg )
{
//    if(!memcmp(&cfg_current, cfg, sizeof(struct pll_config)))
//	return;

    uint32_t new_freq = BASE_CLOCK * cfg->mul / cfg->sys_div;
    uint32_t cur_freq = readl(SYS_PLL_FREQ);

    pp_printf("new %d cur %d\n", new_freq, cur_freq);
    
    if(new_freq == cur_freq)
	return;


//    memcpy(&cfg_current, cfg, sizeof(struct pll_config));


    writel(SYS_PLL_FREQ, new_freq);

    writel(SYS_PLL_CONFIG0, 0);
    writel(SYS_PLL_CONFIG1, 0);

    int i;

    for(i=0;cfg->data[i] != 0; i++)
    {
	uint32_t addr = (cfg->data[i] >> 32);
	uint32_t data = (cfg->data[i] & 0xffffffff);
	
	writel(SYS_PLL_CONFIG1, data);

	uint32_t ctl0 = (addr << PLL_CFG0_DRP_ADDR_SHIFT) | (i << PLL_CFG0_ROM_ADDR_SHIFT);
	writel(SYS_PLL_CONFIG0, ctl0 | PLL_CFG0_WE);
	writel(SYS_PLL_CONFIG0, ctl0);
    }


    writel(SYS_PLL_CONFIG0, PLL_CFG0_TRIGGER | (i << PLL_CFG0_N_REGS_SHIFT) );
}


void pll_test()
{
    pp_printf("sysclk freq %d\n", readl(SYS_PLL_FREQ));
}
