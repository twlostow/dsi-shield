#!/bin/bash
VIVADO=/opt/Xilinx/Vivado/2018.3/bin
XVLOG=$VIVADO/xvlog
XVHDL=$VIVADO/xvhdl
XELAB=$VIVADO/xelab

$XVLOG -i ../../rtl/dsi_core   ../../rtl/dsi_core/dsi_packer.v
$XVLOG -i ../../rtl/dsi_core   ../../rtl/dsi_core/dsi_utils.v
$XVLOG -i ../../rtl/dsi_core   ../../rtl/dsi_core/axi4_csr_bridge.v
$XVLOG -i ../../rtl/dsi_core   ../../rtl/dsi_core/dphy_lane.v
$XVLOG -i ../../rtl/dsi_core   ../../rtl/dsi_core/dsi_timing_gen.v
$XVLOG -i ../../rtl/dsi_core   ../../rtl/dsi_core/dsi_packet_assembler.v
$XVLOG -i ../../rtl/dsi_core   ../../rtl/dsi_core/dsi_colorbar_gen.v
$XVLOG -i ../../rtl/dsi_core   ../../rtl/dsi_core/dsi_core.v
$XVLOG -i ../../rtl/dsi_core/zynq   ../../rtl/dsi_core/zynq/dphy_serdes.v
$XVLOG -i ../../rtl/dsi_core/zynq   ../../rtl/dsi_core/zynq/dsi_core_zynq_wrapper.v
$XVLOG --sv -i ../axi-bfm/src   ../axi-bfm/src/interfaces.sv
$XVLOG --sv -i ../axi-bfm/src  ../axi-bfm/src/Axi4Lite.sv
$XVLOG --sv -i ../include -i ../../rtl/dsi_core  main.sv
$XVHDL ../../ip_cores/local/genram_pkg.vhd 
$XVHDL ../../ip_cores/local/gencores_pkg.vhd 
$XVHDL ../../ip_cores/local/gc_sync_register.vhd 
$XVHDL ../../ip_cores/local/gc_sync_ffs.vhd 
$XVHDL ../../ip_cores/local/inferred_async_fifo.vhd 
$XVHDL ../../ip_cores/local/generic_async_fifo.vhd 

$XELAB -L unisim work.main

