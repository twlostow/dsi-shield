/*
 * DSI Shield
 *
 * Copyright (C) 2013-2014 twl <twlostow@printf.cc>
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

#ifndef __FLASH_H
#define __FLASH_H

#define FLASH_PAGE_SIZE 256
#define FLASH_SECTOR_SIZE 0x10000
#define FLASH_SIZE 0x100000

void flash_erase_sector(uint32_t addr);
void flash_write_enable();
void flash_read(uint32_t addr,
                uint8_t *data,
                int      size);
void flash_program_page(uint32_t       addr,
                        const uint8_t *data,
                        int            size);
void flash_init();

#endif /* ifndef __FLASH_H */
