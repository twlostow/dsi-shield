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

/* menu.c - config menu stuff */

#include <stdio.h>
#include <string.h>

#include "uart.h"
#include "pp-printf.h"
#include "config.h"
#include "panels.h"

#define ESC_CHAR 0x1b
#define ESC_TIMEOUT 10000

#define KEY_UP 0x1b41
#define KEY_DOWN 0x1b42
#define KEY_LEFT 0x1b44
#define KEY_RIGHT 0x1b43
#define KEY_ENTER 0x0d

#define CMD_ENTER 1
#define CMD_FORMAT 2
#define CMD_KEY 3

int kb_state = 0;

int kb_expect()
{
    int timeout;

    for (timeout = ESC_TIMEOUT; timeout > 0; timeout--)
        if (uart_poll()) return uart_read_byte();

    return -1;
}

int kb_input()
{
    int i, timeout;

    if (!uart_poll()) return 0;

    int c = uart_read_byte();

    if (c == ESC_CHAR)
    {
        c = kb_expect();

        if (c < 0) return ESC_CHAR;

        if (c != '[')
        {
            return 0;
        }
        c = kb_expect();

        if (c < 0) return 0;

        return (c & 0xff) | 0x1b00;
    }

    return c;
}

struct menu_item
{
    const char *label;
    int         (*func)(int   cmd,
                        void *data);
};

int cb_display_type(int cmd, void *data)
{
    int key = (int)data;

    switch (cmd)
    {
    case CMD_FORMAT:
        pp_sprintf((char *)data, "%s", current_config.display_type);
        return 1;

    case CMD_KEY:
    {
        int idx = cfg_find_panel_index(current_config.display_type);
        struct dsi_panel_config *panel;

        if ((key == KEY_LEFT) && (idx > 0)) idx--;
        else if ((key == KEY_RIGHT) && (idx < panel_count() - 1)) idx++;

        panel = panel_get_config(idx);

        strcpy(current_config.display_type, panel->name);
    }

        return 0;

    case CMD_ENTER:
        return 0;
    }
}

int cb_display_brightness(int cmd, void *data)
{
    int   i, b;
    char *buf = (char *)data;

    switch (cmd)
    {
    case CMD_FORMAT:
    {
        *buf++ = '[';


        b = current_config.brightness * 32 / 100;

        for (i = 0; i < 32; i++) *buf++ = (i < b ? '#' : ' ');

        *buf++ = ']';

        pp_sprintf(buf, " %d%%", current_config.brightness);


        return 1;
    }

    case CMD_KEY:
    {
        int key = (int)data;

        if (key == KEY_LEFT) current_config.brightness -= 5;
        else if (key == KEY_RIGHT) current_config.brightness += 5;

        if (current_config.brightness < 0) current_config.brightness = 0;

        if (current_config.brightness > 100) current_config.brightness =
                100;

        panel_set_brightness(current_config.brightness);
        break;

    case CMD_ENTER:
        return 0;
    }
    }
    return 0;
}

int cb_save_restart(int cmd, void *data)
{
    if (cmd == CMD_ENTER)
    {
        cfg_write(&current_config);

        pp_printf("\033[2J\033[;H");
        pp_printf("Rebooting device...\n");
        delay(2000000);
        asm volatile ("li t0,0");
        asm volatile ("jr t0");

        //	exit(0);
    }

    return 0;
}

int cb_device_info(int cmd, void *data)
{
    int cnt, i;

    if (cmd == CMD_ENTER)
    {
        pp_printf("\033[2J\033[;H");
        pp_printf("DSI Shield Device Info\n\n");
        pp_printf("Firmware version: %s, built on %s\n",
                  build_revision,
                  build_date);
        pp_printf("Supported displays: \n");
        cnt = panel_count();

        for (i = 0; i < cnt; i++)
        {
            struct dsi_panel_config *panel = panel_get_config(i);
            pp_printf(
                "- %s (%dx%d, DSI %d-lane, %d MBps/lane, %d Hz refresh\n",
                panel->name,
                panel->width,
                panel->height,
                panel->num_lanes,

                dsi_calc_bitrate(panel),
                dsi_calc_vrefresh(panel)
                );
        }

        return 1;
    }

    if (cmd == CMD_KEY)
    {
        return 0;
    }

    return 0;
}

static struct menu_item cfg_menu_items[] =
{
    { "Select display type",
      cb_display_type                                           },
    { "Adjust brightness",
      cb_display_brightness                                     },
    { "Device info",
      cb_device_info                                            },
    { "Save settings & restart",
      cb_save_restart                                           },
    { NULL }
};


struct menu_state {
    char             *title;
    struct menu_item *items;
    struct menu_item *active;
    int               state;
    int               current_item;
    int               n_items;
};


static struct menu_state cfg_menu =
{
    "DSI Shield Setup (up/down to navigate, left/right to adjust)",
    cfg_menu_items
};


void menu_init(struct menu_state *state)
{
    int i;

    state->current_item = 0;
    state->active       = NULL;
    state->n_items      = 0;

    for (i = 0; state->items[i].label; i++) state->n_items++;
}

void menu_refresh(struct menu_state *menu)
{
    char buf[64];
    struct menu_item *item;

    int i;

    int c = kb_input();


    if (!c) return;

    if (menu->active)
    {
        if (!menu->active->func(CMD_KEY, (void *)c))
        {
            pp_printf("disactivate\n");
            menu->active = NULL;
        } else return;
    }

    switch (c)
    {
    case KEY_UP:

        if (menu->current_item > 0) menu->current_item--;
        break;

    case KEY_DOWN:

        if (menu->current_item < menu->n_items - 1) menu->current_item++;
        break;

    case KEY_ENTER:
        item = &menu->items[menu->current_item];


        if (item->func)
        {
            if (item->func(CMD_ENTER, menu))
            {
                menu->active = item;
                return;
            }
            else menu->active = NULL;
        }
        break;

    default:
    {
        item = &menu->items[menu->current_item];

        if (item->func) item->func(CMD_KEY, (void *)c);

        break;
    }
    }

    pp_printf("\033[2J\033[;H");
    pp_printf("%s\n\n", menu->title);

    int max_len = 0, l, j;

    for (i = 0; i < menu->n_items; i++)
    {
        l = strlen(menu->items[i].label);

        if (l > max_len) max_len = l;
    }

    for (i = 0; i < menu->n_items; i++)
    {
        struct menu_item *item = &menu->items[i];

        if (i == menu->current_item)
            pp_printf("\033[7m");

        l = strlen(item->label);

        pp_printf(" %s", item->label);

        for (j = 0; j < max_len + 1 - strlen(item->label); j++)
            pp_printf(" ");

        pp_printf("\033[0m");

        if (item->func && item->func(CMD_FORMAT, buf))
        {
            pp_printf(" : %s", buf);
        }

        pp_printf("\n");
    }
}

void cfg_menu_refresh()
{
    menu_refresh(&cfg_menu);
}

void cfg_menu_init()
{
    menu_init(&cfg_menu);
}
