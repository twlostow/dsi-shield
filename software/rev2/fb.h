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

/* fb.h - framebuffer support */

#ifndef __FB_H
#define __FB_H

#include <stdint.h>


struct fb_font {
    uint8_t min_char, max_char, height;
    const uint8_t *width_table;
    const uint16_t *offset_table;
    const uint8_t *glyph_data;
};

struct fb_rle_bitmap {
    int w, h;
    const uint8_t *data;
};

extern void *framebuffer;
extern int fb_width;
extern int fb_height;

extern const struct fb_font font_helv17;

void fb_setpixel(int x, int y, uint32_t color);
void fb_line (int x0, int y0, int x1, int y1, uint32_t color);
void fb_rect(int x, int y, int w, int h, uint32_t color);
void fb_box(int x, int y, int w, int h, uint32_t color);
void fb_text(const struct fb_font *fnt, int x, int y, int scale, const char *str, uint32_t color);
int fb_text_width(const struct fb_font *fnt, int scale, const char *str);
void fb_clear(uint32_t color);
uint32_t fb_makecolor(int r, int g, int b);
void fb_draw_bitmap(int x0, int y0, const struct fb_rle_bitmap *b);

void fb_set_mode(int w, int h);

int fb_hdmi_check_link();
void fb_enable_overlay();
void fb_disable_overlay();
void fb_hdmi_poll();

void fb_load_edid ( const uint8_t *data );

int get_phy_clock( );
int get_sys_clock( );


#endif

