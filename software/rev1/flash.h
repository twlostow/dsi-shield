#ifndef __FLASH_H
#define __FLASH_H

void flash_erase_sector(uint32_t addr);
void flash_write_enable();
void flash_read(uint32_t addr, uint8_t * data, int size);
void flash_program_page(uint32_t addr, const uint8_t * data, int size);
void flash_init();

#endif
