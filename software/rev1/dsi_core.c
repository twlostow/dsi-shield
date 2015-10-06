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


void dsi_long_write(int is_dcs, const unsigned char *data, int length)
{
  uint8_t w1  = 0;
  uint8_t w0 = length;


  uint8_t ptype = is_dcs ? 0x39 : 0x29;

  pp_printf("pp_long write: %d bytes ptype %x\n", length, ptype);  

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

//  dsi_delay();
}

void dsi_delay()
{
	delay (100000);
}

#define DTYPE_GEN_LWRITE 0
#define DTYPE_DCS_WRITE 1
#define DTYPE_FINISH 2


struct dsi_command {
    uint8_t type;
    uint8_t dummy0;
    uint8_t dummy1;
    uint8_t dummy2;
    uint8_t dummy3;
    uint8_t size;
    uint8_t *cmd;
};

static char exit_sleep_mode             [2] = {0x11,0x00};

static char set_address_mode            [2] = {0x36,0x40};

static char mcap_setting                [2] = {0xB0, 0x04};

static char nop_command                 [2] = {0x00, 0x00};

static char interface_setting           [7] = {0xB3, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00};

static char dsi_ctrl                    [3] = {0xB6, 0x3A, 0xD3};

static char display_setting_1          [35] = {
		    0xC1,
		    0x84, 0x60, 0x50, 0xEB, 0xFF,
		    0x6F, 0xCE, 0xFF, 0xFF, 0x0F,
		    0x01, 0x58, 0x73, 0xAE, 0x31,
		    0x20, 0xC6, 0xFF, 0xFF, 0x1F,
		    0xF3, 0xFF, 0x5F, 0x10, 0x10,
		    0x10, 0x10, 0x00, 0x00, 0x00,
		    0x22, 0x02, 0x02, 0x00
		    };

static char display_setting_2           [8] = {
		    0xC2,
		    0x32, 0xF7, 0x80, 0x0A, 0x08,
		    0x00, 0x00
		    };

static char display_setting_3          [10] = {
		    0xCB,
		    0x31, 0xFC, 0x3F, 0x8C, 0x00,
		    0x00, 0x00, 0x00, 0xC0
		    };

#if 1
static char source_timing_setting      [23] = {
		    0xC4,
		    0x70, 0x00, 0x00, 0x00, 0x07,
		    0x03, 0x03, 0x07, 0x07, 0x0C,
		    0x06, 0x00, 0x00, 0x00, 0x00,
		    0x07, 0x03, 0x03, 0x07, 0x07,
		    0x0C, 0x06
		    };

static char ltps_timing_setting        [41] = {
		    0xC6,
		    0x00, 0x69, 0x00, 0x69, 0x00,
		    0x69, 0x00, 0x00, 0x00, 0x00,
		    0x00, 0x69, 0x00, 0x69, 0x00,
		    0x69, 0x10, 0x19, 0x07, 0x00,
		    0x01, 0x00, 0x69, 0x00, 0x69,
		    0x00, 0x69, 0x00, 0x00, 0x00,
		    0x00, 0x00, 0x69, 0x00, 0x69,
		    0x00, 0x69, 0x10, 0x19, 0x07
		    };

#endif


#if 0
static char source_timing_setting[] = {0xC4,0x70,0x00,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x11,0x06,0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x11,0x06};
static char ltps_timing_setting[] = {0xC6,0x06,0x6D,0x06,0x6D,0x06,0x6D,0x00,0x00,0x00,0x00,0x06,0x6D,0x06,0x6D,0x06,0x6D,0x15,0x19,0x07,0x00,0x01,0x06,0x6D,0x06,0x6D,0x06,0x6D,0x00,0x00,0x00,0x00,0x06,0x6D,0x06,0x6D,0x06,0x6D,0x15,0x19,0x07};
#endif


static char gamma_setting_a            [25] = {
		    0xC7,
		    0x00, 0x09, 0x14, 0x23, 0x30,
		    0x48, 0x3D, 0x52, 0x5F, 0x67,
		    0x6B, 0x70, 0x00, 0x09, 0x14,
		    0x23, 0x30, 0x48, 0x3D, 0x52,
		    0x5F, 0x67, 0x6B, 0x70
		    };

static char gamma_setting_b            [25] = {
		    0xC8,
		    0x00, 0x09, 0x14, 0x23, 0x30,
		    0x48, 0x3D, 0x52, 0x5F, 0x67,
		    0x6B, 0x70, 0x00, 0x09, 0x14,
		    0x23, 0x30, 0x48, 0x3D, 0x52,
		    0x5F, 0x67, 0x6B, 0x70
		    };

static char gamma_setting_c            [25] = {
		    0xC9,
		    0x00, 0x09, 0x14, 0x23, 0x30,
		    0x48, 0x3D, 0x52, 0x5F, 0x67,
		    0x6B, 0x70, 0x00, 0x09, 0x14,
		    0x23, 0x30, 0x48, 0x3D, 0x52,
		    0x5F, 0x67, 0x6B, 0x70
		    };

static char panel_interface_ctrl        [2] = {0xCC, 0x09};

static char pwr_setting_chg_pump       [15] = {
		    0xD0,
		    0x00, 0x00, 0x19, 0x18, 0x99,
		    0x99, 0x19, 0x01, 0x89, 0x00,
		    0x55, 0x19, 0x99, 0x01
		    };

static char pwr_setting_internal_pwr   [27] = {
		    0xD3,
		    0x1B, 0x33, 0xBB, 0xCC, 0xC4,
		    0x33, 0x33, 0x33, 0x00, 0x01,
		    0x00, 0xA0, 0xD8, 0xA0, 0x0D,
		    0x39, 0x33, 0x44, 0x22, 0x70,
		    0x02, 0x39, 0x03, 0x3D, 0xBF,
		    0x00
		    };
		    
static char vcom_setting                [8] = {
		    0xD5,
		    0x06, 0x00, 0x00, 0x01, 0x2C,
		    0x01, 0x2C
		    };

static char vcom_setting_for_suspend    [8] = {
		    0xD5,
		    0x06, 0x00, 0x00, 0x00, 0x48,
		    0x00, 0x48
		    };

static char display_on                  [2] = {0x29,0x00};

static char display_off                 [2] = {0x28,0x00};

static char enter_sleep_mode            [2] = {0x10,0x00};

static char deep_standby_mode           [2] = {0xB1,0x01};

static char vsync_setting               [4] = {0xC3, 0x00, 0x00, 0x00};

static char color_enhancement          [33] = {
                                   0xCA,
                                   0x01, 0x70, 0x90, 0xA0, 0xB0,
                                   0x98, 0x90, 0x90, 0x3F, 0x3F,
                                   0x80, 0x78, 0x08, 0x38, 0x08,
                                   0x3F, 0x08, 0x90, 0x0C, 0x0C,
                                   0x0A, 0x06, 0x04, 0x04, 0x00,
                                   0xC8, 0x10, 0x10, 0x3F, 0x3F,
                                   0x3F, 0x3F
                                   };

static char color_enhancement_off      [33] = {
                                   0xCA,
                                   0x00, 0x80, 0xDC, 0xF0, 0xDC,
                                   0xBE, 0xA5, 0xDC, 0x14, 0x20,
                                   0x80, 0x8C, 0x0A, 0x4A, 0x37,
                                   0xA0, 0x55, 0xF8, 0x0C, 0x0C,
                                   0x20, 0x10, 0x20, 0x20, 0x18,
                                   0xE8, 0x10, 0x10, 0x3F, 0x3F,
                                   0x3F, 0x3F
                                   };

static char auto_contrast               [7] = {
                                   0xD8,
                                   0x00, 0x80, 0x80, 0x40, 0x42,
                                   0x55
                                   };

static char auto_contrast_off           [7] = {
                                   0xD8,
                                   0x00, 0x80, 0x80, 0x40, 0x42,
                                   0x55
                                   };

static char sharpening_control          [3] = {0xDD, 0x01, 0x95};

static char sharpening_control_off      [3] = {0xDD, 0x20, 0x45};

static char pwm_set                     [8] = {0xCE, 0x00, 0x01, 0x00, 0xC1, 0x00, 0x00, 0x00};
static char write_display_brightness    [3] = {0x51, 0x00, 0xFF};
static char write_ctrl_display          [2] = {0x53, 0x24};
static char write_cabc_minimum_brightness [3] = {0x5E, 0x00, 0x00};
static char write_cabc_ui_on         [2] = {0x55, 0x01};
static char write_cabc_movie_on      [2] = {0x55, 0x03};
static char write_cabc_still_on      [2] = {0x55, 0x02};
static char write_cabc_off           [2] = {0x55, 0x00};
static char backlight_ctrl_ui          [8] = {0xBA, 0x00, 0x3F, 0x04, 0x40, 0x9F, 0x1F, 0xD7};
static char backlight_ctrl_movie_still [8] = {0xB9, 0x00, 0x02, 0x18, 0x18, 0x9F, 0x1F, 0x80};
static char backlight_ctrl_common      [26]= {0xB8,
                                       0x18, 0x80, 0x18, 0x18,
                                       0xCF, 0x1F, 0x00, 0x0C,
                                       0x0C, 0x6C, 0x0C, 0x6C,
                                       0x0C, 0x0C, 0x12, 0xDA,
                                       0x6D, 0xFF, 0xFF, 0x10,
                                       0xB3, 0xFB, 0xFF, 0xFF,
                                       0xFF};


struct dsi_command init_seq[] = {

// Display Initial Set
{DTYPE_GEN_LWRITE, 1, 0, 0, 0, sizeof(mcap_setting), mcap_setting},
{DTYPE_DCS_WRITE,  1, 0, 0, 0, sizeof(nop_command), nop_command},
{DTYPE_DCS_WRITE,  1, 0, 0, 0, sizeof(nop_command), nop_command},
{DTYPE_GEN_LWRITE, 1, 0, 0, 0, sizeof(interface_setting), interface_setting},
{DTYPE_GEN_LWRITE, 1, 0, 0, 0, sizeof(dsi_ctrl), dsi_ctrl},
{DTYPE_GEN_LWRITE, 1, 0, 0, 0, sizeof(display_setting_1), display_setting_1},
{DTYPE_GEN_LWRITE, 1, 0, 0, 0, sizeof(display_setting_2),display_setting_2},
{DTYPE_GEN_LWRITE, 1, 0, 0, 0, sizeof(display_setting_3),display_setting_3},
{DTYPE_GEN_LWRITE, 1, 0, 0, 0, sizeof(vsync_setting), vsync_setting},
{DTYPE_GEN_LWRITE, 1, 0, 0, 0, sizeof(source_timing_setting), source_timing_setting},
{DTYPE_GEN_LWRITE, 1, 0, 0, 0, sizeof(ltps_timing_setting), ltps_timing_setting},
{DTYPE_GEN_LWRITE, 1, 0, 0, 0, sizeof(gamma_setting_a), gamma_setting_a},
{DTYPE_GEN_LWRITE, 1, 0, 0, 0, sizeof(gamma_setting_b), gamma_setting_b},
{DTYPE_GEN_LWRITE, 1, 0, 0, 0, sizeof(gamma_setting_c), gamma_setting_c},
{DTYPE_GEN_LWRITE, 1, 0, 0, 0, sizeof(panel_interface_ctrl), panel_interface_ctrl},
{DTYPE_GEN_LWRITE, 1, 0, 0, 0, sizeof(pwr_setting_chg_pump), pwr_setting_chg_pump},
{DTYPE_GEN_LWRITE, 1, 0, 0, 0, sizeof(pwr_setting_internal_pwr), pwr_setting_internal_pwr},
{DTYPE_GEN_LWRITE, 1, 0, 0, 0, sizeof(vcom_setting), vcom_setting},
{DTYPE_GEN_LWRITE, 1, 0, 0, 0, sizeof(vcom_setting), vcom_setting},
{DTYPE_FINISH},
};


#if 0
void e980_init( struct dsi_panel_config *panel )
{
    int i;

    for(i = 0; init_seq[i].type != DTYPE_FINISH;i++)
    {
	dsi_long_write( init_seq[i].type == DTYPE_DCS_WRITE ? 1 : 0, init_seq[i].cmd, init_seq[i].size );
    }
}
#endif

#if 1

void e980_init( struct dsi_panel_config *panel )
{
const unsigned char init0[] = {0xB0,0x04};
dsi_long_write(0, init0, sizeof(init0));
const unsigned char init1[] = {0x00, 0x00};
dsi_long_write(1, init1, sizeof(init1));
const unsigned char init2[] = {0x00, 0x00};
dsi_long_write(1, init2, sizeof(init2));
const unsigned char init3[] = {0xB3,0x14,0x00,0x00,0x00,0x00,0x00};
dsi_long_write(0, init3, sizeof(init3));
const unsigned char init4[] = {0xB6,0x3A,0x83 | 0x50/*;0xD3*/};
dsi_long_write(0, init4, sizeof(init4));
//const unsigned char init5[] = {0xC1,0x84,0x60,0x50,0x00,0x00,0x00,0x00,0x00,0x00,0x0C,0x01,0x58,0x73,0xAE,0x31,0x20,0x06,0x00,0x00,0x00,0x00,0x00,0x00,0x10,0x10,0x10,0x10,0x00,0x00,0x00,0x22,0x02,0x02,0x00};
//dsi_long_write(0, init5, sizeof(init5));
//const unsigned char init6[] = {0xC2,0x30,0xF7,0x80,0x0A,0x08,0x00,0x00};
//dsi_long_write(0, init6, sizeof(init6));
//const unsigned char init7[] = {0xC3,0x01,0x00,0x00};
//dsi_long_write(0, init7, sizeof(init7));


dsi_long_write(0, display_setting_1, sizeof(display_setting_1));
dsi_long_write(0, display_setting_2, sizeof(display_setting_2));
dsi_long_write(0, display_setting_3, sizeof(display_setting_3));



const unsigned char init8[] = {0xC4,0x70,0x00,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x11,0x06,0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x11,0x06};
dsi_long_write(0, init8, sizeof(init8));
const unsigned char init9[] = {0xC6,0x06,0x6D,0x06,0x6D,0x06,0x6D,0x00,0x00,0x00,0x00,0x06,0x6D,0x06,0x6D,0x06,0x6D,0x15,0x19,0x07,0x00,0x01,0x06,0x6D,0x06,0x6D,0x06,0x6D,0x00,0x00,0x00,0x00,0x06,0x6D,0x06,0x6D,0x06,0x6D,0x15,0x19,0x07};
dsi_long_write(0, init9, sizeof(init9));
const unsigned char init10[] = {0xC7,0x00,0x09,0x14,0x23,0x30,0x48,0x3D,0x52,0x5F,0x67,0x6B,0x70,0x00,0x09,0x14,0x23,0x30,0x48,0x3D,0x52,0x5F,0x67,0x6B,0x70};
dsi_long_write(0, init10, sizeof(init10));
const unsigned char init11[] = {0xC8,0x00,0x09,0x14,0x23,0x30,0x48,0x3D,0x52,0x5F,0x67,0x6B,0x70,0x00,0x09,0x14,0x23,0x30,0x48,0x3D,0x52,0x5F,0x67,0x6B,0x70};
dsi_long_write(0, init11, sizeof(init11));
const unsigned char init12[] ={0xC9,0x00,0x09,0x14,0x23,0x30,0x48,0x3D,0x52,0x5F,0x67,0x6B,0x70,0x00,0x09,0x14,0x23,0x30,0x48,0x3D,0x52,0x5F,0x67,0x6B,0x70};
dsi_long_write(0, init12, sizeof(init12));
const unsigned char init13[] = {0xCC,0X09};
dsi_long_write(0, init13, sizeof(init13));
const unsigned char init14[] = {0xD0,0x00,0x00,0x19,0x18,0x99,0x99,0x19,0x01,0x89,0x00,0x55,0x19,0x99,0x01};
dsi_long_write(0, init14, sizeof(init14));
const unsigned char init15[] = {0xD3,0x1B,0x33,0xBB,0xCC,0xC4,0x33,0x33,0x33,0x00,0x01,0x00,0xA0,0xD8,0xA0,0x0D,0x39,0x33,0x44,0x22,0x70,0x02,0x39,0x03,0x3D,0xBF,0x00};
dsi_long_write(0, init15, sizeof(init15));
const unsigned char init16[] = {0xD5,0x06,0x00,0x00,0x01,0x2C,0x01,0x2C};
dsi_long_write(0, init16, sizeof(init16));
const unsigned char init17[] = {0xD5,0x06,0x00,0x00,0x01,0x2C,0x01,0x2C};
dsi_long_write(0, init17, sizeof(init17));
}
#endif

void dsi_init( struct dsi_panel_config *panel )
{
    
    dsi_write(REG_DSI_LANE_CTL, 0 | (1<<2) | (2<<4) | (3<<6) | (1<<8) | (1<<10) ); // configure lane assignment -> IP4

//    dsi_write(REG_DSI_LANE_CTL, (2<<0) | (3<<2) | (1<<4) | (0<<6) | (1<<8) | (1<<11) | ( 1<<12 ) ); // -> E980
//    dsi_write(REG_DSI_LANE_CTL, (3<<0) | (0<<2) | (2<<4) | (1<<6) | (1<<8) | (1<<9) | (1<<11) ); // -> DNA

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


//  delay(300000);
 
 
  dsi_write(REG_TIMING_CTL, 1); /* start display refresh */
}

void dsi_force_lp(int force)
{
  dsi_write(REG_TIMING_CTL, 1 | (force? 2: 0)); 
}
