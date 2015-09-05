/* 
 * DSI Shield
 * Copyright (C) 2013-2014 twl <twlostow@printf.cc>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or 
 * (at your option) any later version.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */


/* framebuffer.v - a simple video framebuffer compatible with
 the FML SDRAM bus and DSI Core's FIFO interface. Also hosts a bunch of
 other control registers. */

`timescale 1ns/1ps

`define REG_CTL 0
`define REG_FB_ADDR 4
`define REG_FB_SIZE 8
`define REG_MIXCTL 12
`define REG_EDID_CTL 16
`define REG_PLL_STATUS 20
`define REG_PLL_CONFIG 24
`define REG_PWM_CONFIG 28

module fml_framebuffer  
  #(
    parameter g_fml_depth = 26,
    parameter  	g_pll_mul = 1,  // for PLL_STATUS register
    parameter  	g_pll_sys_div = 2,
    parameter  	g_pll_phy_div = 3
    ) ( 
	input 			 clk_sys_i,
	input 			 rst_n_i,

  

	input 			 pix_almost_full_i,
	output reg 		 pix_wr_o,
	output reg [47:0] 	 pix_o,
	output 			 pix_vsync_o,
	input 			 pix_next_frame_i,

	output [g_fml_depth-1:0] fml_adr,
	output reg 		 fml_stb,
	output 			 fml_we,
	output [3:0] 		 fml_sel,
	input [31:0] 		 fml_di,
	input 			 fml_ack,

	input [31:0] 		 wb_adr_i,
	input [31:0] 		 wb_dat_i,
	output reg [31:0] 	 wb_dat_o,
	input [3:0] 		 wb_sel_i,
	input 			 wb_cyc_i,
	input 			 wb_stb_i,
	input 			 wb_we_i,
	output 			 wb_ack_o,
	output 			 wb_stall_o,

	output [7:0] 		 mixer_ctl_o,
	input [7:0] 		 mixer_ctl_i,

	output reg [7:0] 	 edid_addr_o,
	output reg [7:0] 	 edid_data_o,
	output reg 		 edid_wr_o,

	output reg 		 pll_sys_clk_sel_o,

	output reg 		 pll_rst_o,
	output reg [15:0] 	 pll_do_o,
	output reg 		 pll_den_o,
	output reg 		 pll_dwe_o,
	output reg [4:0] 	 pll_daddr_o,
	input [15:0] 		 pll_di_i,
	input 			 pll_drdy_i,
	input 			 pll_locked_i,

	output 			 backlight_pwm_o
	);

   
   
   reg [g_fml_depth-1:0] 	 r_fb_addr;
   reg [g_fml_depth-1:0] 	 r_fb_size;
   reg 				 r_pix32, r_enable;
   reg [g_fml_depth-1:0] 	 pix_count, pix_addr;

   reg 				 even_pixel;
   wire 			 xfer_valid;
   reg [7:0] 			 r_mixctl;
   
   reg [6:0] 			 pwm_prescaler;
   reg [6:0] 			 pwm_count;
   reg [6:0] 			 pwm_setting;

   reg 				 pll_ready;
   
   always@(posedge clk_sys_i)
     if(!xfer_valid || !rst_n_i)
       pix_wr_o <= 0;
     else begin
	if(!r_pix32) begin // 16bit color
           pix_o[47:40] <= { fml_di[31:27], 3'h0 };
           pix_o[39:32] <= { fml_di[26:21], 2'h0 };
           pix_o[31:24] <= { fml_di[20:16], 3'h0 };
           pix_o[23:16] <= { fml_di[15:11], 3'h0 };
           pix_o[15:8] <= { fml_di[10:5], 2'h0 };
           pix_o[7:0] <= { fml_di[4:0], 3'h0 };
           pix_wr_o <= 1;
        end else begin
           if(even_pixel) begin
              pix_o[47:24] <= fml_di[23:0];
              pix_wr_o <= 0;
           end else begin
              pix_o[23:0] <= fml_di[23:0];
              pix_wr_o <= 1;
           end
        end // else: !if(!r_pix32)
     end // else: !if(!xfer_valid || !rst_n_i)

`define ST_WAIT_VSYNC 0
`define ST_START_BURST 1
`define ST_XFER_DATA  2
`define ST_FIFO_FULL 3
   
   reg[1:0] state;
   reg [1:0] cnt;

   assign fml_sel = 4'hf;
   assign fml_we = 1'b0;
   assign fml_adr = { pix_addr, 4'b0 }; // 16 bytes per burst
   
   always@(posedge clk_sys_i)
     begin
	if(!rst_n_i)
          begin
             fml_stb <= 0;
             state <= `ST_WAIT_VSYNC;
             even_pixel <= 1;
             
          end else begin
             case (state)
               `ST_WAIT_VSYNC: if (pix_next_frame_i && r_enable)
                 begin
                    pix_count <= r_fb_size;
                    pix_addr <= r_fb_addr;
                    state <= `ST_START_BURST;
                    even_pixel <= 1;
                    fml_stb <= 1;
                 end else
                   fml_stb <= 0;

               `ST_START_BURST:

		 if(fml_ack)
                   begin
                      if(!pix_almost_full_i) begin
                         pix_addr <= pix_addr + 1;
                         fml_stb <= 1;
                         state <= `ST_XFER_DATA;
                         cnt <= 0;
                      end else begin
                         fml_stb <= 0;
                         state <= `ST_FIFO_FULL;
                      end
                      
                   end 

               `ST_FIFO_FULL: begin
                  if(!pix_almost_full_i) begin
                     fml_stb <= 1;
                     state <= `ST_START_BURST;
                  end
               end
               
               `ST_XFER_DATA: begin
                  if(cnt == 2)
                    begin
                       pix_count <= pix_count - 1;
                       if(pix_count == 0)
			 state <= `ST_WAIT_VSYNC;
                       else
			 state <= `ST_START_BURST;
                    end
                  cnt <= cnt + 1;
                  even_pixel <= ~even_pixel;
               end // case: `ST_XFER_DATA
             endcase // case (state)
          end
     end

   assign xfer_valid = ( (fml_ack & ~pix_almost_full_i ) | (state == `ST_XFER_DATA));
//synthesis translate_off
      
   initial begin
      pll_sys_clk_sel_o = 0;
   end
//synthesis translate_on

   wire wb_stall;
   
   
   always@(posedge clk_sys_i)
     if(!rst_n_i)
       begin
          r_enable <= 0;
          r_pix32 <= 0;
	  r_mixctl <= 0;
	  pll_sys_clk_sel_o <= 0;
	  pll_ready <= 0;
	  pll_den_o <= 0;
	  pll_rst_o <= 0;
	  pll_dwe_o <= 0;
	  
	  
	  edid_wr_o <= 0;
       end else begin
          edid_wr_o <= 0;
	  if ( pll_drdy_i )
	    pll_ready <= 1;

	  pll_dwe_o <= 0;
	  pll_den_o <= 0;
	  
	  
	  if(wb_stb_i & wb_cyc_i) begin
             if(wb_we_i)
               case (wb_adr_i[4:0])
                 `REG_CTL: {r_pix32,r_enable} <= wb_dat_i[3:0];
		 `REG_MIXCTL: r_mixctl <= wb_dat_i[7:0];
                 `REG_FB_ADDR: r_fb_addr <= wb_dat_i;
                 `REG_FB_SIZE: r_fb_size <= wb_dat_i;
		 `REG_EDID_CTL:  begin
		    edid_addr_o <= wb_dat_i[7:0];
		    edid_data_o <= wb_dat_i[15:8];
		    edid_wr_o <= 1;
		 end
		 
		  `REG_PLL_CONFIG: begin

		     pll_do_o <= wb_dat_i[15:0];
		     pll_den_o <= wb_dat_i[16] & ~wb_stall ;
		     pll_dwe_o <= wb_dat_i[17];
		     pll_daddr_o <= wb_dat_i[22:18];
		     pll_sys_clk_sel_o <= wb_dat_i[31];
		     pll_rst_o <= wb_dat_i[30];
		     
		     pll_ready <= 0;
		  end
     
		 `REG_PWM_CONFIG: 
		   pwm_setting <= wb_dat_i[7:0];
		 
		 
               endcase // case (wb_adr_i)
             else
               case (wb_adr_i[4:0])
                 `REG_CTL: wb_dat_o[3:0] <= {r_pix32,r_enable};
		 `REG_MIXCTL: wb_dat_o[15:0] <= { mixer_ctl_i, r_mixctl };
		 
                 `REG_FB_ADDR: wb_dat_o <= r_fb_addr;
                 `REG_FB_SIZE: wb_dat_o <= r_fb_size;
		 `REG_PLL_STATUS:
		   begin
		      wb_dat_o[5:0] <= g_pll_mul;
		      wb_dat_o[11:6] <= g_pll_sys_div;
		      wb_dat_o[17:12] <= g_pll_phy_div;
		   end

		 `REG_PLL_CONFIG:
		   begin
		      wb_dat_o[15:0] <= pll_di_i;
		      wb_dat_o[16] <= pll_ready;
		      wb_dat_o[19] <= pll_locked_i;
		   end
		 
		 
		 
               endcase // case (wb_adr_i)
          end // if (wb_stb_i & wb_cyc_i)
       end // else: !if(!rst_n_i)

   reg [2:0] cyc_dly;

   
   always@(posedge clk_sys_i)
     if(!rst_n_i)
       cyc_dly <= 0;
     else
       cyc_dly <= { cyc_dly[1:0], wb_cyc_i & wb_stb_i };

   assign wb_stall = ~ (~cyc_dly[1] & cyc_dly[0]);
   assign wb_stall_o  =wb_stall;
   
   assign wb_ack_o = cyc_dly==3;
   
   assign pix_vsync_o = 1;
   assign mixer_ctl_o = r_mixctl;   
   
endmodule // fml_framebuffer
