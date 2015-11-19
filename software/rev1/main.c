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
#include <stdio.h>

#include "board.h"
#include "libhpdmc.h"
#include "dsi_core.h"
#include "fb.h"
#include "panels.h"
#include "sysctl.h"

//#include "../bitmaps/logo.h"

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
	pp_printf("%s\n", str);

	int byte_clock = board_phy_freq() / 8 * panel->num_lanes;
	pp_sprintf(str,"Pixel clock: %d MHz", byte_clock / 3 / 1000000);

	fb_text(&font_helv17, fb_width / 2 - 300, fb_height / 2 + 180,2, str, fb_makecolor(255,255,255));

	int vtotal = panel->height + panel->v_front_porch + panel->v_back_porch;
	int htotal = panel->h_front_porch + panel->width *3 + panel->h_back_porch + 6 + 6 + 6 + 4;

	pp_printf("Full frame: %d\n", htotal * vtotal);

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
					    pp_printf("no sg\n");
 			  		    show_nosignal_screen(); 
    					    writel(SYS_PWM_CTL, 16);

 			  			state = ST_NO_HDMI;
 			  		} else 
 			  			state = ST_NO_HDMI;

 			  	break;
 			case ST_NO_HDMI:
 			  	if(fb_hdmi_check_link())
 			  	{
					pp_printf("HDMI: link up\n");
				 	fb_enable_overlay();
				 	fb_clear(fb_makecolor(0xff,0xff,0xf8));
				 	state = ST_ACTIVE_HDMI;
		  		}
		  		break;

		  	case ST_ACTIVE_HDMI: 
				if(!fb_hdmi_check_link())
 			  	{
					pp_printf("HDMI: link down\n");
				    writel(SYS_PWM_CTL, 0);

 			  		fb_disable_overlay();
 			  		show_nosignal_screen(); 
 			  		state = ST_NO_HDMI;
 			  	} 			
				break; 
		}
	}

}


void memtest_test(void *buffer, size_t megabytes, int passes);

volatile uint32_t *buf = 0x80000000;

main()
{

	int i, j;

	writel(SYS_PWM_CTL, 0);
	
	uart_init_hw();
	pp_printf("Setting up SDRAM.\n");
	sdram_init();
	pp_printf("Startup.\n");


//	memtest_init();


//	for(;;)
//	    memtest_test((void *) 0x80000000, 16, 10);
#if 0

//	pll_init();

	pp_printf("running memtest...\n");
    int iter=0;
	for(;;)
	{
	    pp_printf("iter %d!\n",iter++);

	int n = 0x1000000;

	for(i=0;i<n;i++)
	    buf[i] = i;

//	for(i=0;i<100;i++)
//	    buf[i] = i;

	
	for(i=0;i<n;i++)
	{
	    int v1 = i&0xffff;
	    int v2 = buf[i]&0xffff;
	    if(v1 != v2)
	    pp_printf("%x != %x\n", v1, v2 );
	}
	}
//	for(;;);

	*(volatile uint32_t *) 0x80000000 = 0xffff0000;

#if 1
	for(;;)
	{
	    int i;
	    for(i=0;i<1000000;i++);
	//    pp_printf("ping!\n");

	    i = *(volatile uint32_t *) 0x80000000;

//	    uint32_t v = *(volatile uint32_t *) 0x80000000;// = 0xffffffff;
//	    v = *(volatile uint32_t *) 0x80001000;// = 0xffffffff;
	}
#endif

#endif


	writel(SYS_GPIO_OUT, SYS_GPIO_OUT_EDID_EN);


	panel =  panel_get_config(PANEL_TYPE);
	dsi_init(panel);
	if(panel->edid_data)
		fb_load_edid(panel->edid_data);
	fb_set_mode (panel->width, panel->height);

	pp_printf("Panel : %d x %d\n", panel->width, panel->height) 	;

//	writel(SYS_PWM_CTL, 16);

//	memtest_init();

// 			  			show_nosignal_screen(); 

//	for(;;)
//	    memtest_test((void *) 0x80000000, 1, 10);

//	for(;;);


	//mi2c_scan(0);
	
	hdmi_fsm();

	return 0;
}
