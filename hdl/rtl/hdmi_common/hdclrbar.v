//------------------------------------------------------------------------------ 
// Copyright (c) 2007 Xilinx, Inc. 
// All Rights Reserved 
//------------------------------------------------------------------------------ 
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /   Vendor: Xilinx 
// \   \   \/    Author: Bob Feng, General Product Division, Xilinx, Inc.
//  \   \        Filename: $RCSfile: hdclrbar.v,v $
//  /   /        Date Last Modified:  $Date: 2010/08/25 00:37:39 $
// /___/   /\    Date Created: July 26, 2007
// \   \  /  \ 
//  \___\/\___\ 
// 
//------------------------------------------------------------------------------ 
/*
This video pattern generator will generate color bars for the 18 video standards
currently supported by the SMPTE 292M (HD-SDI) video standard. The color bars 
comply with SMPTE RP-219 standard color bars, as shown below. This module can
also generate the SMPTE RP-198 HD-SDI checkfield test pattern and 75% color
bars.

|<-------------------------------------- a ------------------------------------->|
|                                                                                |
|        |<----------------------------(3/4)a-------------------------->|        |
|        |                                                              |        |
|   d    |    c        c        c        c        c        c        c   |   d    |
+--------+--------+--------+--------+--------+--------+--------+--------+--------+ - - - - -
|        |        |        |        |        |        |        |        |        |   ^     ^
|        |        |        |        |        |        |        |        |        |   |     |
|        |        |        |        |        |        |        |        |        |   |     |
|        |        |        |        |        |        |        |        |        |   |     |
|        |        |        |        |        |        |        |        |        | (7/12)b |
|  40%   |  75%   | YELLOW |  CYAN  |  GREEN | MAGENTA|   RED  |  BLUE  |  40%   |   |     |
|  GRAY  | WHITE  |        |        |        |        |        |        |  GRAY  |   |     |
|   *1   |        |        |        |        |        |        |        |   *1   |   |     b
|        |        |        |        |        |        |        |        |        |   |     |
|        |        |        |        |        |        |        |        |        |   |     |
|        |        |        |        |        |        |        |        |        |   v     |
+--------+--------+--------+--------+--------+--------+--------+--------+--------+ - - -   |
|100%CYAN|  *2    |                   75% WHITE                         |100%BLUE| (1/12)b |
+--------+--------+-----------------------------------------------------+--------+ - - -   |
|100%YELO|  *3    |                    Y-RAMP                           |100% RED| (1/12)b |
+--------+--------+---+-----------------+-------+--+--+--+--+--+--------+--------+ - - -   |
|        |            |                 |       |  |  |  |  |  |        |        |         |
|  15%   |     0%     |       100%      |  0%   |BL|BL|BL|BL|BL|    0%  |  15%   | (3/12)b |
|  GRAY  |    BLACK   |      WHITE      | BLACK |K-|K |K+|K |K+|  BLACK |  GRAY  |         |
|   *4   |            |                 |       |2%|0%|2%|0%|4%|        |   *4   |         v
+--------+------------+-----------------+-------+--+--+--+--+--+--------+--------+ - - - - -
    d        (3/2)c            2c        (5/6)c  c  c  c  c  c      c       d
                                                 -  -  -  -  -
                                                 3  3  3  3  3

*1: The block marked *1 is 40% Gray for a default value. This value may 
optionally be set to any other value in accordance with the operational 
requirements of the user.    
    
*2: In the block marked *2, the user may select 75% White, 100% White, +I, or
-I.

*3: In the block marked *3, the user may select either 0% Black, or +Q. When the
-I value is selected for the block marked *2, then the +Q signal must be
selected for the *3 block.

*4: The block marked *4 is 15% Gray for a default value. This value may
optionally be set to any other value in accordance with the operational
requirements of the user.

 

*/
module hdcolorbar(
  input            i_clk_74M, //74.25 MHZ pixel clock
  input            i_rst,   
  input            baronly, //output only 75% color bar 
  input [1:0]      i_format,
  input [11:0]     i_vcnt, //vertical counter from video timing generator
  input [11:0]     i_hcnt, //horizontal counter from video timing generator

  output reg[7:0]  o_r,
  output reg[7:0]  o_g,
  output reg[7:0]  o_b
);

parameter  Lvl_100   = 8'd255;
parameter  Lvl_75    = 8'd191;
parameter  Lvl_40    = 8'd102;
parameter  Lvl_15    = 8'd38;
parameter  Lvl_4     = 8'd10;
parameter  Lvl_2     = 8'd5;
parameter  Lvl_0     = 8'd0;
parameter  Lvl_2n    = 8'd5;
parameter  I_R       = 8'd0; // -I signal
parameter  Q_R       = 8'd65;// +Q signal
parameter  I_G       = 8'd63;
parameter  Q_G       = 8'd0; 
parameter  I_B       = 8'd105;
parameter  Q_B       = 8'd120;

reg [1:0] i_format_sync, i_format_q;
always @ (posedge i_clk_74M) begin
  i_format_sync <= i_format_q;
  i_format_q <= i_format;
end

wire interlace = i_format_sync[1]; //0-progressive 1-interlace
wire hdtype = i_format_sync[0]; //0-720 1-1080

///////////////////////////////////////////////////////////
// There are total 4 vertical and 17 horizontal regions
///////////////////////////////////////////////////////////

reg [16:0] Hregion;
reg [3:0]  Vregion;

parameter VRGN1 = 4'd0;
parameter VRGN2 = 4'd1;
parameter VRGN3 = 4'd2;
parameter VRGN4 = 4'd3;

parameter HRGN1   = 17'd0;
parameter HRGN2   = 17'd1;
parameter HRGN3   = 17'd2;
parameter HRGN4   = 17'd3;
parameter HRGN5   = 17'd4;
parameter HRGN6   = 17'd5;
parameter HRGN7   = 17'd6;
parameter HRGN8   = 17'd7;
parameter HRGN9   = 17'd8;
parameter HRGN10  = 17'd9;
parameter HRGN11  = 17'd10;
parameter HRGN12  = 17'd11;
parameter HRGN13  = 17'd12;
parameter HRGN14  = 17'd13;
parameter HRGN15  = 17'd14;
parameter HRGN16  = 17'd15;
parameter HRGN17  = 17'd16;

///////////////////////////////////////////////////////////
// Define Vertical and Horizontal regions
///////////////////////////////////////////////////////////
wire [11:0] vbar1bgn, vbar1bgn2;
wire [11:0] vbar2bgn, vbar2bgn2;
wire [11:0] vbar3bgn, vbar3bgn2;
wire [11:0] vbar4bgn, vbar4bgn2;

wire [11:0] hbar1bgn;
wire [11:0] hbar2bgn;
wire [11:0] hbar3bgn;
wire [11:0] hbar4bgn;
wire [11:0] hbar5bgn;
wire [11:0] hbar6bgn;
wire [11:0] hbar7bgn;
wire [11:0] hbar8bgn;
wire [11:0] hbar9bgn;
wire [11:0] hbar10bgn;
wire [11:0] hbar11bgn;
wire [11:0] hbar12bgn;
wire [11:0] hbar13bgn;
wire [11:0] hbar14bgn;
wire [11:0] hbar15bgn;
wire [11:0] hbar16bgn;
wire [11:0] hbar17bgn;

/****************************************************************************************************
  1080i Vertical Timing:

|<-- 540 Active Lines --->|<-- 23 vblnks --->|<-- 540 Active Lines --->|<-- 22 vblnks -->|
|_________......__________|                  |_________......__________|                 |__......
|                         |                  |                         |                 |
|                         |______......______|                         |______......_____|
^                        ^                  ^                         ^                 ^
0                       539                562                       1102              1124

VSYNC:
                              _____                                        _____
                             |     |                                      |     |
_____________________________|     |______________________________________|     |___________

****************************************************************************************************/

///////////////////////////////////////////////////////////////////
// Here we try to determine vertical ranges
///////////////////////////////////////////////////////////////////
assign vbar1bgn = 12'd0;
assign vbar2bgn = (hdtype) ? ((interlace) ? 12'd315 : 12'd630) : 12'd420;
assign vbar3bgn = (hdtype) ? ((interlace) ? 12'd360 : 12'd720) : 12'd480;
assign vbar4bgn = (hdtype) ? ((interlace) ? 12'd405 : 12'd810) : 12'd540;

//This is used only for interlaced second frame
assign vbar1bgn2 = 12'd563;
assign vbar2bgn2 = 12'd878;
assign vbar3bgn2 = 12'd923;
assign vbar4bgn2 = 12'd968;

///////////////////////////////////////////////////////////////////
// Here we try to determine horizontal ranges
///////////////////////////////////////////////////////////////////
assign hbar1bgn  = 12'd0;
assign hbar2bgn  = (hdtype) ? 12'd 240  : 12'd160;
assign hbar3bgn  = (hdtype) ? 12'd 445  : 12'd297;
assign hbar4bgn  = (hdtype) ? 12'd 651  : 12'd434;
assign hbar5bgn  = (hdtype) ? 12'd 857  : 12'd571;
assign hbar6bgn  = (hdtype) ? 12'd 1063 : 12'd709;
assign hbar7bgn  = (hdtype) ? 12'd 1269 : 12'd846;
assign hbar8bgn  = (hdtype) ? 12'd 1475 : 12'd983;
assign hbar9bgn  = (hdtype) ? 12'd 1680 : 12'd1120;
assign hbar10bgn = (hdtype) ? 12'd 240  : 12'd160;
assign hbar11bgn = (hdtype) ? 12'd 549  : 12'd366;
assign hbar12bgn = (hdtype) ? 12'd 960  : 12'd640;
assign hbar13bgn = (hdtype) ? 12'd 1131 : 12'd754;
assign hbar14bgn = (hdtype) ? 12'd 1200 : 12'd800;
assign hbar15bgn = (hdtype) ? 12'd 1268 : 12'd845;
assign hbar16bgn = (hdtype) ? 12'd 1337 : 12'd891;
assign hbar17bgn = (hdtype) ? 12'd 1405 : 12'd937;

always @ (posedge i_clk_74M)
begin
  if (i_rst) begin
    Vregion <= 4'h0;
  end else begin
    if (baronly)
      Vregion <= VRGN1;
    else if(interlace)
      if (((i_vcnt >= vbar1bgn) && (i_vcnt < vbar2bgn)) ||
          ((i_vcnt >= vbar1bgn2) && (i_vcnt < vbar2bgn2)))
        Vregion <= VRGN1;
      else if (((i_vcnt >= vbar2bgn) && (i_vcnt < vbar3bgn)) ||
               ((i_vcnt >= vbar2bgn2) && (i_vcnt < vbar3bgn2)))
        Vregion <= VRGN2;
      else if (((i_vcnt >= vbar3bgn) && (i_vcnt < vbar4bgn)) ||
               ((i_vcnt >= vbar3bgn2) && (i_vcnt < vbar4bgn2)))
        Vregion <= VRGN3;
      else
        Vregion <= VRGN4;
    else
      if ((i_vcnt >= vbar1bgn) && (i_vcnt < vbar2bgn))
        Vregion <= VRGN1;
      else if ((i_vcnt >= vbar2bgn) && (i_vcnt < vbar3bgn))
        Vregion <= VRGN2;
      else if ((i_vcnt >= vbar3bgn) && (i_vcnt < vbar4bgn))
        Vregion <= VRGN3;
      else
        Vregion <= VRGN4;
  end
end

always @ (posedge i_clk_74M)
begin
  if(i_rst) begin
    Hregion <= 17'h0;
  end else
    case (Vregion)
      VRGN4: begin
        if((i_hcnt >= hbar1bgn) && (i_hcnt < hbar10bgn))
          Hregion <= HRGN1; 
        else if((i_hcnt >= hbar10bgn) && (i_hcnt < hbar11bgn))
          Hregion <= HRGN10; 
        else if((i_hcnt >= hbar11bgn) && (i_hcnt < hbar12bgn))
          Hregion <= HRGN11; 
        else if((i_hcnt >= hbar12bgn) && (i_hcnt < hbar13bgn))
          Hregion <= HRGN12; 
        else if((i_hcnt >= hbar13bgn) && (i_hcnt < hbar14bgn))
          Hregion <= HRGN13; 
        else if((i_hcnt >= hbar14bgn) && (i_hcnt < hbar15bgn))
          Hregion <= HRGN14; 
        else if((i_hcnt >= hbar15bgn) && (i_hcnt < hbar16bgn))
          Hregion <= HRGN15; 
        else if((i_hcnt >= hbar16bgn) && (i_hcnt < hbar17bgn))
          Hregion <= HRGN16; 
        else if((i_hcnt >= hbar17bgn) && (i_hcnt < hbar8bgn))
          Hregion <= HRGN17; 
        else if((i_hcnt >= hbar8bgn) && (i_hcnt < hbar9bgn))
          Hregion <= HRGN8; 
        else
          Hregion <= HRGN9; 
      end
      default: begin
        if((i_hcnt >= hbar1bgn) && (i_hcnt < hbar2bgn))
          Hregion <= HRGN1; 
        else if((i_hcnt >= hbar2bgn) && (i_hcnt < hbar3bgn))
          Hregion <= HRGN2; 
        else if((i_hcnt >= hbar3bgn) && (i_hcnt < hbar4bgn))
          Hregion <= HRGN3; 
        else if((i_hcnt >= hbar4bgn) && (i_hcnt < hbar5bgn))
          Hregion <= HRGN4; 
        else if((i_hcnt >= hbar5bgn) && (i_hcnt < hbar6bgn))
          Hregion <= HRGN5; 
        else if((i_hcnt >= hbar6bgn) && (i_hcnt < hbar7bgn))
          Hregion <= HRGN6; 
        else if((i_hcnt >= hbar7bgn) && (i_hcnt < hbar8bgn))
          Hregion <= HRGN7; 
        else if((i_hcnt >= hbar8bgn) && (i_hcnt < hbar9bgn))
          Hregion <= HRGN8; 
        else
          Hregion <= HRGN9; 
      end
    endcase
end

always @ (posedge i_clk_74M)
begin
  if(i_rst) begin
    o_r <= Lvl_0;
    o_g <= Lvl_0;
    o_b <= Lvl_0;
  end else
    case (Vregion)
      VRGN1: begin
        case (Hregion)
          HRGN1: begin
            o_r <= Lvl_40;
            o_g <= Lvl_40;
            o_b <= Lvl_40;
          end
          HRGN2: begin 
            o_r <= Lvl_75;
            o_g <= Lvl_75;
            o_b <= Lvl_75; 
          end
          HRGN3: begin 
            o_r <= Lvl_75;
            o_g <= Lvl_75;
            o_b <= Lvl_0;  
          end
          HRGN4: begin 
            o_r <= Lvl_0 ;
            o_g <= Lvl_75;
            o_b <= Lvl_75; 
          end
          HRGN5: begin 
            o_r <= Lvl_0 ;
            o_g <= Lvl_75;
            o_b <= Lvl_0;
          end
          HRGN6: begin 
            o_r <= Lvl_75;
            o_g <= Lvl_0;
            o_b <= Lvl_75;
          end
          HRGN7: begin 
            o_r <= Lvl_75;
            o_g <= Lvl_0;
            o_b <= Lvl_0;
          end
          HRGN8: begin 
            o_r <= Lvl_0;
            o_g <= Lvl_0;
            o_b <= Lvl_75;
          end
          HRGN9: begin 
            o_r <= Lvl_40;
            o_g <= Lvl_40;
            o_b <= Lvl_40;
          end
          default: begin
            o_r <= Lvl_0;
            o_g <= Lvl_0;
            o_b <= Lvl_0;
          end
        endcase
      end

      VRGN2: begin
        case (Hregion)
          HRGN1: begin //100% Cyan
            o_r <= Lvl_0;
            o_g <= Lvl_100;
            o_b <= Lvl_100;
          end
          HRGN2: begin //I
            o_r <= I_R;
            o_g <= I_G;
            o_b <= I_B;
          end
          HRGN3, HRGN4, HRGN5, HRGN6, HRGN7, HRGN8: begin //75% White
            o_r <= Lvl_75;
            o_g <= Lvl_75;
            o_b <= Lvl_75;
          end
          HRGN9: begin //100% Blue 
            o_r <= Lvl_0;
            o_g <= Lvl_0;
            o_b <= Lvl_100;
          end
          default: begin
            o_r <= Lvl_0;
            o_g <= Lvl_0;
            o_b <= Lvl_0;
          end
        endcase
      end

      VRGN3: begin
        case (Hregion)
          HRGN1: begin //100% Yellow
            o_r <= Lvl_100;
            o_g <= Lvl_100;
            o_b <= Lvl_0;
          end
          HRGN2: begin //Q
            o_r <= Q_R;
            o_g <= Q_G;
            o_b <= Q_B;
          end
          HRGN3, HRGN4, HRGN5: begin
            o_r <= Lvl_0;
            o_g <= Lvl_0;
            o_b <= Lvl_0;
          end
          HRGN6, HRGN7, HRGN8: begin //white ramp 
            o_r <= (o_r == Lvl_100) ? Lvl_100 : o_r + 8'h1;
            o_g <= (o_g == Lvl_100) ? Lvl_100 : o_g + 8'h1;
            o_b <= (o_b == Lvl_100) ? Lvl_100 : o_b + 8'h1;
          end
          HRGN9: begin //100% RED 
            o_r <= Lvl_100;
            o_g <= Lvl_0;
            o_b <= Lvl_0;
          end
          default: begin
            o_r <= Lvl_0;
            o_g <= Lvl_0;
            o_b <= Lvl_0;
          end
        endcase
      end

      VRGN4: begin
        case (Hregion)
          HRGN1: begin 
            o_r <= Lvl_15;
            o_g <= Lvl_15;
            o_b <= Lvl_15;
          end
          HRGN10: begin 
            o_r <= Lvl_0;
            o_g <= Lvl_0;
            o_b <= Lvl_0;
          end
          HRGN11: begin 
            o_r <= Lvl_100;
            o_g <= Lvl_100;
            o_b <= Lvl_100;
          end
          HRGN12: begin 
            o_r <= Lvl_0;
            o_g <= Lvl_0;
            o_b <= Lvl_0;
          end
          HRGN13: begin 
            o_r <= Lvl_2n;
            o_g <= Lvl_2n;
            o_b <= Lvl_2n;
          end
          HRGN14: begin 
            o_r <= Lvl_0;
            o_g <= Lvl_0;
            o_b <= Lvl_0;
          end
          HRGN15: begin 
            o_r <= Lvl_2;
            o_g <= Lvl_2;
            o_b <= Lvl_2;
          end
          HRGN16: begin 
            o_r <= Lvl_0;
            o_g <= Lvl_0;
            o_b <= Lvl_0;
          end
          HRGN17: begin 
            o_r <= Lvl_4;
            o_g <= Lvl_4;
            o_b <= Lvl_4;
          end
          HRGN8: begin 
            o_r <= Lvl_0;
            o_g <= Lvl_0;
            o_b <= Lvl_0;
          end
          HRGN9: begin 
            o_r <= Lvl_15;
            o_g <= Lvl_15;
            o_b <= Lvl_15;
          end
          default: begin
            o_r <= Lvl_0;
            o_g <= Lvl_0;
            o_b <= Lvl_0;
          end
        endcase
      end

      default: begin
        o_r <= Lvl_0;
        o_g <= Lvl_0;
        o_b <= Lvl_0;
      end
    endcase
end

endmodule
