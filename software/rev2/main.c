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

/* main.c - main DSI Shield application */

#include <stdint.h>
#include <stdio.h>

#include "board.h"
#include "libhpdmc.h"
#include "dsi_core.h"
#include "fb.h"
#include "panels.h"
#include "sysctl.h"
#include "pll.h"
#include "uart.h"
#include "config.h"
#include "pp-printf.h"
#include "flash.h"
#include "menu.h"

static struct dsi_panel_config *panel;

int sdram_init();

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
        pp_sprintf(str,"Data rate: %d lanes x %d MBps", panel->num_lanes, dsi_calc_bitrate(panel));

        fb_text(&font_helv17, fb_width / 2 - 300, fb_height / 2 + 150,2, str, fb_makecolor(255,255,255));

        int byte_clock = pll_phy_freq() / 8 * panel->num_lanes;
        pp_sprintf(str,"Pixel clock: %d MHz", byte_clock / 3 / 1000000);

        fb_text(&font_helv17, fb_width / 2 - 300, fb_height / 2 + 180,2, str, fb_makecolor(255,255,255));

        pp_sprintf(str,"Refresh rate: %d Hz", dsi_calc_vrefresh(panel));
        fb_text(&font_helv17, fb_width / 2 - 300, fb_height / 2 + 210,2, str, fb_makecolor(255,255,255));


        pp_sprintf(str,"System clock: %d Hz", pll_system_freq());
        fb_text(&font_helv17, fb_width / 2 - 300, fb_height / 2 + 240,2, str, fb_makecolor(255,255,255));
}

#define ST_IDLE 0
#define ST_NO_HDMI 3
#define ST_GOT_HDMI 1
#define ST_ACTIVE_HDMI 2

void panel_set_brightness(int brightness)
{
        int v = brightness * 31/ 100;
        writel(SYS_PWM_CTL, v);
}

void hdmi_fsm_update()
{
        static int state = ST_IDLE;

        switch(state)
        {
        case ST_IDLE:
                if(!fb_hdmi_check_link())
                {
                        show_nosignal_screen();
                        panel_set_brightness(current_config.brightness);

                        state = ST_NO_HDMI;
                } else
                        state = ST_NO_HDMI;

                break;
        case ST_NO_HDMI:
                if(fb_hdmi_check_link())
                {
//					pp_printf("HDMI: link up\n");
                        fb_enable_overlay();
                        fb_clear(fb_makecolor(0xff,0xff,0xf8));
                        state = ST_ACTIVE_HDMI;
                }
                break;

        case ST_ACTIVE_HDMI:
                if(!fb_hdmi_check_link())
                {
//					pp_printf("HDMI: link down\n");
                        panel_set_brightness(0);

                        fb_disable_overlay();
                        show_nosignal_screen();
                        state = ST_NO_HDMI;
                }
                break;
        }

}

void run()
{
        for(;; )
        {
                cfg_menu_refresh();
                hdmi_fsm_update();
        }
}


void init()
{
        uart_init_hw();

        pp_printf("DSI Shield (build %s, %s) starting up...\n", build_revision, build_date);

        writel(SYS_PWM_CTL, 0);

        sdram_init();
        flash_init();

        cfg_init();
        cfg_menu_init();

        writel(SYS_GPIO_OUT, SYS_GPIO_OUT_EDID_EN);

        panel =  cfg_current_panel();

        if(panel->pll_cfg)
                pll_reconfigure(panel->pll_cfg);

        dsi_init(panel);

        if(panel->edid_data)
                fb_load_edid(panel->edid_data);

        fb_set_mode (panel->width, panel->height);

        pp_printf("Startup complete.\n");
}

int main()
{
        init();
        run();
        return 0;
}
