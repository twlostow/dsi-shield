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

void dsi_dcs_long_write(const unsigned char *data, int length)
{
  uint8_t w0  = 0;
  uint8_t w1 = length;

  //pp_printf("pp_long write: %d bytes\n", length);  

  dsi_lp_write_byte(0xe1);
  dsi_lp_write_byte(reverse_bits(0x39));
  dsi_lp_write_byte(reverse_bits(w0));
  dsi_lp_write_byte(reverse_bits(w1));
  int i;
  for(i=0;i<length;i++)
    dsi_lp_write_byte(reverse_bits(data[i]));
  dsi_lp_write_byte(reverse_bits(0xff));
  dsi_lp_write_byte(reverse_bits(0xff));
  dsi_write(REG_DSI_CTL, dsi_ctl);

}

void dsi_delay()
{
	delay (100000);
}

static void s6e8ax0_apply_level2_key()
{
  static const unsigned char data_to_send[] = {
    0xf0, 0x5a, 0x5a
  };
   dsi_dcs_long_write ( data_to_send, 3 );
}

static void s6e8ax0_sleep_out()
{
   dsi_send_lp_short(0x15, 0x11, 0x00); /* send DCS SLEEP_OUT */
   delay(300000);
}


static void s6e8ax0_panel_cond()
{
  
  static const unsigned char data_to_send[] = {
    0xf8, 0x3d, 0x35, 0x00, 0x00, 0x00, 0x93, 0x00, 0x3c, 0x7d,
    0x08, 0x27, 0x7d, 0x3f, 0x00, 0x00, 0x00, 0x20, 0x04, 0x08,
    0x6e, 0x00, 0x00, 0x00, 0x02, 0x08, 0x08, 0x23, 0x23, 0xc0,
    0xc8, 0x08, 0x48, 0xc1, 0x00, 0xc1, 0xff, 0xff, 0xc8
  };

 dsi_dcs_long_write ( data_to_send, sizeof(data_to_send) );
}

static void s6e8ax0_display_cond()
{
  static const unsigned char data_to_send[] = {
    0xf2, 0x80, 0x03, 0x0d
  };

 dsi_dcs_long_write ( data_to_send, sizeof(data_to_send) );
}

static const unsigned char s6e8ax0_22_gamma_300[] = {
  0xfa, 0x01, 0x60, 0x10, 0x60, 0xb5, 0xd3, 0xbd, 0xb1, 0xd2,
  0xb0, 0xc0, 0xdc, 0xc0, 0x94, 0xba, 0x91, 0xac, 0xc5, 0xa9,
  0x00, 0xc2, 0x00, 0xb7, 0x00, 0xed,
};
 
static void s6e8ax0_gamma_cond()
{
   dsi_dcs_long_write ( s6e8ax0_22_gamma_300, sizeof(s6e8ax0_22_gamma_300) );

}

static void s6e8ax0_gamma_update()
{
  static const unsigned char data_to_send[] = {
    0xf7, 0x03
  };

 dsi_send_lp_short(0x15, data_to_send[0], data_to_send[1]);

}

static void s6e8ax0_etc_cond1()
{
  static const unsigned char data_to_send[] = {
    0xd1, 0xfe, 0x80, 0x00, 0x01, 0x0b, 0x00, 0x00, 0x40,
    0x0d, 0x00, 0x00
  };
   dsi_dcs_long_write ( data_to_send, sizeof(data_to_send) );
}

static void s6e8ax0_etc_cond2()
{
  static const unsigned char data_to_send[] = {
    0xb6, 0x0c, 0x02, 0x03, 0x32, 0xff, 0x44, 0x44, 0xc0,
    0x00
  };
 dsi_dcs_long_write ( data_to_send, sizeof(data_to_send) );
  
}

static void s6e8ax0_etc_cond3()
{
  static const unsigned char data_to_send[] = {
    0xe1, 0x10, 0x1c, 0x17, 0x08, 0x1d
  };
   dsi_dcs_long_write ( data_to_send, sizeof(data_to_send) );
}

static void s6e8ax0_etc_cond4()
{
  static const unsigned char data_to_send[] = {
    0xe2, 0xed, 0x07, 0xc3, 0x13, 0x0d, 0x03
  };
 dsi_dcs_long_write ( data_to_send, sizeof(data_to_send) );
  
}

static void s6e8ax0_etc_cond5()
{
  static const unsigned char data_to_send[] = {
    0xf4, 0xcf, 0x0a, 0x12, 0x10, 0x19, 0x33, 0x02
  };
 dsi_dcs_long_write ( data_to_send, sizeof(data_to_send) );
}

static void s6e8ax0_etc_cond6()
{
  static const unsigned char data_to_send[] = {
    0xe3, 0x40
  };

   dsi_send_lp_short(0x15, data_to_send[0], data_to_send[1]);
}

static void s6e8ax0_etc_cond7()
{
  static const unsigned char data_to_send[] = {
    0xe4, 0x00, 0x00, 0x14, 0x80, 0x00, 0x00, 0x00
  };
dsi_dcs_long_write ( data_to_send, sizeof(data_to_send) );
}

static void s6e8ax0_elvss_nvm_set()
{
  static const unsigned char data_to_send[] = {
    0xd9, 0x5c, 0x20, 0x0c, 0x0f, 0x41, 0x00, 0x10, 0x11,
    0x12, 0xd1, 0x00, 0x00, 0x00, 0x00, 0x80, 0xcb, 0xed,
    0x64, 0xaf
  };
  dsi_dcs_long_write ( data_to_send, sizeof(data_to_send) );
}

static void s6e8ax0_elvss_set()
{
  static const unsigned char data_to_send[] = {
    0xb1, 0x04, 0x00
  };
  dsi_dcs_long_write ( data_to_send, sizeof(data_to_send) );
}

void samsung_init()
{
  s6e8ax0_apply_level2_key();
  s6e8ax0_sleep_out();
  dsi_delay();
  s6e8ax0_panel_cond();
  s6e8ax0_display_cond();
  s6e8ax0_gamma_cond();
  s6e8ax0_gamma_update();

  s6e8ax0_etc_cond1();
  s6e8ax0_etc_cond2();
  s6e8ax0_etc_cond3();
  s6e8ax0_etc_cond4();
  s6e8ax0_etc_cond5();
  s6e8ax0_etc_cond6();
  s6e8ax0_etc_cond7();

  s6e8ax0_elvss_nvm_set();
  s6e8ax0_elvss_set();

  
   dsi_send_lp_short(0x15, 0xc0, 0x00);

  
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

  samsung_init();

#if 1
  //dsi_send_lp_short(0x15, 0x11, 0x00); /* send DCS SLEEP_OUT */
  //delay(300000);
 
  dsi_send_lp_short(0x15, 0x29, 0x00); /* send DCS DISPLAY_ON */
  delay(300000);
 
  dsi_send_lp_short(0x15, 0x38, 0x00); /* send DCS EXIT_IDLE_MODE */
  delay(300000);
#endif


 

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
