//////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2006 Xilinx, Inc.
// This design is confidential and proprietary of Xilinx, All Rights Reserved.
//////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /   Vendor:        Xilinx
// \   \   \/    Version:       1.0.0
//  \   \        Filename:      debnce.v
//  /   /        Date Created:  October 20, 2008
// /___/   /\    Last Modified: October 20, 2008
// \   \  /  \
//  \___\/\___\
//
// Devices:   Spartan-3 Generation FPGA
// Purpose:   Switch debouncer: Detecting signal transition and wait for 2^16
//            cycles
// Contact:   bob.feng@xilinx.com
// Reference: None
//
// Revision History:
//   Rev 1.0.0 - (Bob Feng) First created October 20, 2008.
//
//////////////////////////////////////////////////////////////////////////////
//
// LIMITED WARRANTY AND DISCLAIMER. These designs are provided to you "as is".
// Xilinx and its licensors make and you receive no warranties or conditions,
// express, implied, statutory or otherwise, and Xilinx specifically disclaims
// any implied warranties of merchantability, non-infringement, or fitness for
// a particular purpose. Xilinx does not warrant that the functions contained
// in these designs will meet your requirements, or that the operation of
// these designs will be uninterrupted or error free, or that defects in the
// designs will be corrected. Furthermore, Xilinx does not warrant or make any
// representations regarding use or the results of the use of the designs in
// terms of correctness, accuracy, reliability, or otherwise.
//
// LIMITATION OF LIABILITY. In no event will Xilinx or its licensors be liable
// for any loss of data, lost profits, cost or procurement of substitute goods
// or services, or for any special, incidental, consequential, or indirect
// damages arising from the use or operation of the designs or accompanying
// documentation, however caused and on any theory of liability. This
// limitation will apply even if Xilinx has been advised of the possibility
// of such damage. This limitation shall apply not-withstanding the failure
// of the essential purpose of any limited remedies herein.
//
//////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2006 Xilinx, Inc.
// This design is confidential and proprietary of Xilinx, All Rights Reserved.
//////////////////////////////////////////////////////////////////////////////

`timescale 1 ns / 1 ps

module debnce
  (
  input  wire        sync,
  input  wire        clk,
  output reg         debnced = 1'b0
  );

  //******************************************************************//
  // Implement debouncing.                                            //
  //******************************************************************//

  reg         [15:0] ctr;
  reg                dly;
  wire               sat;

  reg                sync_q;
  reg                transition;

  wire block_out;
  SRL16E #(.INIT(16'h0)) blockout_0 (
    .Q(block_out),
    .A0(1'b1),
    .A1(1'b1),
    .A2(1'b1),
    .A3(1'b1),
    .CE(1'b1),
    .CLK(clk),
    .D(1'b1)
  );

  always @ (posedge clk) begin
    sync_q <= sync;
    transition <= block_out & (sync_q ^ sync);
  end

  reg cntr_en;
  always @ (posedge clk) begin
    if(transition)
      cntr_en <= 1'b1;
    else if(sat)
      cntr_en <= 1'b0;
  end


`ifdef SIMULATION
  initial begin
    ctr = 16'b0;
  end

  parameter SATISFY = 16'hff;
`else
  parameter SATISFY = 16'hffff;
`endif

  assign sat = (ctr == SATISFY);

  always @(posedge clk)
  begin
    if(transition)
      ctr <= 1'b0;
    else if(cntr_en)
      ctr <= ctr + 1;
  end

  always @ (posedge clk) begin
    debnced <= sat;
  end 

endmodule
