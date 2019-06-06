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

`timescale 1ps/1ps

/* dphy_serdes.v - the DSI SerDes, based on Xilinx IOSERDES primitves. */

module dphy_serdes_zynq 
  #(
    parameter g_delay = 0
    )
   (
    input 	clk_serdes_i,
    input 	clk_word_i,
    input 	rst_n_a_i,
    input 	oe_i,
   
    input [7:0] d_i,

    output 	q_p_o,
    output 	q_n_o
    );

   parameter SYS_W = 1;
   parameter DEV_W = 1;

   reg 		rst_int = 1'b1;
   wire 	dout_int, dout_predelay, tq_int;

   always@(posedge clk_word_i or negedge rst_n_a_i)
     if(!rst_n_a_i)
       rst_int <= 1;
     else
       rst_int <= 0;

   reg 		oe_d;

   always@(posedge clk_word_i)
     oe_d <= oe_i;
   
   
/*   wire [15:0]  oserdes_d;   // fills in starting with 13

   genvar 	     i;
   
   generate
      for (i = 0; i < 8; i = i + 1)
        assign oserdes_d[14-i-1] = d_i[i];
   endgenerate
  */ 

   
   OSERDESE2
     # (
        .DATA_RATE_OQ   ("SDR"),
        .DATA_RATE_TQ   ("SDR"),
        .DATA_WIDTH     (8),
        .TRISTATE_WIDTH (1),
        .SERDES_MODE    ("MASTER"))
   U_Serdes (
             .D1             (d_i[0]),
             .D2             (d_i[1]),
             .D3             (d_i[2]),
             .D4             (d_i[3]),
             .D5             (d_i[4]),
             .D6             (d_i[5]),
             .D7             (d_i[6]),
             .D8             (d_i[7]),
             .T1             (oe_d),
             .T2             (oe_d),
             .T3             (oe_d),
             .T4             (oe_d),
             .SHIFTIN1       (1'b0),
             .SHIFTIN2       (1'b0),
             .SHIFTOUT1      (),
             .SHIFTOUT2      (),
             .OCE            (1'b1),
             .CLK            (clk_serdes_i),
             .CLKDIV         (clk_word_i),
             .OQ             (dout_predelay),
             .TQ             (tq_int), // Tri-State control for IOB
             .OFB            (),
             .TFB            (),
             .TBYTEIN        (1'b0),
             .TBYTEOUT       (),
             .TCE            (1'b1),
             .RST            (rst_int));

   
   

/* -----\/----- EXCLUDED -----\/-----
   ODELAYE2 
     #(
       .CINVCTRL_SEL("FALSE"),
       .DELAY_SRC("ODATAIN"),
       .HIGH_PERFORMANCE_MODE("FALSE"),
       .ODELAY_TYPE("FIXED"),
       .ODELAY_VALUE (g_delay),
       .PIPE_SEL("FALSE"),
       .REFCLK_FREQUENCY(200.0),
       .SIGNAL_PATTERN("DATA")
       ) U_Delay (
		  .DATAOUT(dout_int),
		  .C(1'b0),
		  .CE(1'b0),
		  .CINVCTRL(1'b0),
		  .CLKIN(1'b0),
		  .CNTVALUEIN(5'b0),
		  .INC(1'b0),
		  .LD(1'b0),
		  .LDPIPEEN(1'b0),
		  .ODATAIN(dout_predelay),
		  .REGRST(1'b0));
 -----/\----- EXCLUDED -----/\----- */

   assign   dout_int  = dout_predelay;
   
   OBUFTDS
     #(.IOSTANDARD ("DIFF_SSTL18_II"))
   U_Tristate
     (.O          (q_p_o),
      .OB         (q_n_o),
      .T          (tq_int),
      .I          (dout_int));

endmodule

