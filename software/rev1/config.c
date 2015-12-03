#include "config.h"
#include "flash.h"

#define CONFIG_SIGNATURE 0xdeadbeef

struct dsi_shield_config default_config = {
    0xdeadbeef,
    50,
    "LH350WS01-SD01",
    0
};


void cfg_init()
{

  //  flash-read()
}
