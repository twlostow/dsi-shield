#!/bin/bash
VIVADO=/opt/Xilinx/Vivado/2018.3/bin
XVLOG=$VIVADO/xvlog
XVHDL=$VIVADO/xvhdl
XELAB=$VIVADO/xelab
XSIM=$VIVADO/xsim

$XSIM work.main --runall

