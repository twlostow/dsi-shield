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

/* panels.c - builtin panel timigs */

#include <stdio.h>

#include "dsi_core.h"

extern struct dsi_panel_config panel_iphone4;
extern struct dsi_panel_config panel_e980;

static struct dsi_panel_config *cfg[] = {
    &panel_e980,
    &panel_iphone4,
    NULL
};

int panel_count()
{
    int i = 0;
    while(cfg[i]) i++;
    return i;
}

struct dsi_panel_config *panel_get_config (int i)
{
    return cfg[i];
}
