#!/bin/bash

ARCH="xapp495.zip"

if [ ! -f "$ARCH" ]; then
    echo "ERROR: Can't find Xilinx App note 495 sources (file $ARCH). Please put it in this directory and run me again."
    exit 1
fi

unzip -j $ARCH "xapp495/dvi_demo/rtl/common/*.v"  -d hdmi_common
unzip -j $ARCH "xapp495/dvi_demo/rtl/rx/*.v"  -d hdmi_rx
