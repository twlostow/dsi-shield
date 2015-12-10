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

/* e980.c - LG Optimus E980 driver */

#include <stdio.h>

#include "dsi_core.h"

static const uint8_t edid_e980[] =
#include "edid_dna.h"
;

static const uint64_t pll_regs[] =
{
    // mul = 26
    // sys_div = 7
    // phy_div = 1
    // phy_phase = 0
    0x0550ff0000ULL,
    0x06010b1000ULL,
    0x07e02c0080ULL,
    0x0840010100ULL,
    0x090d030040ULL,
    0x0ab0010040ULL,
    0x0b01100004ULL,
    0x0c0b009401ULL,
    0x0d000880a0ULL,
    0x0e00d00d20ULL,
    0x0f00032608ULL,
    0x10800c0340ULL,
    0x11fc000018ULL,
    0x12f0ff0800ULL,
    0x1351200200ULL,
    0x142fff1000ULL,
    0x15bff4400bULL,
    0x160a55d420ULL,
    0x17ffd00021ULL,
    0x1810392146ULL,
    0x190000e2ebULL,
    0x1afffc0002ULL,
    0x1d2fff0000ULL,
    0x0000000000ULL
};

static const struct pll_config pll_e980 = {
    26, 7, 1, 0,
    pll_regs
};


static int e980_init(struct dsi_panel_config *panel)
{
    const unsigned char init0[] = { 0xB0, 0x04 };

    dsi_long_write(0, init0, sizeof(init0));
    const unsigned char init1[] = { 0x00, 0x00 };
    dsi_long_write(1, init1, sizeof(init1));
    const unsigned char init2[] = { 0x00, 0x00 };
    dsi_long_write(1, init2, sizeof(init2));
    const unsigned char init3[] = { 0xB3, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00 };
    dsi_long_write(0, init3, sizeof(init3));
    const unsigned char init4[] = { 0xB6, 0x3A, 0x83 | 0x50 /*;0xD3*/ };
    dsi_long_write(0, init4, sizeof(init4));
    static char display_setting_1[35] = {
        0xC1,
        0x84, 0x60, 0x50, 0xEB, 0xFF,
        0x6F, 0xCE, 0xFF, 0xFF, 0x0F,
        0x01, 0x58, 0x73, 0xAE, 0x31,
        0x20, 0xC6, 0xFF, 0xFF, 0x1F,
        0xF3, 0xFF, 0x5F, 0x10, 0x10,
        0x10, 0x10, 0x00, 0x00, 0x00,
        0x22, 0x02, 0x02, 0x00
    };

    static char display_setting_2[8] = {
        0xC2,
        0x32, 0xF7, 0x80, 0x0A, 0x08,
        0x00, 0x00
    };

    static char display_setting_3[10] = {
        0xCB,
        0x31, 0xFC, 0x3F, 0x8C, 0x00,
        0x00, 0x00, 0x00, 0xC0
    };


    dsi_long_write(0, display_setting_1, sizeof(display_setting_1));
    dsi_long_write(0, display_setting_2, sizeof(display_setting_2));
    dsi_long_write(0, display_setting_3, sizeof(display_setting_3));


    const unsigned char init8[] =
    { 0xC4,   0x70, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x11, 0x06,
      0x00,   0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x11, 0x06 };
    dsi_long_write(0, init8, sizeof(init8));
    const unsigned char init9[] =
    { 0xC6,   0x06, 0x6D, 0x06, 0x6D, 0x06, 0x6D, 0x00, 0x00, 0x00, 0x00, 0x06,
      0x6D,   0x06, 0x6D, 0x06, 0x6D, 0x15, 0x19, 0x07, 0x00, 0x01, 0x06, 0x6D,
      0x06,   0x6D, 0x06, 0x6D, 0x00, 0x00, 0x00, 0x00, 0x06, 0x6D, 0x06, 0x6D,
      0x06,   0x6D, 0x15, 0x19, 0x07 };
    dsi_long_write(0, init9, sizeof(init9));
    const unsigned char init10[] =
    { 0xC7,   0x00, 0x09, 0x14, 0x23, 0x30, 0x48, 0x3D, 0x52, 0x5F, 0x67, 0x6B,
      0x70,   0x00, 0x09, 0x14, 0x23, 0x30, 0x48, 0x3D, 0x52, 0x5F, 0x67, 0x6B,
      0x70 };
    dsi_long_write(0, init10, sizeof(init10));
    const unsigned char init11[] =
    { 0xC8,   0x00, 0x09, 0x14, 0x23, 0x30, 0x48, 0x3D, 0x52, 0x5F, 0x67, 0x6B,
      0x70,   0x00, 0x09, 0x14, 0x23, 0x30, 0x48, 0x3D, 0x52, 0x5F, 0x67, 0x6B,
      0x70 };
    dsi_long_write(0, init11, sizeof(init11));
    const unsigned char init12[] =
    { 0xC9,   0x00, 0x09, 0x14, 0x23, 0x30, 0x48, 0x3D, 0x52, 0x5F, 0x67, 0x6B,
      0x70,   0x00, 0x09, 0x14, 0x23, 0x30, 0x48, 0x3D, 0x52, 0x5F, 0x67, 0x6B,
      0x70 };
    dsi_long_write(0, init12, sizeof(init12));
    const unsigned char init13[] = { 0xCC, 0X09 };
    dsi_long_write(0, init13, sizeof(init13));
    const unsigned char init14[] =
    { 0xD0,   0x00, 0x00, 0x19, 0x18, 0x99, 0x99, 0x19, 0x01, 0x89, 0x00, 0x55,
      0x19,   0x99, 0x01 };
    dsi_long_write(0, init14, sizeof(init14));
    const unsigned char init15[] =
    { 0xD3,   0x1B, 0x33, 0xBB, 0xCC, 0xC4, 0x33, 0x33, 0x33, 0x00, 0x01, 0x00,
      0xA0,   0xD8, 0xA0, 0x0D, 0x39, 0x33, 0x44, 0x22, 0x70, 0x02, 0x39, 0x03,
      0x3D,   0xBF, 0x00 };
    dsi_long_write(0, init15, sizeof(init15));
    const unsigned char init16[] =
    { 0xD5, 0x06, 0x00, 0x00, 0x01, 0x2C, 0x01, 0x2C };
    dsi_long_write(0, init16, sizeof(init16));
    const unsigned char init17[] =
    { 0xD5, 0x06, 0x00, 0x00, 0x01, 0x2C, 0x01, 0x2C };
    dsi_long_write(0, init17, sizeof(init17));

    return 0;
}

/* LG Optimus E980 (1080x1920 @ 48 Hz) config */
struct dsi_panel_config panel_e980 = {
    "LH550WF1-SD01 (LG E980)",
    4, /* num_lanes */

    (2 << 0) | (3 << 2) |
    (1 << 4) | (0 << 6) |
    (1 << 8) | (1 << 11) |
    (1 << 12),

    /* DSI_LANE(0, 2, 1) |
       DSI_LANE(1, 3, 0) |
       DSI_LANE(2, 0, 0) |
       DSI_LANE(3, 1, 1) |
       DSI_LANE_INVERT_CLOCK,*/

    /* lp_divider */
    6,

    /* width */
    1080,
    1920,                         /*
                                     height
                                   */

    96 + 48 - 24,                 /*
                                     h_front_porch
                                   */
    96 + 48 - 12,             /*
                                 h_back_porch
                               */                                                                                //

    2,                            /*
                                     v_front_porch
                                   */
    10,                           /*
                                     v_back_porch
                                   */
    200,                          /*
                                     frame_gap
                                   */
    1,
    edid_e980,                    /*
                                     EDID
                                   */
    &pll_e980,
    e980_init
};
