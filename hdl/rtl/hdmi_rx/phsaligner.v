//////////////////////////////////////////////////////////////////////////////
//
//  Xilinx, Inc. 2010                 www.xilinx.com
//
//  XAPP xxx - TMDS serial stream phase aligner
//
//////////////////////////////////////////////////////////////////////////////
//
//  File name :       phasealigner.v
//
//  Description :     This module determines whether the Spartan-6 IOSERDES
//                    has validate the incoming TMDS data stream 
//                    
//
//  Note:             
//
//  Author :    Bob Feng 
//
//  Disclaimer: LIMITED WARRANTY AND DISCLAMER. These designs are
//              provided to you "as is". Xilinx and its licensors make and you
//              receive no warranties or conditions, express, implied,
//              statutory or otherwise, and Xilinx specifically disclaims any
//              implied warranties of merchantability, non-infringement,or
//              fitness for a particular purpose. Xilinx does not warrant that
//              the functions contained in these designs will meet your
//              requirements, or that the operation of these designs will be
//              uninterrupted or error free, or that defects in the Designs
//              will be corrected. Furthermore, Xilinx does not warrantor
//              make any representations regarding use or the results of the
//              use of the designs in terms of correctness, accuracy,
//              reliability, or otherwise.
//
//              LIMITATION OF LIABILITY. In no event will Xilinx or its
//              licensors be liable for any loss of data, lost profits,cost
//              or procurement of substitute goods or services, or for any
//              special, incidental, consequential, or indirect damages
//              arising from the use or operation of the designs or
//              accompanying documentation, however caused and on any theory
//              of liability. This limitation will apply even if Xilinx
//              has been advised of the possibility of such damage. This
//              limitation shall apply not-withstanding the failure of the
//              essential purpose of any limited remedies herein.
//
//  Copyright © 2006 Xilinx, Inc.
//  All rights reserved
//
//////////////////////////////////////////////////////////////////////////////
//
`timescale 1 ns / 1ps

module phsaligner # (
  parameter OPENEYE_CNT_WD = 3, // valid open eye counter width
  parameter CTKNCNTWD      = 7, // Control Token Counter Width
  parameter SRCHTIMERWD    = 12 // Idle Timer Width
)
(
  input  wire       rst,
  input  wire       clk,
  input  wire [9:0] sdata,       // 10 bit serial stream sync. to clk
  output reg        flipgear,
  output reg        bitslip,
  output reg        psaligned    // FSM output
);  

  parameter CTRLTOKEN0 = 10'b1101010100;
  parameter CTRLTOKEN1 = 10'b0010101011;
  parameter CTRLTOKEN2 = 10'b0101010100;
  parameter CTRLTOKEN3 = 10'b1010101011;

  ///////////////////////////////////////////////////////
  // Control Token Detection
  ///////////////////////////////////////////////////////
  reg rcvd_ctkn, rcvd_ctkn_q;
  reg blnkbgn; //blank period begins

  always @ (posedge clk) begin
    rcvd_ctkn <=#1 ((sdata == CTRLTOKEN0) || (sdata == CTRLTOKEN1) || 
                    (sdata == CTRLTOKEN2) || (sdata == CTRLTOKEN3));

    rcvd_ctkn_q <=#1 rcvd_ctkn;
    blnkbgn <=#1 !rcvd_ctkn_q & rcvd_ctkn;
  end

  /////////////////////////////////////////////////////
  // Control Token Search Timer
  //
  // DVI 1.0 Spec. says periodic blanking should start
  // no less than every 50ms or 20HZ
  // 2^24 of 74.25MHZ cycles is about 200ms
  /////////////////////////////////////////////////////
  reg [(SRCHTIMERWD-1):0] ctkn_srh_timer;
  reg ctkn_srh_rst;  //FSM output

  always @ (posedge clk) begin
    if (ctkn_srh_rst)
      ctkn_srh_timer <=#1 {SRCHTIMERWD{1'b0}};
    else
      ctkn_srh_timer <=#1 ctkn_srh_timer + 1'b1;
  end

  reg ctkn_srh_tout;
  always @ (posedge clk) begin
    ctkn_srh_tout <=#1 (ctkn_srh_timer == {SRCHTIMERWD{1'b1}});
  end

  /////////////////////////////////////////////////////
  // Contorl Token Event Counter
  //
  // DVI 1.0 Spec. says the minimal blanking period
  // is at least 128 pixels long in order to achieve
  // synchronization
  //
  // HDMI reduces this to as little as 8
  /////////////////////////////////////////////////////
  reg [(CTKNCNTWD-1):0] ctkn_counter;
  reg ctkn_cnt_rst; //FSM output

  always @ (posedge clk) begin
    if(ctkn_cnt_rst)
      ctkn_counter <=#1 {CTKNCNTWD{1'b0}};
    else
      ctkn_counter <=#1 ctkn_counter + 1'b1;
  end

  reg ctkn_cnt_tout;
  always @ (posedge clk) begin
    ctkn_cnt_tout <=#1 (ctkn_counter == {CTKNCNTWD{1'b1}});
  end

  //////////////////////////////////////////////////////////
  // Below starts the phase alignment state machine
  //////////////////////////////////////////////////////////
  parameter INIT        = 6'b1 << 0;
  parameter SEARCH      = 6'b1 << 1;  // Searching for control tokens
  parameter BITSLIP     = 6'b1 << 2;
  parameter RCVDCTKN    = 6'b1 << 3;  // Received at one Control Token and check for more
  parameter BLNKPRD     = 6'b1 << 4;
  parameter PSALGND     = 6'b1 << 5;  // Phase alignment achieved
  parameter nSTATES     = 6;

  reg [(nSTATES-1):0] cstate = {{(nSTATES-1){1'b0}}, 1'b1};  //current and next states
  reg [(nSTATES-1):0] nstate;
  
`ifdef SIMULATION
  // synthesis translate_off
  reg  [8*20:1] state_ascii = "INIT               ";
  always @(cstate) begin
    if      (cstate == INIT     ) state_ascii <= "INIT               ";
    else if (cstate == SEARCH   ) state_ascii <= "SEARCH             ";
    else if (cstate == BITSLIP  ) state_ascii <= "BITSLIP            ";
    else if (cstate == RCVDCTKN ) state_ascii <= "RCVDCTKN           ";
    else if (cstate == BLNKPRD  ) state_ascii <= "BLNKPRD            ";
    else state_ascii                          <= "PSALGND            ";
  end
  // synthesis translate_on
`endif

  always @ (posedge clk or posedge rst) begin
    if (rst)
      cstate <= INIT;
    else
      cstate <=#1 nstate;
  end

  //////////////////////////////////////////////////////////
  // Counter counts number of blank period detected
  // in order to qualify the bitslip position
  //////////////////////////////////////////////////////////
  parameter BLNKPRD_CNT_WD = 1;

  reg [(BLNKPRD_CNT_WD-1):0] blnkprd_cnt = {BLNKPRD_CNT_WD{1'b0}};

  always @ (*) begin
    case (cstate) //synthesis parallel_case full_case
      INIT: begin
        nstate = (ctkn_srh_tout) ? SEARCH : INIT;
      end

      SEARCH: begin
        if(blnkbgn)
          nstate = RCVDCTKN;
        else
          nstate = (ctkn_srh_tout) ? BITSLIP : SEARCH;
      end

      BITSLIP: begin
        nstate = SEARCH;
      end

      RCVDCTKN: begin
        if(rcvd_ctkn)
          nstate = (ctkn_cnt_tout) ? BLNKPRD : RCVDCTKN;
        else
          nstate = SEARCH;
      end

      BLNKPRD: begin
        nstate = (blnkprd_cnt == {BLNKPRD_CNT_WD{1'b1}}) ? PSALGND : SEARCH;
      end

      PSALGND: begin
        nstate = PSALGND; // Phase aligned so hang around here
      end
    endcase
  end

  reg [2:0] bitslip_cnt;

  always @ (posedge clk or posedge rst) begin
    if(rst) begin
      psaligned          <=#1 1'b0; //phase alignment success flag
      bitslip            <=#1 1'b0;
      ctkn_srh_rst       <=#1 1'b1; //control token search timer reset
      ctkn_cnt_rst       <=#1 1'b1; //control token counter reset

      bitslip            <=#1 1'b0;
      bitslip_cnt        <=#1 3'h0;
      flipgear           <=#1 1'b0;
      blnkprd_cnt        <=#1 {BLNKPRD_CNT_WD{1'b0}};
    end else begin
      case (cstate) // synthesis parallel_case full_case
        INIT: begin
          ctkn_srh_rst       <=#1 1'b0;
          ctkn_cnt_rst       <=#1 1'b1;
          bitslip            <=#1 1'b0;
          psaligned          <=#1 1'b0;

          bitslip            <=#1 1'b0;
          bitslip_cnt        <=#1 3'h0;
          flipgear           <=#1 1'b0;
          blnkprd_cnt        <=#1 {BLNKPRD_CNT_WD{1'b0}};
        end

        SEARCH: begin
          ctkn_srh_rst       <=#1 1'b0;
          ctkn_cnt_rst       <=#1 1'b1;
          bitslip            <=#1 1'b0;
          psaligned          <=#1 1'b0;
        end

        BITSLIP: begin
          ctkn_srh_rst       <=#1 1'b1;

          bitslip            <=#1 1'b1;
          bitslip_cnt        <=#1 bitslip_cnt + 1'b1;
          flipgear           <=#1 bitslip_cnt[2]; //bitslip has toggled for 4 times
        end

        RCVDCTKN: begin
          ctkn_srh_rst       <=#1 1'b0;
          ctkn_cnt_rst       <=#1 1'b0;
        end

        BLNKPRD: begin
          blnkprd_cnt        <=#1 blnkprd_cnt + 1'b1;
        end

        PSALGND: begin
          psaligned <=#1 1'b1;
        end
      endcase
    end
  end

endmodule
