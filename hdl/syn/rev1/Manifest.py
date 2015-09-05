target = "xilinx"
action = "synthesis"

fetchto = "../../../ip_cores"

syn_device = "xc6slx9"
syn_grade = "-2"
syn_package = "tq144"
syn_top = "spec_top"
syn_project = "dsi_rev1.xise"
syn_tool = "ise"
top_module = "rev1_top"

modules = { "local" : [ "../../top/rev1" ] }

files = "boot.ram"