/*.
 * DSI Shield
 * Copyright (C) 2013-2014 twl <twlostow@printf.cc>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.

 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

`timescale 1ns/1ps

module pll_drp_ram 
  (
   input 	 clk_a_i,
   input [4:0] 	 aa_i,
   input [39:0]  da_i,
   input 	 wea_i,

   input 	 clk_b_i,
   input [4:0] 	 ab_i,
   output reg [39:0] qb_o
   );

   reg [39:0] 	 ram [0:31];

   always@(posedge clk_a_i)
     if(wea_i)
       ram[aa_i] <= da_i;

   always@(posedge clk_b_i)
     qb_o <= ram[ab_i];
   
endmodule // reconf_ram


module pll_drp_sequencer
  #(
    parameter  	g_default_pll_mul = 1,  // for PLL_STATUS register
    parameter  	g_default_pll_sys_div = 2,
    parameter  	g_default_pll_phy_div = 3
    )  
   (
    input 	      clk_sys_i,

    input 	      clk_reconf_i,

    input [31:0]      r_pll_ctl0_i,
    input [31:0]      r_pll_ctl1_i,
    output [31:0]     r_pll_status_o,

    input 	      pll_locked_i,
    output reg 	      pll_rst_o,
    output reg [15:0] pll_di_o,
    input [15:0]      pll_do_i,
    input 	      pll_drdy_i,
    output reg [4:0]      pll_daddr_o,
    output reg 	      pll_den_o,
    output reg 	      pll_dwe_o,

    output busy_o
    );

   wire [4:0] 	      r_cfg_addr = r_pll_ctl0_i[4:0];
   wire [39:0] 	      r_cfg_data = {r_pll_ctl0_i[23:16], r_pll_ctl1_i[31:0]};
   wire 	      r_cfg_we = r_pll_ctl0_i[5];
   wire 	      r_cfg_trigger = r_pll_ctl0_i[6];
   wire [4:0] 	      r_n_regs = r_pll_ctl0_i[11:7];
   
   reg [4:0] index;
   
   wire [39:0] reg_val;

   pll_drp_ram ConfRam
     (
      .clk_a_i(clk_sys_i),
      .wea_i(r_cfg_we),
      .da_i(r_cfg_data),
      .aa_i(r_cfg_addr),

      .clk_b_i(clk_reconf_i),
      .ab_i(index),
      .qb_o(reg_val)
      );
   
`define ST_IDLE 0
`define ST_START_CONFIG 5
`define ST_READ_DRP 1
`define ST_WAIT_READ_DRP 2
`define ST_WRITE_DRP 3
`define ST_WAIT_WRITE_DRP 4
`define ST_READ_ROM 6
   `define ST_WAIT_LOCK 7

   reg [2:0]   state;
   reg 	       trig_d0, trig_d1, trig_d2;

   reg 	       restart;
   reg [15:0]  readback;

   reg [7:0]   powerup_delay = 'hff;
   reg 	       rst_powerup = 1;
   
   always@(posedge clk_reconf_i)
     if(powerup_delay == 0)
       rst_powerup <= 0;
     else
       powerup_delay <= powerup_delay - 1;
   
   
   
   always@(posedge clk_reconf_i or posedge rst_powerup)
     if (rst_powerup ) begin
	trig_d0 <= 0;
	trig_d1 <= 0;
	trig_d2 <= 0;
	restart <= 0;
	
     end else begin
	trig_d0 <= r_cfg_trigger;
	trig_d1 <= trig_d0;
	trig_d2 <= trig_d1;
	restart <= ~trig_d2 & trig_d1;
     end

   
   always@(posedge clk_reconf_i or posedge rst_powerup)
     if ( rst_powerup ) begin
	state <= `ST_IDLE;
	pll_rst_o <= 0;
	pll_dwe_o <= 0;
	pll_den_o <= 0;
	pll_daddr_o <= 0;
	
     end else begin

	if(restart)
	  state <= `ST_START_CONFIG;
	else case (state)
	       `ST_IDLE:
		 begin
		    pll_rst_o <= 0;
		    pll_dwe_o <= 0;
		    pll_daddr_o <= 0;
		    pll_den_o <= 0;
		    index <= 0;
		 end

	       `ST_START_CONFIG:
		 begin
		    pll_rst_o <= 1;
		    index <= 0;
		    state <= `ST_READ_ROM;
		 end

	       `ST_READ_ROM:
		 begin
		    pll_daddr_o <= reg_val[36:32];
		    state <= `ST_READ_DRP;
		    

		 end
	       
	       `ST_READ_DRP:
		 begin
		    pll_den_o <= 1;
		    pll_dwe_o <= 0;
		    state <= `ST_WAIT_READ_DRP;
		 end

	       `ST_WAIT_READ_DRP:
		 begin
		    pll_den_o <= 0;
		    
		    if (pll_drdy_i)
		      begin
			 state <= `ST_WRITE_DRP;
		      end
		 end
	       

	       `ST_WRITE_DRP:
		 begin
		    pll_di_o <= (pll_do_i & reg_val[31:16]) | reg_val[15:0];
		    index <= index + 1;
		    pll_den_o <= 1;
		    pll_dwe_o <= 1;
		    state <= `ST_WAIT_WRITE_DRP;
		 end

	       `ST_WAIT_WRITE_DRP:
		 begin
		    pll_den_o <= 0;
		    pll_dwe_o <= 0;

		    if(pll_drdy_i)
		      begin
			 
			 if( index == r_n_regs )
			   state <= `ST_WAIT_LOCK;
			 else
			   state <= `ST_READ_DRP;
		      end
		 end // case: `ST_WAIT_WRITE_DRP


	       `ST_WAIT_LOCK:
		 begin
		    pll_rst_o <= 0;

		    if (pll_locked_i)
		      state <= `ST_IDLE;
		 end
	       
	       
	     endcase // case (state)
     end
   


   
   
   assign r_pll_status_o[5:0] = g_default_pll_mul;
   assign r_pll_status_o[11:6] = g_default_pll_sys_div;
   assign r_pll_status_o[17:12] = g_default_pll_phy_div;   
   assign r_pll_status_o[18] = pll_locked_i;

   assign busy_o = (state != `ST_IDLE);
   
   
endmodule // pll_drp_sequencer

  



   
