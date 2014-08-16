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


/* video_mixer.v - asynchronous video overlay. Overlays framebuffer
 image over HDMI input, outputs data for the DSI core. Work in progress. */

`timescale 1ns/1ps

module video_mixer
  (
   input 	 clk_sys_i,
   input 	 clk_dvi_i,
   input 	 rst_n_i,


   output 	 fb_almost_full_o,
   input 	 fb_wr_i,
   input [47:0]  fb_pixel_i,
   input 	 fb_vsync_i,
   output 	 fb_next_frame_o,

   input 	 dvi_de_i,
   input 	 dvi_hsync_i,
   input 	 dvi_vsync_i,
   input [47:0]  dvi_pixel_i,
   input 	 dvi_link_up_i,
   input 	 dvi_valid_i,

   input 	 dsif_almost_full_i,
   output 	 dsif_wr_o,
   output [47:0] dsif_pix_o,
   output reg 	 dsif_vsync_o,
   input 	 dsif_next_frame_i,

   output [7:0]  mixer_ctl_o,
   input [7:0] 	 mixer_ctl_i
   );

   
`define DVI_WAIT_VBLANK 0
`define DVI_WAIT_LINK 1
`define DVI_WAIT_ACTIVE 2
`define DVI_ACTIVE 3
   
   
   
   reg [2:0] 	 dvi_state;
   reg 		 dvi_visible_start;
   reg 		 dvi_vsync_d, dvi_frame_p;
   reg 		 dvi_fifo_mask;

   wire 	 rst_n_dvi = 1;
   
   always@(posedge clk_dvi_i)
     begin
	if (!rst_n_dvi || !dvi_link_up_i) begin
	   dvi_state <= `DVI_WAIT_LINK;
	   dvi_visible_start <= 0;
	   dvi_vsync_d <= 0;
	   dvi_frame_p <= 0;
	   dvi_fifo_mask <= 0;
	   
	   
	   
	end else begin
	   dvi_vsync_d <= dvi_vsync_i;
	   
	   case (dvi_state)
	     `DVI_WAIT_LINK:
	       begin
		  dvi_frame_p <= 0;
		  dvi_state<=`DVI_WAIT_VBLANK;
	       end
	     

	     `DVI_WAIT_VBLANK:
	       begin
		  
		  // vsync going low
		  if(!dvi_de_i && !dvi_vsync_i && dvi_vsync_d)
		    begin
		       dvi_fifo_mask <=1;
		       dvi_frame_p <= 1;
		       dvi_state <= `DVI_WAIT_ACTIVE;
		    end else
		      dvi_frame_p <= 0;
		  
	       end // case: `DVI_WAIT_VBLANK

	     
	     `DVI_WAIT_ACTIVE:
	       if(dvi_de_i)
		 dvi_state <= `DVI_ACTIVE;
	     

	     `DVI_ACTIVE:
	       begin
		  
		  if( dvi_vsync_i && !dvi_de_i )
		    dvi_state <= `DVI_WAIT_VBLANK;
	       end
	     
	     
	     
	   endcase // case (dvi_state)
	end
     end

   wire dvi_rd, dvi_empty;
   wire [47:0] dvi_pixel, fb_pixel;

   wire        overlay_enable, fbuf_purge;
   
   
   generic_async_fifo 
     #(
       .g_size(512),
       .g_data_width(48),
       .g_almost_empty_threshold(10),
       .g_almost_full_threshold(510)
       ) 
   U_DVI_ElasticBuffer 
     (
      .rst_n_i(dvi_link_up_i & rst_n_i & overlay_enable & ~dvi_vsync_i),
      .clk_wr_i(clk_dvi_i),
      .clk_rd_i(clk_sys_i),
      .wr_full_o(wr_full),
      .d_i(dvi_pixel_i),
      .we_i(dvi_valid_i & dvi_fifo_mask),

      .rd_i(dvi_rd),
      .rd_empty_o(dvi_empty),
      .q_o(dvi_pixel)
      );

   generic_sync_fifo 
     #(
       .g_size(128),
       .g_data_width(48),
       .g_almost_empty_threshold(1),
       .g_almost_full_threshold(100),
       .g_with_almost_full(1)
       ) 
   U_FB_ElasticBuffer 
     (
      .rst_n_i(rst_n_i & ~fbuf_purge),
      .clk_i(clk_sys_i),
      .almost_full_o(fb_almost_full_ebuf),
      .d_i(fb_pixel_i),
      .we_i(fb_wr_i),

      .rd_i(dvi_rd & ~dsif_almost_full_i),
      .empty_o(),
      .q_o(fb_pixel)
      );
   

`define ST_IDLE 0
`define ST_WAIT_DVI 1
`define ST_PUSH 2
`define ST_WAIT_ACTIVE 3
`define ST_PREFILL 4
   
   reg [2:0]   vid_state;

   reg [2:0]   dvi_frame_p_sync;
   wire        dvi_frame_p_sys;

   
   always@(posedge clk_sys_i)
     dvi_frame_p_sync <= { dvi_frame_p_sync[1:0], dvi_frame_p };

   assign dvi_frame_p_sys = dvi_frame_p_sync[1] & ~dvi_frame_p_sync[2];

   reg [10:0]  count;
   
   reg 	       dsif_wr_reg;
   
   always@(posedge clk_sys_i) begin
      if(!rst_n_i || !overlay_enable) begin
	 vid_state <= `ST_IDLE;
	 dsif_vsync_o <= 1;
	 
	 
      end else begin
	 case (vid_state)
	   `ST_IDLE: if(dsif_next_frame_i) begin
	      vid_state <= `ST_WAIT_DVI;
	      dsif_vsync_o <= 0;
	   end

	   `ST_WAIT_DVI:
	     if(dvi_frame_p_sys) begin
		vid_state <= `ST_WAIT_ACTIVE;
		dsif_vsync_o <= 1;
		count <= 0;
	     end
	   
	   `ST_WAIT_ACTIVE:
	     if(!dsif_next_frame_i)
	       begin
		  dsif_vsync_o <= 0;
		  vid_state <= `ST_PUSH;
	       end
	   
	   `ST_PUSH:
	     begin
		dsif_vsync_o <= 0;
		if(dsif_next_frame_i)
		  vid_state <= `ST_WAIT_DVI;
	     end
	 endcase // case (vid_state)
      end // else: !if(!rst_n_i || !r_enable)
   end // always@ (posedge clk_sys_i)

   reg gb_even;
   reg [23:0] dsif_pix_hi;
   reg 	      dsif_wr = 0;

   reg [4:0]  rst_dly;

   always@(posedge clk_sys_i)
     if(!rst_n_i)
       rst_dly <= 10;
     else if (rst_dly)
       rst_dly <= rst_dly -1;
   
   
   assign dvi_rd = (!dvi_empty) && (vid_state != `ST_IDLE) && (vid_state != `ST_WAIT_DVI);
   
   reg 	      dvi_rd_d0;
   
   always@(posedge clk_sys_i)
     if(!rst_n_i)
       dvi_rd_d0 <= 0;
     else
       dvi_rd_d0 <= dvi_rd;

   reg [47:0] dsif_pix_reg;

   // color key
   always@(posedge clk_sys_i)
     begin
	// no color key for the moment
	//	if(fb_pixel[47:24] == 'h0000f8) 
	dsif_pix_reg [47:24] <= dvi_pixel[47:24];
	//	else
	//	   dsif_pix_reg [47:24] <= fb_pixel[47:24];

	//	if(fb_pixel[23:0] == 'h0000f8) 
	dsif_pix_reg [23:0] <= dvi_pixel[23:0];
	//	else
	//	   dsif_pix_reg [23:0] <= fb_pixel[23:0];

	dsif_wr_reg <= dvi_rd_d0;
     end
   
   
   assign dsif_pix_o = overlay_enable ? dsif_pix_reg : fb_pixel_i;
   assign dsif_wr_o = overlay_enable ? dsif_wr_reg : fb_wr_i;
   assign fb_next_frame_o = overlay_enable ? (vid_state == `ST_WAIT_DVI) : dsif_next_frame_i;
   assign fb_almost_full_o = overlay_enable ? fb_almost_full_ebuf : dsif_almost_full_i;

   assign overlay_enable = mixer_ctl_i[0];
   assign fbuf_purge = mixer_ctl_i[1];

   assign mixer_ctl_o[0] = dvi_link_up_i;
   assign mixer_ctl_o[1] = dvi_vsync_i;
   
   
endmodule // video_mixer



