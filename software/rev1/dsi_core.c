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

uint16_t dsi_crc(const uint8_t *d, int n)
{
uint16_t poly = 0x8408;

  int       byte_counter;
  int       bit_counter;
uint8_t current_data;
  uint16_t result = 0xffff;

   for ( byte_counter = 0; byte_counter < n; byte_counter++){
        current_data = d[byte_counter];

        for ( bit_counter = 0; bit_counter < 8; bit_counter++)
        {
          if ( ( ( result & 0x0001 ) ^ ( ( current_data ) & 0x0001 ) ) )
            result = ((result >> 1) & 0x7fff) ^ poly;
          else
            result = ((result >> 1) & 0x7fff);
       current_data = (current_data >> 1 );// & 0x7F;
     }
}
 return result;
}


void dsi_dcs_long_write(const unsigned char *data, int length)
{
  uint8_t w1  = 0;
  uint8_t w0 = length;

  pp_printf("pp_long write: %d bytes\n", length);  

  uint8_t ptype = 0x39;
  dsi_lp_write_byte(0xe1);
  dsi_lp_write_byte(reverse_bits(ptype));
  dsi_lp_write_byte(reverse_bits(w0));
  dsi_lp_write_byte(reverse_bits(w1));
  dsi_lp_write_byte(reverse_bits(dsi_ecc(ptype | (((uint32_t)w0) << 8) | (((uint32_t)w1) << 16))));

  int i;
  for(i=0;i<length;i++)
    dsi_lp_write_byte(reverse_bits(data[i]));
  
  uint16_t crc = dsi_crc(data, length);

  crc = 0x0000;

  dsi_lp_write_byte(reverse_bits(crc & 0xff));
  dsi_lp_write_byte(reverse_bits(crc >> 8));
  dsi_write(REG_DSI_CTL, dsi_ctl);
  dsi_delay();
}

void dsi_delay()
{
	delay (100000);
}

void e980_init( struct dsi_panel_config *panel )
{
const unsigned char init0[] = {0xB0,0x04};
dsi_dcs_long_write(init0, sizeof(init0));
const unsigned char init1[] = {0x00};
dsi_dcs_long_write(init1, sizeof(init1));
const unsigned char init2[] = {0x00};
dsi_dcs_long_write(init2, sizeof(init2));
const unsigned char init3[] = {0xB3,0x14,0x00,0x00,0x00,0x00,0x00};
dsi_dcs_long_write(init3, sizeof(init3));
const unsigned char init4[] = {0xB6,0x3A,0xD3};
dsi_dcs_long_write(init4, sizeof(init4));
const unsigned char init5[] = {0xC1,0x84,0x60,0x50,0x00,0x00,0x00,0x00,0x00,0x00,0x0C,0x01,0x58,0x73,0xAE,0x31,0x20,0x06,0x00,0x00,0x00,0x00,0x00,0x00,0x10,0x10,0x10,0x10,0x00,0x00,0x00,0x22,0x02,0x02,0x00};
dsi_dcs_long_write(init5, sizeof(init5));
const unsigned char init6[] = {0xC2,0x30,0xF7,0x80,0x0A,0x08,0x00,0x00};
dsi_dcs_long_write(init6, sizeof(init6));
const unsigned char init7[] = {0xC3,0x01,0x00,0x00};
dsi_dcs_long_write(init7, sizeof(init7));
const unsigned char init8[] = {0xC4,0x70,0x00,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x11,0x06,0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x11,0x06};
dsi_dcs_long_write(init8, sizeof(init8));
const unsigned char init9[] = {0xC6,0x06,0x6D,0x06,0x6D,0x06,0x6D,0x00,0x00,0x00,0x00,0x06,0x6D,0x06,0x6D,0x06,0x6D,0x15,0x19,0x07,0x00,0x01,0x06,0x6D,0x06,0x6D,0x06,0x6D,0x00,0x00,0x00,0x00,0x06,0x6D,0x06,0x6D,0x06,0x6D,0x15,0x19,0x07};
dsi_dcs_long_write(init9, sizeof(init9));
const unsigned char init10[] = {0xC7,0x00,0x09,0x14,0x23,0x30,0x48,0x3D,0x52,0x5F,0x67,0x6B,0x70,0x00,0x09,0x14,0x23,0x30,0x48,0x3D,0x52,0x5F,0x67,0x6B,0x70};
dsi_dcs_long_write(init10, sizeof(init10));
const unsigned char init11[] = {0xC8,0x00,0x09,0x14,0x23,0x30,0x48,0x3D,0x52,0x5F,0x67,0x6B,0x70,0x00,0x09,0x14,0x23,0x30,0x48,0x3D,0x52,0x5F,0x67,0x6B,0x70};
dsi_dcs_long_write(init11, sizeof(init11));
const unsigned char init12[] ={0xC9,0x00,0x09,0x14,0x23,0x30,0x48,0x3D,0x52,0x5F,0x67,0x6B,0x70,0x00,0x09,0x14,0x23,0x30,0x48,0x3D,0x52,0x5F,0x67,0x6B,0x70};
dsi_dcs_long_write(init12, sizeof(init12));
const unsigned char init13[] = {0xCC,0X09};
dsi_dcs_long_write(init13, sizeof(init13));
const unsigned char init14[] = {0xD0,0x00,0x00,0x19,0x18,0x99,0x99,0x19,0x01,0x89,0x00,0x55,0x19,0x99,0x01};
dsi_dcs_long_write(init14, sizeof(init14));
const unsigned char init15[] = {0xD3,0x1B,0x33,0xBB,0xCC,0xC4,0x33,0x33,0x33,0x00,0x01,0x00,0xA0,0xD8,0xA0,0x0D,0x39,0x33,0x44,0x22,0x70,0x02,0x39,0x03,0x3D,0xBF,0x00};
dsi_dcs_long_write(init15, sizeof(init15));
const unsigned char init16[] = {0xD5,0x06,0x00,0x00,0x01,0x2C,0x01,0x2C};
dsi_dcs_long_write(init16, sizeof(init16));
const unsigned char init17[] = {0xD5,0x06,0x00,0x00,0x01,0x2C,0x01,0x2C};
dsi_dcs_long_write(init17, sizeof(init17));
}

void dsi_init( struct dsi_panel_config *panel )
{
    
    dsi_write(REG_DSI_LANE_CTL, 0 | (1<<2) | (2<<4) | (3<<6)  ); // configure lane assignment
//    dsi_write(REG_DSI_LANE_CTL, (2<<0) | (3<<2) | (1<<4) | (0<<6) | (1<<8) | (1<<11) | (1<<12)); // disable core
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

  dsi_ctl |= 1;

  dsi_write(REG_DSI_CTL, dsi_ctl); /* enable DSI clock */
  dsi_delay();
  delay(300000);

//    e980_init(panel);
 
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
