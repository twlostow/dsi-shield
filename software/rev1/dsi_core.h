/* 
 * DSI Core
 * Copyright (C) 2013 twl <twlostow@printf.cc>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.

 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

#ifndef __DSI_CORE_H
#define __DSI_CORE_H

#include <stdint.h>
#include "board.h"
#include "pll.h"

/* Register definitions */
#define REG_H_FRONT_PORCH 0x0
#define REG_H_BACK_PORCH  0x4 
#define REG_H_ACTIVE      0x8
#define REG_H_TOTAL       0xc 
#define REG_V_FRONT_PORCH 0x10
#define REG_V_BACK_PORCH  0x14
#define REG_V_ACTIVE      0x18
#define REG_V_TOTAL       0x1c
#define REG_TIMING_CTL    0x20
#define REG_DSI_TICKDIV   0x24
#define REG_DSI_CTL       0x28
#define REG_TEST_XSIZE    0x2c
#define REG_TEST_YSIZE    0x30
#define REG_TEST_CTL      0x34
#define REG_LP_TX         0x38
#define REG_DSI_GPIO      0x3c
#define REG_DSI_LANE_CTL      0x40

#define DSI_LANE(index, swap, reverse) \
    ((swap&3) << ((index) * 2) | ((reverse) ? (1<<((index)+8)) : 0 ))

#define DSI_LANE_INVERT_CLOCK (1<<12)
    


struct dsi_panel_config {
  char *name;

  int num_lanes;
  uint32_t lane_config;

  int lp_divider;
  
  int width, height;

  int h_front_porch, h_back_porch;
  int v_front_porch, v_back_porch;
  
  int frame_gap;

  int cmd_delay;

  const uint8_t *edid_data;
  const struct pll_config *pll_cfg;

  int (*user_init)(struct dsi_panel_config *cfg);
};

/* I/O registers access */
static inline void dsi_write(uint32_t reg, uint32_t val)
{
	*(volatile uint32_t *)(BASE_DSI + reg) = val;
}

static inline uint32_t dsi_read(uint32_t reg)
{
	return *(volatile uint32_t *)(BASE_DSI + reg);
}

void dsi_send_lp_short(uint8_t ptype, uint8_t w0, uint8_t w1);
void dsi_init( struct dsi_panel_config *);

#endif

