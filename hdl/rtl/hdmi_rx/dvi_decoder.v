//////////////////////////////////////////////////////////////////////////////
//
//  Xilinx, Inc. 2010                 www.xilinx.com
//
//  XAPPxxx
//
//////////////////////////////////////////////////////////////////////////////
//
//  File name :       dvi_decoder.v
//
//  Description :     Spartan-6 DVI decoder top module
//
//
//  Author :          Bob Feng
//
//  Disclaimer: LIMITED WARRANTY AND DISCLAMER. These designs are
//              provided to you "as is". Xilinx and its licensors makeand you
//              receive no warranties or conditions, express, implied,
//              statutory or otherwise, and Xilinx specificallydisclaims any
//              implied warranties of merchantability, non-infringement,or
//              fitness for a particular purpose. Xilinx does notwarrant that
//              the functions contained in these designs will meet your
//              requirements, or that the operation of these designswill be
//              uninterrupted or error free, or that defects in theDesigns
//              will be corrected. Furthermore, Xilinx does not warrantor
//              make any representations regarding use or the results ofthe
//              use of the designs in terms of correctness, accuracy,
//              reliability, or otherwise.
//
//              LIMITATION OF LIABILITY. In no event will Xilinx or its
//              licensors be liable for any loss of data, lost profits,cost
//              or procurement of substitute goods or services, or forany
//              special, incidental, consequential, or indirect damages
//              arising from the use or operation of the designs or
//              accompanying documentation, however caused and on anytheory
//              of liability. This limitation will apply even if Xilinx
//              has been advised of the possibility of such damage. This
//              limitation shall apply not-withstanding the failure ofthe
//              essential purpose of any limited remedies herein.
//
//  Copyright © 2004 Xilinx, Inc.
//  All rights reserved
//
//////////////////////////////////////////////////////////////////////////////
`timescale 1 ns / 1ps

module dvi_decoder (
  input wire 	     tmdsclk_p, // tmds clock
  input wire 	     tmdsclk_n, // tmds clock
  input wire 	     blue_p, // Blue data in
  input wire 	     green_p, // Green data in
  input wire 	     red_p, // Red data in
  input wire 	     blue_n, // Blue data in
  input wire 	     green_n, // Green data in
  input wire 	     red_n, // Red data in
  input wire 	     exrst, // external reset input, e.g. reset button

  output wire 	     reset, // rx reset
  output wire 	     pclk, // regenerated pixel clock
  output wire 	     pclkx2, // double rate pixel clock
  output wire 	     pclkx10, // 10x pixel as IOCLK
  output wire 	     pllclk0, // send pllclk0 out so it can be fed into a different BUFPLL
  output wire 	     pllclk1, // PLL x1 output
  output wire 	     pllclk2, // PLL x2 output

  output wire 	     pll_lckd, // send pll_lckd out so it can be fed into a different BUFPLL
  output wire 	     serdesstrobe, // BUFPLL serdesstrobe output
  output wire 	     tmdsclk, // TMDS cable clock

  output wire 	     hsync, // hsync data
  output wire 	     vsync, // vsync data
  output wire 	     de, // data enable
  output wire 	     blue_vld,
  output wire 	     green_vld,
  output wire 	     red_vld,
  output wire 	     blue_rdy,
  output wire 	     green_rdy,
  output wire 	     red_rdy,

  output wire 	     link_up,
  output wire 	     psalgnerr,

  output wire [29:0] sdout,
  output wire [7:0]  red, // pixel data out
  output wire [7:0]  green, // pixel data out
  output wire [7:0]  blue,

  output wire [47:0] pixel,
  output wire 	     pixel_valid);    // pixel data out
    

  wire [9:0] sdout_blue, sdout_green, sdout_red;
   wire [7:0] red_int ,green_int, blue_int;

  assign sdout = {sdout_red[9:5], sdout_green[9:5], sdout_blue[9:5],
                  sdout_red[4:0], sdout_green[4:0], sdout_blue[4:0]};

  wire de_b, de_g, de_r;

  assign de = de_b;

 //wire blue_vld, green_vld, red_vld;
 //wire blue_rdy, green_rdy, red_rdy;

  wire blue_psalgnerr, green_psalgnerr, red_psalgnerr;

  //
  // Send TMDS clock to a differential buffer and then a BUFIO2
  // This is a required path in Spartan-6 feed a PLL CLKIN
  //
  wire rxclkint;
  IBUFDS  #(.IOSTANDARD("TMDS_33"), .DIFF_TERM("FALSE")
  ) ibuf_rxclk (.I(tmdsclk_p), .IB(tmdsclk_n), .O(rxclkint));
 
  wire rxclk;

  BUFIO2 #(.DIVIDE_BYPASS("TRUE"), .DIVIDE(1))
  bufio_tmdsclk (.DIVCLK(rxclk), .IOCLK(), .SERDESSTROBE(), .I(rxclkint));

  BUFG tmdsclk_bufg (.I(rxclk), .O(tmdsclk));

  //
  // PLL is used to generate three clocks:
  // 1. pclk:    same rate as TMDS clock
  // 2. pclkx2:  double rate of pclk used for 5:10 soft gear box and ISERDES DIVCLK
  // 3. pclkx10: 10x rate of pclk used as IO clock
  //
  PLL_BASE # (
    .CLKIN_PERIOD(10),
    .CLKFBOUT_MULT(10), //set VCO to 10x of CLKIN
    .CLKOUT0_DIVIDE(1),
    .CLKOUT1_DIVIDE(10),
    .CLKOUT2_DIVIDE(5),
    .COMPENSATION("INTERNAL")
  ) PLL_ISERDES (
    .CLKFBOUT(clkfbout),
    .CLKOUT0(pllclk0),
    .CLKOUT1(pllclk1),
    .CLKOUT2(pllclk2),
    .CLKOUT3(),
    .CLKOUT4(),
    .CLKOUT5(),
    .LOCKED(pll_lckd),
    .CLKFBIN(clkfbout),
    .CLKIN(rxclk),
    .RST(exrst)
  );

  //
  // Pixel Rate clock buffer
  //
  BUFG pclkbufg (.I(pllclk1), .O(pclk));

  //////////////////////////////////////////////////////////////////
  // 2x pclk is going to be used to drive IOSERDES2 DIVCLK
  //////////////////////////////////////////////////////////////////
  BUFG pclkx2bufg (.I(pllclk2), .O(pclkx2));

  //////////////////////////////////////////////////////////////////
  // 10x pclk is used to drive IOCLK network so a bit rate reference
  // can be used by IOSERDES2
  //////////////////////////////////////////////////////////////////
  
  wire bufpll_lock;
  BUFPLL #(.DIVIDE(5)) ioclk_buf (.PLLIN(pllclk0), .GCLK(pclkx2), .LOCKED(pll_lckd),
           .IOCLK(pclkx10), .SERDESSTROBE(serdesstrobe), .LOCK(bufpll_lock));

  assign reset = ~bufpll_lock;

  decode dec_b (
    .reset        (reset),
    .pclk         (pclk),
    .pclkx2       (pclkx2),
    .pclkx10      (pclkx10),
    .serdesstrobe (serdesstrobe),
    .din_p        (blue_p),
    .din_n        (blue_n),
    .other_ch0_rdy(green_rdy),
    .other_ch1_rdy(red_rdy),
    .other_ch0_vld(green_vld),
    .other_ch1_vld(red_vld),

    .iamvld       (blue_vld),
    .iamrdy       (blue_rdy),
    .psalgnerr    (blue_psalgnerr),
    .c0           (hsync),
    .c1           (vsync),
    .de           (de_b),
    .sdout        (sdout_blue),
		.dout         (blue_int));
   

  decode dec_g (
    .reset        (reset),
    .pclk         (pclk),
    .pclkx2       (pclkx2),
    .pclkx10      (pclkx10),
    .serdesstrobe (serdesstrobe),
    .din_p        (green_p),
    .din_n        (green_n),
    .other_ch0_rdy(blue_rdy),
    .other_ch1_rdy(red_rdy),
    .other_ch0_vld(blue_vld),
    .other_ch1_vld(red_vld),

    .iamvld       (green_vld),
    .iamrdy       (green_rdy),
    .psalgnerr    (green_psalgnerr),
    .c0           (),
    .c1           (),
    .de           (de_g),
    .sdout        (sdout_green),
    .dout         (green_int)) ;
    
  decode dec_r (
    .reset        (reset),
    .pclk         (pclk),
    .pclkx2       (pclkx2),
    .pclkx10      (pclkx10),
    .serdesstrobe (serdesstrobe),
    .din_p        (red_p),
    .din_n        (red_n),
    .other_ch0_rdy(blue_rdy),
    .other_ch1_rdy(green_rdy),
    .other_ch0_vld(blue_vld),
    .other_ch1_vld(green_vld),

    .iamvld       (red_vld),
    .iamrdy       (red_rdy),
    .psalgnerr    (red_psalgnerr),
    .c0           (),
    .c1           (),
    .de           (de_r),
    .sdout        (sdout_red),
		.dout         (red_int));
   



   assign psalgnerr = red_psalgnerr | blue_psalgnerr | green_psalgnerr;
   assign link_up = green_vld;

   reg [23:0] pix_hi;
   reg 	      even;
   
   
   always@(posedge pclk)
     begin
	if(!de_b)
	  even <= 1;
	else begin
	   even <= ~even;
	   if(even)
	     pix_hi <= {red_int, green_int, blue_int};
	   end
     end // always@ (posedge pclk)

   assign pixel_valid = ~even & de;
   assign pixel = {pix_hi, red_int ,green_int, blue_int};
   
   assign red =red_int;
   assign green =green_int;
   assign blue = blue_int;
   
   
   
   
   
endmodule
