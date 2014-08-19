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

/* panels.h - builtin panel timigs */

#ifndef __PANELS_H
#define __PANELS_H

#include "dsi_core.h"

/* Available LCD panel types */
#define PANEL_P880 	0  /* LG Optimus P880 (720x1280) */
#define PANEL_IPHONE4 	1  
#define PANEL_DNA 	2  /* HTC Droid DNA (1080x1920) */

/* Select your panel type here */
#define PANEL_TYPE	PANEL_IPHONE4

int panel_count();
struct dsi_panel_config *panel_get_config (int i);

#endif

