#ifndef __CONFIG_H
#define __CONFIG_H

#include <stdint.h>

struct dsi_shield_config 
{
    uint32_t signature;    
    int brightness;
    char display_type[32];
    uint16_t crc;
};


#endif
