/*
 * libHPDMC - SDRAM initialization runtime for Milkymist SoC bootloaders
 * Copyright (C) 2010 Sebastien Bourdeauducq
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation;
 * version 3 of the License.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses>.
 */

#include "board.h"
#include "hpdmc.h"
#include "libhpdmc.h"

static void sdram_delay(int cycles)
{
    while(cycles--)
	asm volatile("nop");
}

void sdram_init()
{
    int i;

    writel(CSR_HPDMC_IODELAY, 0);

    writel(CSR_HPDMC_SYSTEM, HPDMC_SYSTEM_BYPASS|HPDMC_SYSTEM_RESET|HPDMC_SYSTEM_CKE);

    sdram_delay(7);

    writel(CSR_HPDMC_TIMING, 0xa17252);
    /* Precharge All */
    writel(CSR_HPDMC_BYPASS, 0x400b);
    sdram_delay(2);

    /* Load Extended Mode Register */
    writel(CSR_HPDMC_BYPASS, 0x2000f);
    sdram_delay(2);


    /* Burst len = 8, sequential mode, CL = 3 */
    /* Load Mode Register */
    writel(CSR_HPDMC_BYPASS, 0x133f);
    sdram_delay(200);

    /* Precharge All */
    writel(CSR_HPDMC_BYPASS, 0x400b);
    sdram_delay(2);

    /* Auto Refresh (twice)*/
    writel(CSR_HPDMC_BYPASS, 0xd);
    sdram_delay(8);
    writel(CSR_HPDMC_BYPASS, 0xd);
    sdram_delay(8);

    /* Load Mode Register, Enable DLL */
    writel(CSR_HPDMC_BYPASS, 0x33f);
    sdram_delay(200);

    /* All done, get the controller into gear */
    writel(CSR_HPDMC_SYSTEM, HPDMC_SYSTEM_CKE);


    writel(CSR_HPDMC_IODELAY, HPDMC_IDELAY_CAL);

    /* the IODELAYs require some signal edges during calibration... 
     * make dummy memory transfers to keep them happy.
     */
#ifdef SIMULATION
    for(i=0;i<20;i++)
#else
    for(i=0;i<50000;i++)
#endif
    {
	writel(BASE_SDRAM + 0x10000000, 0);
	writel(BASE_SDRAM + 0x00000000, 0);
	writel(BASE_SDRAM + 0x10000000, 0);
	writel(BASE_SDRAM + 0x00000000, 0xffffffff);
    }

    writel(CSR_HPDMC_IODELAY, HPDMC_IDELAY_RST);
    sdram_delay(200);

    writel(CSR_HPDMC_IODELAY, 0);
    sdram_delay(200);

#define INPUT_DELAY 30

    for(i=0;i<INPUT_DELAY;i++)
    {
        writel(CSR_HPDMC_IODELAY, HPDMC_IDELAY_CE|HPDMC_IDELAY_INC);
	sdram_delay(1);
    }

}

