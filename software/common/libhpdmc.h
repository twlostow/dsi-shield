/*
 * libHPDMC - SDRAM initialization runtime for Milkymist bootloaders
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

#ifndef __LIBHPDMC_H
#define __LIBHPDMC_H

/* features */

#define FEAT_NO_OUTPUT
#undef FEAT_MANUAL_CALIBRATION
#undef FEAT_PBC_MANUAL_CALIBRATION
#undef FEAT_RETURN_STATUS

/* return codes for _sdram_init */
#define LIBHPDMC_SUCCESS 0
#define LIBHPDMC_MEMTEST_FAILED 1
#define LIBHPDMC_CALIBRATION_FAILED 2


#endif /* __LIBHPDMC_H */

