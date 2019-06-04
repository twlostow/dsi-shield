action = "simulation"
target = "xilinx"
fetchto = "../../ip_cores"
sim_tool="modelsim"
syn_device="xc6slx45t"
top_module="main"
sim_top="main"

files = [ "glbl.v", "main.sv" ]
include_dirs=["../include", "../../sim", "../../rtl/dsi_core"]
modules = { "local" :  [  "../../ip_cores/local", "../../rtl/dsi_core", "../axi-bfm/src" ] }

