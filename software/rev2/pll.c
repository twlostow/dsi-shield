/*
 * DSI Shield
 *
 * Copyright (C) 2013-2015 twl
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

/* pll.c - Xilinx PLL dynamic reconfiguration stuff */

#include <string.h>

#include "pll.h"

#define SYS_PLL_STATUS 0xc0040014
#define SYS_PLL_CONFIG0 0xc0040018
#define SYS_PLL_CONFIG1 0xc0040028
#define SYS_PLL_FREQ 0xc004002c

#define SYS_PWM_CTL  0xc004001c
#define SYS_GPIO_OUT  0xc0040020
#define SYS_GPIO_IN   0xc0040024

#define GPIO_OUT_EDID_EN (1 << 0)
#define GPIO_OUT_SCL (1 << 1)
#define GPIO_OUT_SDA (1 << 2)
#define GPIO_IN_SDA (1 << 2)


#define PLL_CFG0_ROM_ADDR_SHIFT 0
#define PLL_CFG0_DRP_ADDR_SHIFT 16
#define PLL_CFG0_WE (1 << 5)
#define PLL_CFG0_TRIGGER (1 << 6)
#define PLL_CFG0_N_REGS_SHIFT 7

static struct pll_config cfg_current = {
    0xdeadbeef,
    0xdeadbeef,
    0xdeadbeef,
    0xdeadbeef,
    NULL
};

void pll_reconfigure(const struct pll_config *cfg)
{
    uint32_t new_freq = BASE_CLOCK * cfg->mul / cfg->sys_div;
    uint32_t cur_freq = readl(SYS_PLL_FREQ);


    if ((cfg->mul == cfg_current.mul) &&
        (cfg->sys_div == cfg_current.sys_div) &&
        (cfg->phy_div == cfg_current.phy_div) &&
        (cfg->phy_phase == cfg_current.phy_phase))
        return;

    memcpy(&cfg_current, cfg, sizeof(struct pll_config));

    writel(SYS_PLL_FREQ, new_freq);

    writel(SYS_PLL_CONFIG0, 0);
    writel(SYS_PLL_CONFIG1, 0);

    int i;

    for (i = 0; cfg->data[i] != 0; i++)
    {
        uint32_t addr = (cfg->data[i] >> 32);
        uint32_t data = (cfg->data[i] & 0xffffffff);

        writel(SYS_PLL_CONFIG1, data);

        uint32_t ctl0 =
            (addr << PLL_CFG0_DRP_ADDR_SHIFT) | (i << PLL_CFG0_ROM_ADDR_SHIFT);
        writel(SYS_PLL_CONFIG0, ctl0 | PLL_CFG0_WE);
        writel(SYS_PLL_CONFIG0, ctl0);
    }


    writel(SYS_PLL_CONFIG0, PLL_CFG0_TRIGGER | (i << PLL_CFG0_N_REGS_SHIFT));
}

uint32_t pll_system_freq()
{
    return BASE_CLOCK * cfg_current.mul / cfg_current.sys_div;
}

uint32_t pll_phy_freq()
{
    return BASE_CLOCK * cfg_current.mul / cfg_current.phy_div;
}
