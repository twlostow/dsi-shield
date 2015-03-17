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

static const uint8_t edid_p880[] =
#include "edid_p880.h"
;

static const uint8_t edid_iphone4[] =
#include "edid_ip4.h"
;

static const uint8_t edid_dna[] =
#include "edid_dna.h"
;

static const uint8_t edid_oculus_fake[] =
#include "edid_oculus_fake.h"
;

static const uint8_t edid_oculus_orig[] =
#include "edid_oculus_original.h"
;
/* LG P880 display (1280x720) config */
struct dsi_panel_config panel_p880 = {
  "LG Optimus P880",
  4,    /* num_lanes */
  2,    /* lp_divider */
  720,  /* width */
  1280, /* height */

  192 + 12 ,  /* h_front_porch */
  192 + 12,  /* h_back_porch */
  59,   /* v_front_porch */
  4,    /* v_back_porch */
  200,  /* frame_gap */
  edid_p880 /* EDID */
};

/* Iphone 4 display (640x960) config */
struct dsi_panel_config panel_iphone4 = {
  "LH350WS02 (Iphone4/4S)",
  3,    /* num_lanes */
  2,    /* lp_divider */
  640,  /* width */
  960, /* height */

  192,   /* h_front_porch */
  192,   /* h_back_porch */
  10,   /* v_front_porch */
  28,    /* v_back_porch */
  200,  /* frame_gap */
  edid_iphone4  /* EDID */
};

#if 1
struct dsi_panel_config panel_dna_1080p60 = {
  "LS050T1SX01 (Droid DNA)",
  4,    /* num_lanes */
  10,    /* lp_divider */
  1080,  /* width */
  1920, /* height */

  96+48-6,   /* h_front_porch */
  96+48-6,   /* h_back_porch */ // Total = 3534
  2,   /* v_front_porch */
  6,    /* v_back_porch */
  200,  /* frame_gap */
  edid_oculus_fake  /* EDID */
};
#endif

struct dsi_panel_config panel_dna = {
  "LS050T1SX01 (Droid DNA)",
  4,    /* num_lanes */
  5,    /* lp_divider */
  1080,  /* width */
  1920, /* height */

  96+48-12,   /* h_front_porch */
  96+48-12,   /* h_back_porch */ // Total = 3534
  2,   /* v_front_porch */
  6,    /* v_back_porch */
  200,  /* frame_gap */
  edid_oculus_fake /* EDID */
};


static struct dsi_panel_config *cfg[] = {
    &panel_p880,
    &panel_iphone4,
    &panel_dna,
    NULL
};

int panel_count()
{
    int i;
    while(cfg[i]) i++;
    return i;
}

struct dsi_panel_config *panel_get_config (int i)
{
    return cfg[i];
}
