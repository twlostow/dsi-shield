#include "board.h"
#include "sysctl.h"

#define GPIO_SPI_EN 3
#define GPIO_SPI_CS 4
#define GPIO_SPI_SCK 5
#define GPIO_SPI_MOSI 6
#define GPIO_SPI_MISO 6

#define FLASH_PAGE_SIZE 256
#define FLASH_SECTOR_SIZE 0x10000
#define FLASH_SIZE 0x100000

/* M25Pxxx SPI flash commands */
#define FLASH_WREN 0x06
#define FLASH_WRDI 0x04
#define FLASH_RDID 0x9F
#define FLASH_RDSR 0x05
#define FLASH_WRSR 0x01
#define FLASH_READ 0x03
#define FLASH_FAST_READ 0x0B
#define FLASH_PP 0x02
#define FLASH_SE 0xD8
#define FLASH_BE 0xC7

void spi_cs(int cs)
{
    gpio_set(GPIO_SPI_CS, !cs);

}

void spi_delay()
{
    int i;
    for(i=0;i<100;i++)
      asm volatile("nop");
}

uint8_t spi_read8()
{
    uint8_t rv = 0;
    int i;

    gpio_set(GPIO_SPI_SCK, 0);
    spi_delay();
    gpio_set(GPIO_SPI_MOSI, 1);


    for(i=0;i<8;i++)
    {
	gpio_set(GPIO_SPI_SCK, 1);
	spi_delay();

	rv<<=1;

        if(gpio_get(GPIO_SPI_MISO))
	    rv |= 1;


	gpio_set(GPIO_SPI_SCK, 0);
	spi_delay();
    }

    return rv;
}

void spi_write8(uint8_t d)
{
    int i;

    gpio_set(GPIO_SPI_SCK, 0);
    spi_delay();
    gpio_set(GPIO_SPI_MOSI, 1);


    for(i=0;i<8;i++)
    {
	gpio_set(GPIO_SPI_MOSI, d & (1<<(7-i)) ? 1 : 0);
	spi_delay();
	gpio_set(GPIO_SPI_SCK, 1);
	spi_delay();
	gpio_set(GPIO_SPI_SCK, 0);
	spi_delay();
    }

}

void spi_enable(int enable)
{
    if(!enable)
	   spi_cs(1);
    delay(1000);

    gpio_set(GPIO_SPI_EN, enable);
    delay(1000);
}

uint32_t flash_read_id()
{
    uint32_t val = 0;

    /* make sure the flash is in known state (idle) */
    spi_cs(1);
    spi_delay();

    spi_cs(0);
    spi_delay();

    spi_cs(1);
    spi_write8(FLASH_RDID);
    val = (spi_read8() << 16);
    val += (spi_read8() << 8);
    val += spi_read8();
    spi_cs(0);

    return val;
}


static void flash_wait_completion()
{
	int not_done = 1;

	while (not_done) {
		spi_cs(1);
		spi_write8(FLASH_RDSR);	/* Read Status register */
		uint8_t stat = spi_read8();
		not_done = (stat & 0x01);
		spi_cs(0);
	}
}

void flash_erase_sector(uint32_t addr)
{
  spi_enable(1);
  spi_cs(1);
	spi_write8(FLASH_SE);
	spi_write8((addr >> 16) & 0xff);
	spi_write8((addr >> 8) & 0xff);
	spi_write8((addr >> 0) & 0xff);
	spi_cs(0);
	flash_wait_completion();
  spi_enable(0);
}

void flash_write_enable()
{
  spi_enable(1);
	spi_cs(1);
	spi_write8(FLASH_WREN);
	spi_cs(0);
  spi_enable(0);
}

void flash_read(uint32_t addr, uint8_t * data, int size)
{
  int n = 0;
  uint8_t *p = data;

  spi_enable(1);
  spi_cs(1);
  spi_write8(FLASH_READ);

  spi_write8((addr >> 16) & 0xff);
  spi_write8((addr >> 8) & 0xff);
  spi_write8((addr >> 0) & 0xff);

  //pp_printf("REad %d bytes\n", size);

  for (n = 0, p = data; n < size; n++)
  {

    *p = spi_read8();
    //pp_printf("Read %x\n", *p);
    p++;
  }

  spi_cs(0);
  spi_enable(0);
}

void flash_program_page(uint32_t addr, const uint8_t * data, int size)
{
	int i;
  spi_enable(1);

	spi_cs(1);
	spi_write8(FLASH_PP);	/* Page Program */
	spi_write8((addr >> 16) & 0x00ff);	/* Address to start writing (MSB) */
	spi_write8((addr >> 8) & 0x00ff);	/* Address to start writing */
	spi_write8(addr & 0x00ff);	/* Address to start writing (LSB) */
	for (i = 0; i < size; i++)
  {
    //pp_printf("write %x\n", data[i]);
  	spi_write8(data[i]);
  }

	for (; i < FLASH_PAGE_SIZE; i++)
		spi_write8(0xff);
	spi_cs(0);
	flash_wait_completion();

  spi_enable(0);
}

void flash_init()
{
    spi_enable(1);

    uint32_t id;

    id = flash_read_id();
    //pp_printf("Found FLASH: ID=%x\n",id);

    spi_enable(0);
}
