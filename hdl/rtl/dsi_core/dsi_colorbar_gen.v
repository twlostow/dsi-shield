/* 
 * DSI Core
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

`include "dsi_defs.vh"

/* 
 * dsi_colorbar_gen.v
 *
 * Test color bar image generator.
 */

module dsi_colorbar_gen
  (
   clk_i,
   rst_n_i,

   host_a_i,
   host_d_i,
   host_d_o,
   host_wr_i,

   fifo_empty_o,
   fifo_rd_i,
   fifo_pixels_o,
   pix_vsync_o,
   pix_next_frame_i,

   test_en_o,

   );

   parameter g_pixels_per_clock = 1;

   localparam g_pixel_width = g_pixels_per_clock * 24;

   input clk_i;
   input rst_n_i;

   output fifo_empty_o;
   input  fifo_rd_i;
   output reg [g_pixel_width - 1: 0] fifo_pixels_o;

   output reg 			     pix_vsync_o;
   input 			     pix_next_frame_i;
   
   input [3:0] 			     host_a_i;
   input [31:0] 		     host_d_i;
   output reg [31:0] 		     host_d_o;
   input 			     host_wr_i;
   output 			     test_en_o;
   
`define ST_IDLE 0
`define ST_VSYNC 1
`define ST_IMAGE 2
`define ST_WAIT_NEXT_FRAME 3
   
   
   reg [11:0] 			     r_xsize, r_ysize;
(* mark_debug = "true", keep = "true" *)   reg 				     r_enable;
(* mark_debug = "true", keep = "true" *)   reg [2:0] 			     state;

(* mark_debug = "true", keep = "true" *)   reg [11:0] 			     xcnt, ycnt;
   reg [11:0] 			     vsync_cnt = 0;
   
   // host registers
   always@(posedge clk_i)
     if(!rst_n_i)
       begin
          r_enable <= 0;
	  
       end else if(host_wr_i) begin
          case (host_a_i)
            `REG_TEST_XSIZE:
	      r_xsize <= host_d_i;
            `REG_TEST_YSIZE:
	      r_ysize <= host_d_i;
	    `REG_TEST_CTL:
	      r_enable <= host_d_i[0];
          endcase // case (host_a_i)
       end

   always@(posedge clk_i)
     if(!rst_n_i || !r_enable)
       begin
	  state <= `ST_IDLE;
	  pix_vsync_o <= 0;
	  fifo_pixels_o <= 0;
	  
       end  else begin
	  case (state)
	    `ST_IDLE:
	      if(r_enable)
		begin
		   xcnt <= 0;
		   ycnt <= 0;
		   vsync_cnt <= 0;
		   state <= `ST_WAIT_NEXT_FRAME;
		end

	    `ST_WAIT_NEXT_FRAME:begin
	       if(pix_next_frame_i)
		 begin
		    pix_vsync_o <= 1;
		    state <= `ST_VSYNC;
		 end
	       end
	    
	    
	    `ST_VSYNC: begin
	       if(!pix_next_frame_i)
		 begin
		    pix_vsync_o <= 0;
		    state <= `ST_IMAGE;
		 end
	    end // case: `ST_VSYNC
	    
	    
	    `ST_IMAGE: 
	      begin
		 if(fifo_rd_i)
		   begin
		 if(xcnt == 0 || ycnt == 0 || xcnt == r_xsize || ycnt == r_ysize)
		   begin
		      fifo_pixels_o <= 'hffffff; // white border
		   end else begin
		      case (xcnt[8:6])
			3'b000: fifo_pixels_o <= 'hff0000; // red
			3'b001: fifo_pixels_o <= 'h00ff00; // green
			3'b010: fifo_pixels_o <= 'h0000ff; // blue
			3'b011: fifo_pixels_o <= 'hffff00; // yellow
			3'b100: fifo_pixels_o <= 'h00ffff; // cyan
			3'b101: fifo_pixels_o <= 'hff00ff; // magenta
			3'b110: fifo_pixels_o <= 'h808080; // grey
			3'b111: fifo_pixels_o <= 'h000000; // black
		      endcase // case (xcnt[7:5])
		   end

	          if( xcnt == r_xsize )
		   begin
		      xcnt <= 0;
		      if (ycnt == r_ysize)
			begin
			   ycnt <= 0;
			   xcnt <= 0;
			   vsync_cnt <= 0;
			   state <= `ST_WAIT_NEXT_FRAME;
			end else begin
			   ycnt <= ycnt + 1;
			end
		      
		      

		   end else begin
		      xcnt <= xcnt + 1;
		   end
		   end // if (fifo_rd_i)
	      end // case: `ST_IMAGE
	    
	  endcase // case (state)
       end

   assign fifo_empty_o = (state == `ST_VSYNC || state == `ST_IDLE || state == `ST_WAIT_NEXT_FRAME );
   assign test_en_o = r_enable;

   
endmodule // dsi_colorbar_gen

   
