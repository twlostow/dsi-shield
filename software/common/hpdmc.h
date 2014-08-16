/*
 * Milkymist SoC (Software)
 * Copyright (C) 2007, 2008, 2009, 2010 Sebastien Bourdeauducq
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef __HW_HPDMC_H
#define __HW_HPDMC_H


#define CSR_HPDMC_SYSTEM	(0x00030000)

#define HPDMC_SYSTEM_BYPASS	(0x01)
#define HPDMC_SYSTEM_RESET	(0x02)
#define HPDMC_SYSTEM_CKE	(0x04)

#define CSR_HPDMC_BYPASS	(0x00030004)

#define HPDMC_BYPASS_CS		(0x01)
#define HPDMC_BYPASS_WE		(0x02)
#define HPDMC_BYPASS_CAS	(0x04)
#define HPDMC_BYPASS_RAS	(0x08)
#define HPDMC_BYPASS_A_S	(4)
#define HPDMC_BYPASS_BA_S	(17)

#define CSR_HPDMC_TIMING	(0x00030008)

#define HPDMC_TIMING_TRP_S	(0)
#define HPDMC_TIMING_TRCD_S	(3)
#define HPDMC_TIMING_CL3	(0x40)
#define HPDMC_TIMING_TREFI_S	(7)
#define HPDMC_TIMING_TRFC_S	(18)
#define HPDMC_TIMING_TWR_S	(22)

#define CSR_HPDMC_IODELAY	(0x0003000C)

#define HPDMC_IDELAY_RST	(0x001)
#define HPDMC_IDELAY_CE		(0x002)
#define HPDMC_IDELAY_INC	(0x004)
#define HPDMC_IDELAY_CAL	(0x008)

#define SDRAM_BASE		(0x10000000)

#endif /* __HW_HPDMC_H */
