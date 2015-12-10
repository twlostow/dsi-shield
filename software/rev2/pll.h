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

#ifndef __PLL_H
#define __PLL_H

#include <stdint.h>
#include <stddef.h>

#include "board.h"

struct pll_config {
    uint32_t mul;
    uint32_t sys_div;
    uint32_t phy_div;
    uint32_t phy_phase;
    const uint64_t *data;
};

void pll_reconfigure( const struct pll_config *cfg );
uint32_t pll_system_freq();
uint32_t pll_phy_freq();

#endif
