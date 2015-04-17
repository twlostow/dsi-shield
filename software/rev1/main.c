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

/* main.c - main LM32 application */

#include <stdint.h>

#include "board.h"
#include "libhpdmc.h"
#include "dsi_core.h"
#include "fb.h"
#include "panels.h"

#include "../bitmaps/logo.h"

static struct dsi_panel_config *panel;

int _sdram_init();

void center_text (const struct fb_font *font, int y, int scale, const char *str, uint32_t color)
{
    fb_text(font, (fb_width - fb_text_width(font, scale, str))/2, y, scale, str, color);
}

void show_nosignal_screen()
{
    fb_clear(fb_makecolor(0,0,0));

    fb_rect(0, 0, fb_width-1, fb_height-1, fb_makecolor(255,255,255));
//    fb_draw_bitmap ( fb_width / 2 - bmp_logo.h / 2, fb_height / 2 - bmp_logo.w , &bmp_logo );

    center_text(&font_helv17, fb_height / 2 + 40, 4, "No HDMI signal :-(", fb_makecolor(255,32,32));

    char str[80];

    pp_sprintf(str,"Panel: %s (%d x %d)", panel->name,panel->width, panel->height);

    fb_text(&font_helv17, fb_width / 2 - 300, fb_height / 2 + 120, 2, str, fb_makecolor(255,255,255));
	pp_sprintf(str,"Data rate: %d lanes x %d MBps", panel->num_lanes, board_phy_freq() / 1000000);

	fb_text(&font_helv17, fb_width / 2 - 300, fb_height / 2 + 150,2, str, fb_makecolor(255,255,255));


	int byte_clock = board_phy_freq() / 8 * panel->num_lanes;
	pp_sprintf(str,"Pixel clock: %d MHz", byte_clock / 3 / 1000000);

	fb_text(&font_helv17, fb_width / 2 - 300, fb_height / 2 + 180,2, str, fb_makecolor(255,255,255));

	int vtotal = panel->height + panel->v_front_porch + panel->v_back_porch;
	int htotal = panel->h_front_porch + panel->width *3 + panel->h_back_porch + 6 + 6 + 6 + 4;

	pp_printf("Full frame: %d\n", htotal * vtotal);
	pp_printf("System clock: %d Hz\n", board_system_freq());
	pp_printf("Data rate: %d lanes x %d MBps\n", panel->num_lanes, board_phy_freq() / 1000000);
	pp_printf("Refresh rate: %d Hz\n", byte_clock / (htotal * vtotal));

	pp_sprintf(str,"Refresh rate: %d Hz", byte_clock / (htotal * vtotal));
	fb_text(&font_helv17, fb_width / 2 - 300, fb_height / 2 + 210,2, str, fb_makecolor(255,255,255));


	pp_sprintf(str,"System clock: %d Hz", board_system_freq());
	fb_text(&font_helv17, fb_width / 2 - 300, fb_height / 2 + 240,2, str, fb_makecolor(255,255,255));


}

#define ST_IDLE 0
#define ST_NO_HDMI 3
#define ST_GOT_HDMI 1
#define ST_ACTIVE_HDMI 2

void hdmi_fsm()
{
	int state = ST_IDLE;


	while(1)
	{
		
		switch(state)
		{
			case ST_IDLE:
 			  	if(!fb_hdmi_check_link())
 			  		{
 			  			show_nosignal_screen(); 
 			  			state = ST_NO_HDMI;
 			  		} else 
 			  			state = ST_NO_HDMI;

 			  	break;
 			case ST_NO_HDMI:
 			  	if(fb_hdmi_check_link())
 			  	{
				 	fb_enable_overlay();
				 	fb_clear(fb_makecolor(0xff,0xff,0xf8));
				 	state = ST_ACTIVE_HDMI;
		  		}
		  		break;

		  	case ST_ACTIVE_HDMI: 
				if(!fb_hdmi_check_link())
 			  	{
 			  		fb_disable_overlay();
 			  		show_nosignal_screen(); 
 			  		state = ST_NO_HDMI;
 			  	} 			
				break; 
		}
	}

}


main()
{

	int i, j;
	
	uart_init_hw();
	_sdram_init();

	panel =  panel_get_config(PANEL_TYPE);
	dsi_init(panel);
	if(panel->edid_data)
		fb_load_edid(panel->edid_data);
	fb_set_mode (panel->width, panel->height);

	pp_printf("Panel : %d x %d\n", panel->width, panel->height) 	;

	hdmi_fsm();

	return 0;
}
