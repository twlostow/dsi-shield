#ifndef __FLASH_H
#define __FLASH_H

#define FLASH_PAGE_SIZE 256
#define FLASH_SECTOR_SIZE 0x10000
#define FLASH_SIZE 0x100000

void flash_erase_sector(uint32_t addr);
void flash_write_enable();
void flash_read(uint32_t addr, uint8_t * data, int size);
void flash_program_page(uint32_t addr, const uint8_t * data, int size);
void flash_init();

#endif
