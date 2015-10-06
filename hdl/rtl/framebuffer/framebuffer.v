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
    parameter g_fml_depth = 26
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

	input 			 r_fb_enable_i,
	input 			 r_fb_pix32_i,
	input [g_fml_depth-1:0]  r_fb_addr_i,
	input [g_fml_depth-1:0]  r_fb_size_i
	);

   
   
   reg [g_fml_depth-1:0] 	 pix_count, pix_addr;

   reg 				 even_pixel;
   wire 			 xfer_valid;
   
   
   always@(posedge clk_sys_i)
     if(!xfer_valid || !rst_n_i)
       pix_wr_o <= 0;
     else begin
	if(!r_fb_pix32_i) begin // 16bit color
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
               `ST_WAIT_VSYNC: if (pix_next_frame_i && r_fb_enable_i)
                 begin
                    pix_count <= r_fb_size_i;
                    pix_addr <= r_fb_addr_i;
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

   assign pix_vsync_o = 1;
   
endmodule // fml_framebuffer
