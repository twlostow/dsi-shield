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

/* fb.c - framebuffer support */

#include "board.h"
#include "fb.h"

#define FB_CTL 0x40000
#define FB_BASE 0x40004
#define FB_SIZE 0x40008
#define FB_MIXCTL 0x4000c
#define FB_EDID 0x40010
#define FB_PLL_STATUS 0x40014


#define MIXCTL_VSYNC 0x200
#define MIXCTL_LINK 0x100
#define MIXCTL_OVERLAY_EN 0x1
#define MIXCTL_FBUF_PURGE 0x2

void *framebuffer =(void *) 0x40000000;
int fb_width;
int fb_height;

void fb_setpixel(int x, int y, uint32_t color)
{
	if(x >= 0 && y >= 0 && x < fb_width && y <= fb_height)
	{
		uint32_t *ptr = (uint32_t *) ( framebuffer + y * fb_width * 2 + x * 2 );
		uint32_t p = *ptr;
		if(x & 1)
		{
			p &= 0xffff0000;
			p |= color;
		} else {
			p &= 0x0000ffff;
			p |= (color << 16);
		}
		*ptr = p;
	}
}

void fb_line (int x0, int y0, int x1, int y1, uint32_t color)
{
  int dx = abs(x1-x0), sx = x0<x1 ? 1 : -1;
  int dy = abs(y1-y0), sy = y0<y1 ? 1 : -1;
  int err = (dx>dy ? dx : -dy)/2, e2;

  for(;;){
    fb_setpixel(x0,y0,color);
    if (x0==x1 && y0==y1) break;
    e2 = err;
    if (e2 >-dx) { err -= dy; x0 += sx; }
    if (e2 < dy) { err += dx; y0 += sy; }
  }
}

void fb_rect(int x, int y, int w, int h, uint32_t color)
{
	fb_line(x,y,x+w-1, y, color);
	fb_line(x,y,x, y+h-1, color);
	fb_line(x+w-1,y+h-1,x+w-1, y, color);
	fb_line(x+w-1,y+h-1,x, y+h-1, color);
}

void fb_box(int x, int y, int w, int h, uint32_t color)
{
	int i,j;
	for(i=0;i<w;i++)
		for(j=0;j<h;j++)
			fb_setpixel(x+i,y+j, color);
}

void fb_clear(uint32_t color)
{
    int i;
    uint32_t *p = framebuffer;
    uint32_t v = (color << 16) | color;
    i=fb_width * fb_height / 2;
    while(i--) *p++ = v;
}

uint32_t fb_makecolor(int r, int g, int b)
{
	return ((r >> 3) << 11) | ((g >> 2) << 5) | (b >> 3);
}


void fb_draw_bitmap(int x0, int y0, const struct fb_rle_bitmap *b)
{
	int x =0,y=0;
	const uint8_t *d =(uint8_t *) b->data;
	while ( y != b->h)
	{
		int pix = (*d) & 0x80 ? 1: 0;
		int rep = ( (*d) & 0x7f) + 1;
		d++;
		
		while(rep--)
		{
			if(pix)
			    fb_setpixel(x0+y, y0+x, 0xffffffff);
			x++;
			if(x == b->w)
			{
				x=0;
				y++;
			}
		
		}
	
	}
	
}

int draw_glyph(const struct fb_font *font, int x0, int y0, int scale, int c, uint32_t color)
{
	if(c < font->min_char || c > font->max_char)
		return 0;

	const uint8_t *buf = font->glyph_data + font->offset_table[c - font->min_char];
	int w = font->width_table[c - font->min_char];
	int x,y;
	for(y=0;y<font->height*scale;y++)
		for(x=0;x<w*scale;x++)
			if(buf[((w + 7) >> 3) * (y/scale) + ((x/scale)>>3)] & (1<< (7-((x/scale) & 7))))
				fb_setpixel(x+x0, y+y0, color);
	return w*scale;
}

int fb_text_width(const struct fb_font *font, int scale, const char *str)
{
	int c;
	int w = 0;
	while(c = *str++)
	{
		if(c >= font->min_char && c <= font->max_char)
		{
			const uint8_t *buf = font->glyph_data + font->offset_table[c - font->min_char];
			w += font->width_table[c - font->min_char] * scale;
		}
	}
	return w;
}

void fb_text(const struct fb_font *fnt, int x, int y, int scale, const char *str, uint32_t color)
{
	char c;
	while(c = *str++)
		x += draw_glyph(fnt, x, y, scale, c, color);
}


void fb_set_mode(int w, int h)
{
    fb_width = w;
    fb_height = h;
    writel ( FB_MIXCTL, 0 );
    writel ( FB_CTL, 0 );

    writel ( FB_SIZE, fb_width * fb_height / 8 - 2);
    writel ( FB_BASE, 0 );
    writel ( FB_CTL, 1 );
}

int fb_hdmi_check_link()
{
	return (readl(FB_MIXCTL) & MIXCTL_LINK)  ? 1: 0;
}

void fb_disable_overlay()
{
	writel(FB_MIXCTL,0 );
    writel ( FB_CTL, 0 );
    writel(FB_MIXCTL, MIXCTL_FBUF_PURGE);
    writel(FB_MIXCTL,0 );
    writel ( FB_CTL, 1 );
}
 
void fb_enable_overlay()
{
    writel(FB_MIXCTL, MIXCTL_FBUF_PURGE);
 int i;
 dsi_force_lp(1);

 //wait for a couple of frames to make sure all the buffers are aligned
 for(i=0;i<2;i++)
 {
 	while(! (readl(FB_MIXCTL) & MIXCTL_VSYNC) );
    while( (readl(FB_MIXCTL) & MIXCTL_VSYNC) );
    
 }
 while(! (readl(FB_MIXCTL) & MIXCTL_VSYNC) );
    while( (readl(FB_MIXCTL) & MIXCTL_VSYNC) );
    
 //while( (readl(FB_MIXCTL) & MIXCTL_VSYNC) );
	dsi_force_lp(0);
    writel(FB_MIXCTL, MIXCTL_OVERLAY_EN );
}

void fb_load_edid ( const uint8_t *data )
{
    int i;
    for(i=0;i<128;i++)
        writel(FB_EDID, i | ((uint32_t)data[i] << 8));
}
