/*
 * Milkymist SoC
 * Copyright (C) 2007, 2008, 2009, 2010 Sebastien Bourdeauducq
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

`timescale 1ns/1ps

module hpdmc_ddrio (
	input         sys_clk,
	input         sys_clk_n,

	input         direction,
	input [3:0]   mo,
	input [31:0]  do,
	output [31:0] di,
	
	output [1:0]  sdram_dm,
	inout [15:0]  sdram_dq,
	inout [1:0]   sdram_dqs,

        output        sdram_clk_p,
        output        sdram_clk_n,
                    
	input         idelay_rst,
	input         idelay_ce,
	input         idelay_inc,
	input         idelay_cal
);

   parameter data_delay = 0;
   parameter dqs_delay = 0;
   parameter clock_delay = 0;
   
   
/* Clock forward */

   wire          sdram_clk, sdram_clk_predelay;
   
   OBUFDS
     #(.IOSTANDARD ("DIFF_SSTL2_II"))
   obufds_inst
     (.O          (sdram_clk_p),
      .OB         (sdram_clk_n),
      .I          (sdram_clk));
   
   // Instantiate the delay primitive
   ////-------------------------------
   IODELAY2
     #(.DATA_RATE                  ("DDR"),
       .ODELAY_VALUE               ( clock_delay ),
       .COUNTER_WRAPAROUND         ("STAY_AT_LIMIT"),
       .DELAY_SRC                  ("ODATAIN"),
       .SERDES_MODE                ("NONE"),
       .SIM_TAPDELAY_VALUE         (75))
   iodelay2_bus
     (
      // required datapath
      .T                      (1'b0),
      .DOUT                   (sdram_clk),
      .ODATAIN                (sdram_clk_predelay),
      // inactive data connections
      .IDATAIN                (1'b0),
      .TOUT                   (),
      .DATAOUT                (),
      .DATAOUT2               (),
      // connect up the clocks
      .IOCLK0                 (1'b0),                 // No calibration needed
      .IOCLK1                 (1'b0),                 // No calibration needed
      // Tie of the variable delay programming
      .CLK                    (1'b0),
      .CAL                    (1'b0),
      .INC                    (1'b0),
      .CE                     (1'b0),
      .BUSY                   (),
      .RST                    (1'b0));

   ODDR2
     #(.DDR_ALIGNMENT  ("C0"),
       .INIT           (1'b0),
       .SRTYPE         ("ASYNC"))
   oddr2_inst
     (.D0             (1'b0),
      .D1             (1'b1),
      .C0             (sys_clk),
      .C1             (sys_clk_n),
      .CE             (1'b1),
      .Q              (sdram_clk_predelay),
      .R              (1'b0),
      .S              (1'b0));

   
/******/
/* DQ */
/******/

wire [15:0] sdram_dq_t, sdram_dq_t_predelay;
wire [15:0] sdram_dq_out, sdram_dq_out_predelay;
wire [15:0] sdram_dq_in;
wire [15:0] sdram_dq_in_delayed;

hpdmc_iobuf16 iobuf_dq(
	.T(sdram_dq_t),
	.I(sdram_dq_out),
	.O(sdram_dq_in),
	.IO(sdram_dq)
);

hpdmc_oddr16 oddr_dq_t(
	.Q(sdram_dq_t_predelay),
	.C0(sys_clk),
	.C1(sys_clk_n),
	.CE(1'b1),
	.D0({16{direction}}),
	.D1({16{direction}}),
	.R(1'b0),
	.S(1'b0)
);

hpdmc_oddr16 oddr_dq(
	.Q(sdram_dq_out_predelay),
	.C0(sys_clk),
	.C1(sys_clk_n),
	.CE(1'b1),
	.D0(do[31:16]),
	.D1(do[15:0]),
	.R(1'b0),
	.S(1'b0)
);

   hpdmc_iodelay #(
                   .ODELAY_VALUE(data_delay),
                   .size ( 16 ) )
   dq_delay (
      
	     .IDATAIN(sdram_dq_in),
	     .DATAOUT(sdram_dq_in_delayed),
             .T (sdram_dq_t_predelay),
             .TOUT(sdram_dq_t),
             .ODATAIN(sdram_dq_out_predelay),
             .DOUT (sdram_dq_out),
	     .INC(idelay_inc),
	     .CE(idelay_ce),
	     .RST(idelay_rst),
	     .CAL(idelay_cal),
	     .CLK(sys_clk),
	     .IOCLK0(sys_clk),
	     .IOCLK1(sys_clk_n)
             );

hpdmc_iddr16 iddr_dq(
	.Q0(di[15:0]),
	.Q1(di[31:16]),
	.C0(sys_clk),
	.C1(sys_clk_n),
	.CE(1'b1),
	.D(sdram_dq_in_delayed),
	.R(1'b0),
	.S(1'b0)
);

/*******/
/* DM */
/*******/

   wire [1:0] sdram_dm_predelay;
   
   hpdmc_iodelay #(
                   .ODELAY_VALUE(data_delay),
                   .DELAY_SRC("ODATAIN"),
                   .size ( 2 ) )
   dm_delay (
             .ODATAIN(sdram_dm_predelay),
             .DOUT (sdram_dm),
             .IDATAIN(1'b0),
             .T(1'b0),
             .INC(1'b0),
	     .CE(1'b0),
	     .RST(1'b0),
	     .CAL(1'b0),
	     .CLK(sys_clk),
	     .IOCLK0(sys_clk),
	     .IOCLK1(sys_clk_n)
             );
   
     
hpdmc_oddr2 oddr_dm(
	.Q(sdram_dm_predelay),
	.C0(sys_clk),
	.C1(sys_clk_n),
	.CE(1'b1),
	.D0(mo[3:2]),
	.D1(mo[1:0]),
	.R(1'b0),
	.S(1'b0)
);

/*******/
/* DQS */
/*******/

wire [1:0] sdram_dqs_t;
wire [1:0] sdram_dqs_out;
reg [1:0] sdram_dqs_filtered;
wire [1:0] sdram_dqs_in_undelayed;
wire [1:0] sdram_dqs_in; /* TODO: use this for clocking input regs */

hpdmc_iobuf2 iobuf_dqs(
	.T(sdram_dqs_t),
	.I(sdram_dqs_out),
	.O(sdram_dqs_in_undelayed),
	.IO(sdram_dqs)
);

wire [1:0] sdram_dqs_t_undelayed;
wire [1:0] sdram_dqs_out_undelayed;

hpdmc_iodelay2 #(
         .ODELAY_VALUE(dqs_delay) )
u_dqs_delay (
	.IDATAIN(sdram_dqs_in_undelayed),
	.DATAOUT(sdram_dqs_in),

	.T(sdram_dqs_t_undelayed),
	.TOUT(sdram_dqs_t),
	.ODATAIN(sdram_dqs_out_undelayed),
	.DOUT(sdram_dqs_out),
	
	.INC(1'b0),
	.CE(1'b0),
	.RST(idelay_rst),
	.CAL(idelay_cal),
	.CLK(sys_clk),
	.IOCLK0(sys_clk),
	.IOCLK1(sys_clk_n)
);

hpdmc_oddr2 oddr_dqs_t(
	.Q(sdram_dqs_t_undelayed),
	.C0(sys_clk),
	.C1(sys_clk_n),
	.CE(1'b1),
	.D0({2{direction}}),
	.D1({2{direction}}),
	.R(1'b0),
	.S(1'b0)
);

hpdmc_oddr2 oddr_dqs(
	.Q(sdram_dqs_out_undelayed),
	.C0(sys_clk),
	.C1(sys_clk_n),
	.CE(1'b1),
	.D0(2'h3),
	.D1(2'h0),
	.R(1'b0),
	.S(1'b0)
);

endmodule
