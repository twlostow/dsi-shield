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

module axi4_csr_bridge
  #(
       parameter g_csr_addr_bits = 16
    )
  (
   input 			    s_axil_ACLK,
   input 			    s_axil_ARESETN,
   input 			    s_axil_ARVALID,
   input 			    s_axil_AWVALID,
   input 			    s_axil_BREADY,
   input 			    s_axil_RREADY,
   input 			    s_axil_WLAST,
   input 			    s_axil_WVALID,
   input [31:0] 		    s_axil_ARADDR,
   input [31:0] 		    s_axil_AWADDR,
   input [31:0] 		    s_axil_WDATA,
   input [3:0] 			    s_axil_WSTRB,
   output reg			    s_axil_ARREADY,
   output reg			    s_axil_AWREADY,
   output reg			    s_axil_BVALID,
   output reg			    s_axil_RLAST, 
   output reg			    s_axil_RVALID, 
   output reg			    s_axil_WREADY,
   output reg [1:0] 		    s_axil_BRESP,
   output reg[1:0] 		    s_axil_RRESP,
   output reg [31 :0] 		    s_axil_RDATA,

   input 			    clk_csr_i,
  
  
   output reg [g_csr_addr_bits-1:0] csr_adr_o,
   output reg [31:0] 		    csr_dat_o,
   output 			    csr_wr_o,
   input [31:0] 		    csr_dat_i
   );


   
`define ST_IDLE 0
`define ST_WAIT_ACK 1
`define ST_WAIT_IDLE 2

   reg [1:0] 			     state;
   reg 				     req_wb, req_write;
   wire 			     req_csr;

   reg 				     wb_stb_d0 = 0;
   reg 				     wb_stall;
   reg 				     ack_csr;
   
   wire 			     ack_wb;
   
   dsi_sync_chain sc_req_to_csr (clk_csr_i, s_axil_ARESETN, req_wb, req_csr);
   dsi_sync_chain sc_ack_to_wb (s_axil_ACLK, s_axil_ARESETN, ack_csr, ack_wb);
   
   reg 				     req_csr_d0;
   reg 				     ack_wb_d0;

   always@(posedge clk_csr_i) req_csr_d0 <= req_csr;
   always@(posedge s_axil_ACLK) ack_wb_d0 <= ack_wb;
   
   
   always@(posedge s_axil_ACLK or negedge s_axil_ARESETN)
     if(!s_axil_ARESETN)
       begin
          state <= `ST_IDLE;
          req_wb <= 0;
		 s_axil_WREADY  <= 0;
		 s_axil_BVALID  <= 0;
		 s_axil_RVALID <= 0;
		 s_axil_ARREADY  <= 1;
		 s_axil_AWREADY  <= 1;
       end else begin
	  
	  case (state)
            `ST_IDLE:
	      begin
		 s_axil_ARREADY <= 0;
		 s_axil_AWREADY <= 0;
		 s_axil_WREADY  <= 0;
		 s_axil_BVALID  <= 0;
		 s_axil_RVALID <= 0;
		 s_axil_RLAST <= 0;
		 req_wb <= 0;
		 
		 if(s_axil_ARVALID) begin
		    req_wb <= 1;
		    req_write <= 0;
		    csr_adr_o <= s_axil_ARADDR[g_csr_addr_bits+1:2];
		    state <= `ST_WAIT_ACK;
		    s_axil_ARREADY <= 1;

		 end

		 if(s_axil_AWVALID) begin
		    csr_adr_o <= s_axil_AWADDR[g_csr_addr_bits+1:2];
		    req_write <= 1;
		    s_axil_ARREADY <= 0;
		    s_axil_AWREADY <= 1;
		 end else if(s_axil_WVALID) begin
		    req_wb <= 1;
		    s_axil_WREADY  <= 1;
		    csr_dat_o <= s_axil_WDATA[31:0];
		    state <= `ST_WAIT_ACK;

		 end
		 
            end

            `ST_WAIT_ACK: 
	      begin
		 s_axil_ARREADY <= 0;
		 s_axil_AWREADY <= 0;
		 s_axil_WREADY <= 0;
		 
              if(ack_wb) 
		begin

		   s_axil_RRESP <= 0;
		   s_axil_BRESP <= 0;
		   s_axil_RDATA <= csr_dat_i;
		   s_axil_RLAST <= 1;
		   s_axil_WREADY <= 0;
		   
		   s_axil_RVALID <= !req_write;
		   s_axil_BVALID <= req_write;
		   
		   if( req_write && s_axil_BREADY )
		     state <= `ST_WAIT_IDLE;
		   else if ( !req_write && s_axil_RREADY )
		     state <= `ST_WAIT_IDLE;
		end // if (ack_wb)
	      end // case: `ST_WAIT_ACK
	    
	    `ST_WAIT_IDLE:
	      begin
		 req_wb <= 0;

		   s_axil_RVALID <= 0;
		   s_axil_BVALID <= 0;

		 
		 if(!ack_wb)
		   state <= `ST_IDLE;
	      end
	    
		
            
	  endcase // case (state)
       end // if (!s_axil_ARESETN)

   
   assign csr_wr_o = req_wb & req_write & !req_csr_d0 & req_csr;

   always@(posedge clk_csr_i)
     ack_csr <= req_csr;
   
endmodule
  
