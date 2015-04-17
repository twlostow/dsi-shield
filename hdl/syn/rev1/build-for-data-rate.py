#!/usr/bin/python

import os
import shutil
import math
import subprocess

class PLLSettings:
    def __init__(self,data_rate, sys_clock):
	self.mul = 0
	self.sys_div = 0
	self.phy_div = 0
	self.clk_period = 0
	self.clk_sys = 0
	self.clk_phy = 0
	self.input_freq = 25e6
	self.vco_range_min = 400e6
	self.vco_range_max = 1080e6
	self.calculate(data_rate, sys_clock)

    def calculate(self, data_rate, sys_clock):
	best_m = None
	best_d = None
	best_err = 10000e6
	for m in range(1, 63):
	    for d in range(1,7):
		freq = self.input_freq * m / d;
		err = abs(freq - data_rate)
		if err < best_err:
		    best_err = err
		    best_freq = freq
		    best_m = m
		    best_d = d

	for d in range(1,63):
	    if (best_m * self.input_freq / d < sys_clock):
		sys_d = d
		break
	
	self.sys_div = sys_d
	self.phy_div = best_d
	self.mul = best_m
	self.clk_sys = self.input_freq * self.mul / self.sys_div
	self.clk_phy = self.input_freq * self.mul / self.phy_div
	self.clk_period = 1e12/self.clk_phy

    def show(self):
	print("PLL Config: M = %d Div_PHY = %d Div_SYS = %d\n" % (self.mul, self.sys_div, self.phy_div))
	print("Sys clock: %d Hz" % (self.clk_sys))
	print("PHY clock: %d Hz" % (self.clk_phy))
	print("Clock period: %d ps" % (self.clk_period))

#	print(best_m, best_d, best_err, best_freq)	

s = PLLSettings ( 1080e6, 100e6 )
s.show()

f=open("run.tcl","w")
f.write("project open dsi_test.xise\n")
f.write('project set {Other XST Command Line Options} "-generics {g_pll_mul=%d g_pll_phy_div=%d g_pll_sys_div=%d g_clock_period_ps=%d}"\n' % (s.mul, s.phy_div, s.sys_div, s.clk_period) )
f.write("process run {Generate Programming File} -force rerun_all\n")
print("Running!")
subprocess.call("xtclsh run.tcl", shell=True)
#os.system("/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/xtclsh run.tcl")
print("Done?")
shutil.copyfile("rev1_top.bit", "top_%d_mbit.bit" % (int(s.clk_phy/1e6)))
			

			