#include <stdio.h>
#include <string.h>

#include "pp-printf.h"
#include "config.h"
#include "panels.h"
#include "flash.h"

#define CONFIG_SIGNATURE 0xdeadbeef
#define CONFIG_ADDR 0xf0000

struct dsi_shield_config default_config = {
    0xdeadbeef,
    50,
    "LH350WS02 (Iphone4/4S)",
    0
};

struct dsi_shield_config current_config;

uint16_t dsi_crc(const uint8_t *d, int n);

void cfg_init()
{
  cfg_read(&current_config);

  if(cfg_verify(&current_config))
  {
#ifdef DEBUG
    pp_printf("Config from flash OK.\n");
#endif
  } else {
#ifdef DEBUG
    pp_printf("Config from flash incorrect.\n");
#endif
    current_config = default_config;
    cfg_write(&current_config);
  }
}

void cfg_read( struct dsi_shield_config *cfg )
{
    flash_read(CONFIG_ADDR, ( uint8_t* ) cfg, sizeof(struct dsi_shield_config));
}

int cfg_verify( struct dsi_shield_config *cfg )
{
  if(cfg->signature != CONFIG_SIGNATURE)
    return 0;

  uint16_t crc_orig = cfg->crc;
  cfg->crc = 0;
  uint16_t crc_v = dsi_crc ( (const uint8_t* ) cfg, sizeof(struct dsi_shield_config));
  cfg->crc = crc_orig;

  return (crc_v == crc_orig);
}


void cfg_write( struct dsi_shield_config *cfg )
{
    cfg->crc = 0;
    cfg->signature = CONFIG_SIGNATURE;
    cfg->crc = dsi_crc ( (const uint8_t* ) cfg, sizeof(struct dsi_shield_config));

    flash_write_enable();
    flash_erase_sector(CONFIG_ADDR);
    flash_write_enable();
    flash_program_page(CONFIG_ADDR, (const uint8_t* ) cfg, sizeof(struct dsi_shield_config) );
}


int cfg_find_panel_index(const char *name)
{
    int   cnt = panel_count(), i;
    for(i = 0; i < cnt ;i++)
    {
	struct dsi_panel_config *panel = panel_get_config (i);
	if(!strcmp(panel->name, name))
	{
	    return i;
	}
    }

    return -1;
}

struct dsi_panel_config *cfg_current_panel()
{
    int index = cfg_find_panel_index(current_config.display_type);

    if(index < 0)
    {
	pp_printf("No matching panel found. Using default.\n");
	current_config = default_config;

	return panel_get_config(0);
    }

    return panel_get_config(index);
}