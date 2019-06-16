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

/* dsi_core.v - top level of the DSI core */

`include "dsi_defs.vh"

`timescale 1ns/1ps

module dsi_core
  (
   // system/FIFO clock 
   clk_sys_i,

   // DSI interface byte clock (=PHY clock/8)
   clk_dsi_i,

   // DSI HS clock
   clk_phy_i,

   // Shifted version of DSI/PHY clocks (for clock-data lane alignment)
  
   rst_n_i,

   pll_locked_i,
  
   // Pixel FIFO interface

   // 1 indicates the core is in LP mode, waiting for the start of the next frame
   pix_next_frame_o,
   // when pix_next_frame is asserted, 1 on pix_vsync_i starts outputting next frame
   pix_vsync_i,
   // FIFO almost full
   pix_almost_full_o,
   // FIFO pixel(s) input
   pix_i,
   // FIFO write
   pix_wr_i,

   // DSI high speed output (to serdes - last byte is clock)
   serdes_data_o,
   serdes_oe_o,
   
   // DSI low power output
   dsi_lp_p_o,
   dsi_lp_n_o,

   // Low power output enable
   dsi_lp_oe_o,

   // DSI clock lane LP signals + output enable
   dsi_clk_lp_p_o,
   dsi_clk_lp_n_o,
   dsi_clk_lp_oe_o,

   // Displat Reset pin
   dsi_reset_n_o,

   // Display Avdd power enable pin/user-defined GPIO
   dsi_gpio_o,

   // Host control registers (WBv4 pipelined, clk_sys_i clock domain)
   wb_adr_i,
   wb_dat_i,
   wb_dat_o,
   wb_sel_i,
   wb_cyc_i,
   wb_stb_i,
   wb_we_i,
   wb_ack_o,
   wb_stall_o,

   // axi4 lite slave (control registers)
   s_axil_ACLK,
   s_axil_ARESETN,
   s_axil_ARVALID,
   s_axil_AWVALID,
   s_axil_BREADY,
   s_axil_RREADY,
   s_axil_WVALID,
   s_axil_ARADDR,
   s_axil_AWADDR,
   s_axil_WDATA,
   s_axil_WSTRB,
   s_axil_ARREADY,
   s_axil_AWREADY,
   s_axil_BVALID,
   s_axil_RVALID, 
   s_axil_WREADY,
   s_axil_BRESP,
   s_axil_RRESP,
   s_axil_RDATA,

   // axi4 stream slave (video data)
   s_axis_aclk,
   s_axis_aresetn,
   s_axis_tdata,
   s_axis_tdest,
   s_axis_tid,
   s_axis_tkeep,
   s_axis_tlast,
   s_axis_tready,
   s_axis_tstrb,
   s_axis_tuser,
   s_axis_tvalid
   );
   
   // number of pixels processed in each clk_dsi_i cycle
   parameter g_pixels_per_clock = 1;
   // max number of DSI lanes
   parameter g_lanes = 3;
   // image FIFO size (holds g_pixels_per_clock * g_fifo_size pixels)
   parameter g_fifo_size = 1024;

   parameter g_pixel_interface_type = "AXI4";

   parameter g_control_interface_type = "AXI4";

   
   // PHY clock period, in picoseconds. Used to set clock-to-data shift.
   parameter g_clock_period_ps = 3600;
   // picoseconds per ODELAY2 tap.  Used to set clock-to-data shift.
   parameter g_ps_per_delay_tap = 50;
   
   parameter g_data_delay = (g_clock_period_ps / 2) / g_ps_per_delay_tap;
   parameter g_pixel_width = 24 * g_pixels_per_clock;

   input 			    s_axil_ACLK;
   input 			    s_axil_ARESETN;
   input 			    s_axil_ARVALID;
   input 			    s_axil_AWVALID;
   input 			    s_axil_BREADY;
   input 			    s_axil_RREADY;
//   input 			    s_axil_WLAST;
   input 			    s_axil_WVALID;
   input [31:0] 		    s_axil_ARADDR;
   input [31:0] 		    s_axil_AWADDR;
   input [31:0] 		    s_axil_WDATA;
   input [3:0] 			    s_axil_WSTRB;
   output 			    s_axil_ARREADY;
   output 			    s_axil_AWREADY;
   output 			    s_axil_BVALID;
//   output 			    s_axil_RLAST; 
   output 			    s_axil_RVALID; 
   output 			    s_axil_WREADY;
   output [1:0] 		    s_axil_BRESP;
   output [1:0] 		    s_axil_RRESP;
   output [31:0] 		    s_axil_RDATA;
   
   input 			    s_axis_aclk;
   input 			    s_axis_aresetn;
   input [31:0]			    s_axis_tdata; // fixme: generic
   input 			    s_axis_tdest;
   input s_axis_tid;
   input s_axis_tkeep;
   input s_axis_tlast;
   output reg s_axis_tready;
   input s_axis_tstrb;
   input s_axis_tuser;
  
   input s_axis_tvalid;
   
   
   input [31:0] wb_adr_i;
   input [31:0] wb_dat_i;
   output [31:0] wb_dat_o;
   input [3:0] 	 wb_sel_i;
   input         wb_cyc_i, wb_stb_i, wb_we_i;
   output        wb_ack_o, wb_stall_o;

   wire 	 clk_sys;
   wire 	 rst_n_sys;
   
   
   input 	 clk_sys_i, clk_phy_i, clk_dsi_i, rst_n_i;
   input 	 pll_locked_i;
   
   output 	 pix_next_frame_o;
   input 	 pix_vsync_i;
   output 	 pix_almost_full_o;
   input [g_pixel_width - 1 : 0 ] pix_i;
   input                          pix_wr_i;

   output [g_lanes-1:0] 	  dsi_lp_p_o, dsi_lp_n_o;
   output [g_lanes-1:0] 	  dsi_lp_oe_o;
   output                         dsi_clk_lp_p_o, dsi_clk_lp_n_o;
   output                         dsi_clk_lp_oe_o;

   output [(g_lanes+1)*8-1:0] 	  serdes_data_o;
   output reg [g_lanes:0] 	  serdes_oe_o;
   
   
   output reg                     dsi_reset_n_o;
   output reg [2:0] 		  dsi_gpio_o;
   
   wire [5:0] 			  host_a;
   wire [31:0] 			  host_d_in;
   wire [31:0] 			  host_d_out;
   wire 			  host_wr;

   reg [7:0] 			  r_lane_mux;
   reg [3:0]			  r_lane_invert;
   reg 				  r_clock_invert;
   reg 				  r_clock_polarity;

   wire [7:0] 			  clk_pattern = r_clock_polarity ? 8'h55 : 8'haa;
   

   initial
     begin
     if (g_control_interface_type != "Wishbone" && g_control_interface_type != "AXI4" )
       $fatal("dsi_core: g_control_interface_type must be Wishbone or AXI4");
     if (g_pixel_interface_type != "FIFO" && g_pixel_interface_type != "AXI4" )
       $fatal("dsi_core: g_pixel_interface_type must be FIFO or AXI4");
     end
   
   
   generate
      if (g_control_interface_type == "Wishbone")
	begin
      
	   dsi_wishbone_async_bridge 
	     #(
	       .g_csr_addr_bits(6)
	       ) U_CsrBridge (
			      .clk_wb_i (clk_sys),
			      .clk_csr_i (clk_dsi_i),
			      .rst_n_i(rst_n_sys),
			      .wb_adr_i(wb_adr_i),
			      .wb_dat_i(wb_dat_i),
			      .wb_sel_i(wb_sel_i),
			      .wb_cyc_i(wb_cyc_i),
			      .wb_stb_i(wb_stb_i),
			      .wb_we_i(wb_we_i),
			      .wb_ack_o(wb_ack_o),
			      .wb_stall_o(wb_stall_o),
			      .wb_dat_o(wb_dat_o),

			      .csr_adr_o(host_a),
			      .csr_dat_o(host_d_in),
			      .csr_wr_o(host_wr),
			      .csr_dat_i(host_d_out)
			      );
	end else if (g_control_interface_type == "AXI4") begin
	   
	   axi4_csr_bridge #(
			     .g_csr_addr_bits(6)
			     ) U_CsrBridge 
	     (
	      .clk_csr_i (clk_dsi_i),

	      .s_axil_ACLK		(s_axil_ACLK),
	      .s_axil_ARESETN 			   (s_axil_ARESETN),
	      .s_axil_ARVALID            (s_axil_ARVALID),
	      .s_axil_AWVALID            (s_axil_AWVALID),
	      .s_axil_BREADY           ( s_axil_BREADY),
	      .s_axil_RREADY           ( s_axil_RREADY),
//	      .s_axil_WLAST          (  s_axil_WLAST),
	      .s_axil_WVALID           ( s_axil_WVALID),
	      .s_axil_ARADDR   		  ( s_axil_ARADDR),
	      .s_axil_AWADDR   		  ( s_axil_AWADDR),
	      .s_axil_WDATA   		 (  s_axil_WDATA),
	      .s_axil_WSTRB   		 (  s_axil_WSTRB),
	      .s_axil_ARREADY            (s_axil_ARREADY),
	      .s_axil_AWREADY            (s_axil_AWREADY),
	      .s_axil_BVALID           ( s_axil_BVALID),
//	      .s_axil_RLAST           ( s_axil_RLAST), 
	      .s_axil_RVALID            (s_axil_RVALID), 
	      .s_axil_WREADY           ( s_axil_WREADY),
	      .s_axil_BRESP    	    (  s_axil_BRESP),
	      .s_axil_RRESP   	    (  s_axil_RRESP),
	      .s_axil_RDATA   		 (  s_axil_RDATA),

	      .csr_adr_o(host_a),
	      .csr_dat_o(host_d_in),
	      .csr_wr_o(host_wr),
	      .csr_dat_i(host_d_out)
	      );
	end
      
      


      endgenerate
   
   ///////////////////
   // PHY/Serdes layer
   ///////////////////
   
   reg                            tick = 0;
   
   wire [g_lanes-1:0] 		  phy_hs_ready_lane,  lp_ready_lane, lp_readback_lane;
   wire [g_lanes:0] 		  serdes_oe_lane;
   

   wire [g_lanes-1:0] 		  lp_txp, lp_txn, lp_oe;
  
   wire                           lp_ready;
   wire                           phy_hs_ready;

   assign lp_ready = lp_ready_lane[0];
   assign phy_hs_ready = phy_hs_ready_lane[0];

   wire                           phy_hs_request;
   wire [g_lanes * 8 -1 :0] 	  phy_hs_data;
   wire [g_lanes-1:0] 		  phy_hs_valid;
   wire [(g_lanes + 1) * 8 - 1: 0] serdes_data;
   reg                             r_dsi_clk_en = 0;
   reg                             lp_request = 0;
   reg                             lp_valid = 0;
   reg [7:0] 			   lp_data = 0;
   reg [2:0] 			   num_lanes;
   


   assign rst_n_sys = (g_control_interface_type == "AXI4" ? s_axil_ARESETN : rst_n_i );
   assign clk_sys =  (g_control_interface_type == "AXI4" ? s_axil_ACLK : clk_sys_i );
   
   dsi_sync_chain #(2) Sync3 (clk_dsi_i, rst_n_sys, 1'b1, rst_n_dsi);
   
   generate
      genvar                       i;
      for(i=0;i<g_lanes;i=i+1)
        begin
           dphy_lane
//            #(
//              .g_invert(g_invert_lanes&(1<<i)?1:0)
//              )  
           U_LaneX  
            (
             .clk_i(clk_dsi_i),
             .rst_n_i(rst_n_dsi),


             .tick_i(tick),

             .hs_request_i (phy_hs_request),
             .hs_data_i    (phy_hs_data),
             .hs_ready_o   (phy_hs_ready_lane[i]),
             .hs_valid_i(phy_hs_valid),

             .lp_request_i (lp_request),
             .lp_data_i    (lp_data),
             .lp_valid_i   (r_lane_mux[ i*2 +: 2] == 0 ? lp_valid : 1'b0),
             .lp_ready_o   (lp_ready_lane[i]),

             .serdes_data_o(serdes_data[ i*8 +: 8]),

	     .lane_sel_i( r_lane_mux[ i*2 +: 2] ),
	     .lane_invert_i( r_lane_invert[i] ), //g_invert_lanes&(1<<i)?1:0),
	     
             .lp_txp_o(lp_txp[i]),
             .lp_txn_o(lp_txn[i]),
             .lp_oe_o(lp_oe[i])
             );

           assign dsi_lp_p_o[i] = lp_txp[i];
           assign dsi_lp_n_o[i] = lp_txn[i];
           assign dsi_lp_oe_o[i] = lp_oe[0];
           assign serdes_oe_lane[i] = lp_oe[0];

        end // for (i=0;i<g_lanes;i=i+1)
   endgenerate
   

   wire clk_lane_ready;
   wire dsi_clk_lp_oe;
   
   dphy_lane
//     #(
//       .g_invert(g_invert_clock)
//       )
        U_ClockLane  (
                        .clk_i(clk_dsi_i),
                        .rst_n_i(rst_n_dsi),


                        .tick_i(tick),

                        .hs_request_i (r_dsi_clk_en),
                        .hs_data_i    ({24'h000000, clk_lane_ready ? clk_pattern : 8'h00}),
                        .hs_ready_o   (clk_lane_ready),
                        .hs_valid_i(1'b1),

                        .lp_request_i (1'b0),
                        .lp_data_i(8'h00),
                        .lp_valid_i(1'b0),
                        .lp_ready_o(),

                        .serdes_data_o(serdes_data[g_lanes*8 +: 8]),

			.lane_sel_i(2'b00),
			.lane_invert_i( r_clock_invert ), //g_invert_clock ? 1'b1: 1'b0),
			
                        .lp_txp_o(dsi_clk_lp_p_o),
                        .lp_txn_o(dsi_clk_lp_n_o),
                        .lp_oe_o(dsi_clk_lp_oe)
                        );

   assign serdes_oe_lane [g_lanes] = dsi_clk_lp_oe;
   assign dsi_clk_lp_oe_o = dsi_clk_lp_oe;

   
   assign serdes_data_o = serdes_data;
   
   always@(posedge clk_dsi_i)
        serdes_oe_o <= serdes_oe_lane;
   ////////////////   
   // Packet layer
   ///////////////

   wire                           p_req, p_islong, p_dreq, p_last;
   wire [5:0] 			  p_type;
   wire [15:0] 			  p_command, p_wcount;
   wire [g_pixel_width-1:0] 	  p_payload;
   
   
   dsi_packet_assembler 
     #(
       .g_num_lanes(g_lanes),
       .g_pixels_per_clock(g_pixels_per_clock)
       ) U_PktAsm (
                   .clk_i(clk_dsi_i),
                   .rst_n_i(rst_n_dsi),

                   .p_req_i(p_req),
                   .p_islong_i(p_islong),
                   .p_type_i(p_type),
                   .p_wcount_i(p_wcount),
                   .p_command_i(p_command),
                   .p_dreq_o(p_dreq),
                   .p_dlast_o(p_dlast),
                   .p_payload_i(p_payload),
                   .p_last_i(p_last),
                   
                   .phy_d_o(phy_hs_data),
                   .phy_hs_request_o(phy_hs_request),
                   .phy_hs_dreq_i(phy_hs_ready_lane[0]),
                   .phy_dvalid_o(phy_hs_valid),
                   .num_lanes_i(num_lanes)
                   );

   ////////////////
   // Test Screen generator
   ///////////////


   wire                           fifo_empty, fifo_rd;
   wire [g_pixel_width:0] 	  fifo_dout;

   
   ///////////////
   // Image timing
   ///////////////

   wire                           pix_vsync_dsi, pix_next_frame_dsi, pix_vsync_dsi_fifo, pix_vsync_dsi_axi4;

   dsi_sync_chain #(2) Sync1 (clk_dsi_i, rst_n_dsi, pix_vsync_i, pix_vsync_dsi_fifo);
   dsi_sync_chain #(2) Sync2 (clk_sys, rst_n_sys, pix_next_frame_dsi, pix_next_frame_o);


   generate
      if (g_pixel_interface_type == "FIFO") begin
	 assign pix_vsync_dsi = pix_vsync_dsi_fifo;
      end else begin

	 wire vsync_axi = s_axis_tready & s_axis_tvalid & s_axis_tuser;
	 
	 dsi_pulse_sync SyncVSync 
	   (
	    .clk_in_i(clk_sys),
	    .clk_out_i(clk_dsi_i),
	    .rst_n_i(rst_n_sys),
	    .d_p_i(vsync_axi),
	    .q_p_o(pix_vsync_dsi)
	    );
	 
	 
      end
   endgenerate

   (* mark_debug = "true", keep = "true" *) wire       cbgen_enable;
   wire [g_pixel_width-1:0] fifo_pixels_cbgen;
   (* mark_debug = "true", keep = "true"  *)    wire 		    fifo_empty_cbgen;
   (* mark_debug = "true", keep = "true"  *)    wire [g_pixel_width-1:0] fifo_pixels_muxed;
   (* mark_debug = "true", keep = "true" *)    wire 		    fifo_empty_muxed;
   (* mark_debug = "true", keep = "true" *)    wire 		    pix_vsync_cbgen;
   (* mark_debug = "true", keep = "true" *)    wire 		    pix_vsync_dsi_muxed;
   
   dsi_colorbar_gen
     #( .g_pixels_per_clock(g_pixels_per_clock) )
   U_ColorBarGen (
                  .clk_i(clk_dsi_i),
                  .rst_n_i(rst_n_dsi),
                  .fifo_empty_o(fifo_empty_cbgen),
		  .fifo_rd_i(fifo_rd),
                  .pix_vsync_o(pix_vsync_cbgen),
		  .fifo_pixels_o(fifo_pixels_cbgen),
		  .pix_next_frame_i(pix_next_frame_dsi),
      
                  .host_a_i(host_a),
                  .host_d_i(host_d_in),
                  .host_wr_i(host_wr),
		  .test_en_o(cbgen_enable)
		  );
   

   assign   fifo_empty_muxed = cbgen_enable ? fifo_empty_cbgen : fifo_empty;
   assign pix_vsync_dsi_muxed = cbgen_enable ? pix_vsync_cbgen : pix_vsync_dsi;
   assign fifo_pixels_muxed = cbgen_enable ? fifo_pixels_cbgen : fifo_dout[g_pixel_width-1:0] ;
   
			      
   dsi_timing_gen 
     #( .g_pixels_per_clock(g_pixels_per_clock) )
   U_TimingGen (
                .clk_i(clk_dsi_i),
                .rst_n_i(rst_n_dsi),
                .fifo_empty_i(fifo_empty_muxed),
		.fifo_rd_o(fifo_rd),
                .fifo_vsync_i(pix_vsync_dsi_muxed),
		.fifo_pixels_i(fifo_pixels_muxed),
//                .pix_vsync_i(pix_vsync_dsi),
                .pix_next_frame_o(pix_next_frame_dsi),
                .p_req_o(p_req),
                .p_islong_o(p_islong),
                .p_type_o(p_type),
                .p_wcount_o(p_wcount),
                .p_command_o(p_command),
                .p_payload_o(p_payload),
                .p_dreq_i(p_dreq),
                .p_last_o(p_last),
      
                .host_a_i(host_a),
                .host_d_i(host_d_in),
                //        .host_d_o(host_d_o),
                .host_wr_i(host_wr)
		);


   ////////////////
   /// Pixel Buffer
   ////////////////

   wire rst_n_pixel = 		  (g_pixel_interface_type == "AXI4" ? s_axis_aresetn : rst_n_i   );
   wire 			  clk_pixel = (g_pixel_interface_type == "AXI4" ? s_axis_aclk : clk_sys_i );

   reg pix_wr_muxed;
   reg [g_pixel_width : 0 ] pix_muxed;

   wire 		    fifo_almost_full;
   
   
   always@*
     if(g_pixel_interface_type == "AXI4") begin
	pix_muxed <= {s_axis_tuser, s_axis_tdata[g_pixel_width-1:0] };
	pix_wr_muxed <= s_axis_tvalid & ~fifo_almost_full;
     end else begin
	pix_muxed <= {pix_vsync_i, pix_i};
	pix_wr_muxed <= pix_wr_i;
     end

   always@*
     s_axis_tready <= ~fifo_almost_full ;

   
   generic_async_fifo
     #(
       .g_data_width(g_pixel_width + 1),
       .g_size(g_fifo_size),
       .g_almost_full_threshold(g_fifo_size-20),
       .g_almost_empty_threshold(10),
       .g_with_wr_almost_full(1'b1)
      
       ) 
   U_PixFifo 
     (
      .rst_n_i(rst_n_pixel),
      .clk_wr_i(clk_pixel),
      .d_i(pix_muxed),
      .wr_almost_full_o(fifo_almost_full),
      .we_i(pix_wr_muxed),

      .clk_rd_i(clk_dsi_i),
      .rd_i(fifo_rd),
      .rd_empty_o(fifo_empty),
      .q_o(fifo_dout)
      );
   
   



   ////////////////
   // Host regs
   ////////////////

   reg [11:0] 			  r_tick_div, tick_count;


   always@(posedge clk_dsi_i)
     begin
        if (!rst_n_dsi)
          tick_count <= 0;
        else begin
           if(tick_count == r_tick_div)
             begin
                tick <= 1;
                tick_count <= 0;
             end else begin
                tick <= 0;
                tick_count <= tick_count + 1;
             end
        end // else: !if(!rst_n_i)
     end // always@ (posedge clk_sys)

   reg [31:0] host_d_self;

   always@(posedge clk_dsi_i)
     if(!rst_n_dsi)
       begin
          r_tick_div <= 0;
          r_dsi_clk_en <= 0;
          lp_request <= 0;
          host_d_self <= 0;
          dsi_reset_n_o <= 0;
	  dsi_gpio_o <= 0;
	  r_lane_mux <= 0;
	  r_lane_invert <= 0;
	  r_clock_invert <= 0;
	  r_clock_polarity <= 0;
	  
	  
       end else if(host_wr) begin
          case(host_a)
            `REG_TICK_DIV: r_tick_div <= host_d_in;
            `REG_DSI_CTL: begin
               r_dsi_clk_en  <= host_d_in[0];
               lp_request <= host_d_in[1];
               num_lanes <= host_d_in[10:8];
               
            end
            
            `REG_LP_TX: 
              if(lp_ready) begin
                 lp_valid <= host_d_in[8];
                 lp_data <= host_d_in[7:0];
              end
            `REG_GPIO: begin
               dsi_reset_n_o <= host_d_in[0];
               dsi_gpio_o <= host_d_in[3:1];
            end

	    `REG_LANE_CTRL: begin
	       r_lane_mux <= host_d_in[7:0];
	       r_lane_invert <= host_d_in[11:8];
	       r_clock_invert <= host_d_in[12];
	       r_clock_polarity <= host_d_in[13];
	    end
	    
            
          endcase // case (host_a_i)
       end else begin
          lp_valid <= 0;
          
          case(host_a)
            `REG_DSI_CTL: begin
               host_d_self[7:2] <= 0;
               host_d_self[31:11] <= 0;
               host_d_self[0] <= r_dsi_clk_en;
               host_d_self[1] <= lp_ready;
               host_d_self[10:8] <= num_lanes;
            end

            `REG_GPIO: begin
               host_d_self <= 'hdeadbeef;
            end
            
            default:
              host_d_self <= 0;
          endcase // case (host_a)
       end // else: !if(host_wr_i)

   assign host_d_out = host_d_self;
   
endmodule // dsi_core



