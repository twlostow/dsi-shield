#ifndef __CONFIG_H
#define __CONFIG_H

#include <stdint.h>

extern const char *build_revision;
extern const char *build_date;

struct dsi_shield_config 
{
    uint32_t signature;
    int brightness;
    char display_type[32];
    uint16_t crc;
};

void cfg_init();
void cfg_read( struct dsi_shield_config *cfg );
int cfg_verify( struct dsi_shield_config *cfg );
void cfg_write( struct dsi_shield_config *cfg );

extern struct dsi_shield_config current_config;
struct dsi_panel_config *cfg_current_panel ();
int cfg_find_panel_index(const char *name);

#endif

