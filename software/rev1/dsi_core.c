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

#include <stdio.h>
#include <stdint.h>

#include "board.h"
#include "dsi_core.h"

#include <stdio.h>
#include <stdint.h>


/* Calculates a parity bit for value d (1 = odd, 0 = even) */
static inline uint8_t parity (uint32_t d)
{
  int i, p = 0;
  for(i=0;i<32;i++)
    p^=d & (1<<i) ? 1 : 0;
  return p;
}

void delay(int tics)
{
	while(tics--) asm volatile("nop");
}


static uint8_t reverse_bits(uint8_t x)
{
  uint8_t r = 0;
  int i;
	
  for(i=0;i<8;i++)
    if(x & (1<<i)) r |= (1<<(7-i));
  return r;
}

/* calculates DSI packet header ECC checksum */
static uint8_t dsi_ecc(uint32_t data)
{
  uint8_t ecc=0;
  int i;
  static const uint32_t masks[] = {0xf12cb7, 0xf2555b, 0x749a6d, 0xb8e38e, 0xdf03f0, 0xeffc00};
  
  for(i=0;i<6;i++)
    if(parity (data & masks[i]))
      ecc |= (1<<i);

  return ecc;
}

int dsi_ctl = 0;

/* Sends a single byte to the display in low power mode */
void dsi_lp_write_byte(uint32_t value)
{
     int rv = 0; 
     dsi_write(REG_DSI_CTL, dsi_ctl | 2);
     while(! ( dsi_read(REG_DSI_CTL) & 2));
     dsi_write(REG_LP_TX, value | 0x100);
     while(! ( dsi_read(REG_DSI_CTL) & 2));
}

/* Composes a short packet and sends it in low power mode to the display */
void dsi_send_lp_short(uint8_t ptype, uint8_t w0, uint8_t w1)
{
	uint8_t pdata[4];
	uint32_t d;

 	dsi_lp_write_byte(0xe1);
	dsi_lp_write_byte(reverse_bits(ptype));
	dsi_lp_write_byte(reverse_bits(w0));
	dsi_lp_write_byte(reverse_bits(w1));
	dsi_lp_write_byte(reverse_bits(dsi_ecc(ptype | (((uint32_t)w0) << 8) | (((uint32_t)w1) << 16))));
	dsi_write(REG_DSI_CTL, dsi_ctl);
}	

void dsi_delay()
{
	delay (100000);
}


void dsi_init( struct dsi_panel_config *panel )
{
	dsi_write(REG_DSI_CTL, 0); // disable core
	dsi_write(REG_DSI_TICKDIV, panel->lp_divider);

	dsi_ctl = (panel->num_lanes << 8);
  dsi_write(REG_DSI_CTL, dsi_ctl);  /* disable DSI clock, set lane count */

  int i;

  dsi_write(REG_DSI_GPIO, 0); /* reset the display */
  for(i=0;i<10;i++)  dsi_delay();
  
  dsi_write(REG_DSI_GPIO, 0x2);  /* Avdd on */
  for(i=0;i<10;i++)  dsi_delay();
  
  dsi_write(REG_DSI_GPIO, 0x3);  /* un-reset */
  for(i=0;i<10;i++)  dsi_delay();
     
  
  dsi_send_lp_short(0x05, 0x00, 0x00); /* send DCS NOP */
  dsi_delay();
  
  dsi_ctl |= 1;

  dsi_write(REG_DSI_CTL, dsi_ctl); /* enable DSI clock */
  dsi_delay();
  delay(300000);

  dsi_send_lp_short(0x15, 0x11, 0x00); /* send DCS SLEEP_OUT */
  delay(300000);
 
  dsi_send_lp_short(0x15, 0x29, 0x00); /* send DCS DISPLAY_ON */
  delay(300000);
 
  dsi_send_lp_short(0x15, 0x38, 0x00); /* send DCS EXIT_IDLE_MODE */
  delay(300000);
 

  dsi_write(REG_H_FRONT_PORCH, panel->h_front_porch );
  dsi_write(REG_H_BACK_PORCH, panel->h_back_porch );
  dsi_write(REG_H_ACTIVE, panel->width * 3 );
  dsi_write(REG_H_TOTAL, panel->frame_gap );
  dsi_write(REG_V_BACK_PORCH, panel->v_back_porch );
  dsi_write(REG_V_FRONT_PORCH, panel->v_back_porch + panel->height );
  dsi_write(REG_V_ACTIVE, panel->v_back_porch + panel->height + panel->v_front_porch );
  dsi_write(REG_V_TOTAL, panel->v_back_porch + panel->height + panel->v_front_porch );
 
  dsi_write(REG_TIMING_CTL, 1); /* start display refresh */
}

void dsi_force_lp(int force)
{
  dsi_write(REG_TIMING_CTL, 1 | (force? 2: 0)); 
}
