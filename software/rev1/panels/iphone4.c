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

/* iphone4.c - Iphone4 LCD driver */

#include <stdio.h>

#include "dsi_core.h"

static const uint8_t edid_iphone4[] =  
#include "edid_ip4.h"
;

static const uint64_t pll_regs[] =
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

static const struct pll_config pll_iphone4 = {
31,8,2,0,
pll_regs
};


/* Iphone 4 display (640x960) config */
struct dsi_panel_config panel_iphone4 = {
  "LH350WS02 (Iphone4/4S)",
  3,    /* num_lanes */

 DSI_LANE(0, 0, 1) |
 DSI_LANE(1, 1, 0) |
 DSI_LANE(2, 2, 1) |
 DSI_LANE(3, 3, 0), /* Lane configuration */


  2,    /* lp_divider */
  640,  /* width */
  960, /* height */

  192,   /* h_front_porch */
  192,   /* h_back_porch */
  10,   /* v_front_porch */
  28,    /* v_back_porch */
  200,  /* frame_gap */
  100000,
  edid_iphone4,  /* EDID */
  &pll_iphone4, /* PLL settings */
  NULL,		/* user init */
};
