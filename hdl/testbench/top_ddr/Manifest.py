action = "simulation"
target = "xilinx"
fetchto = "../../ip_cores"
sim_tool="modelsim"
syn_device="xc6slx45t"
top_module="main"
files = [ "glbl.v", "main.sv" ]
include_dirs=["../../sim"]
modules = { "local" :  [ "../../top/rev2" ] }

