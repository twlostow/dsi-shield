/////////////////////////////////////////////////////
// DCM SPI Controller
/////////////////////////////////////////////////////
`timescale 1ns / 1ps

module dcmspi (
    input  RST,                //Synchronous Reset
    input  PROGCLK,            //SPI clock
    input  PROGDONE,           //DCM is ready to take next command
    input  DFSLCKD,
    input  [7:0] M,            //DCM M value
    input  [7:0] D,            //DCM D value
    input  GO,                 //Go programme the M and D value into DCM(1 cycle pulse)
    output reg BUSY,
    output reg PROGEN,         //SlaveSelect,
    output reg PROGDATA        //CommandData
);

parameter TCQ = 1;

wire [9:0] mval = {M, 1'b1, 1'b1}; //M command: 11,M0-M7
wire [9:0] dval = {D, 1'b0, 1'b1}; //D command: 10,D0-D7

reg dfslckd_q;
reg dfslckd_rising;
always @ (posedge PROGCLK)
begin
  dfslckd_q <=#TCQ DFSLCKD;
  dfslckd_rising <=#TCQ !dfslckd_q & DFSLCKD;
end

always @ (posedge PROGCLK)
begin
  if(RST || (PROGDONE & dfslckd_rising))
    BUSY <=#TCQ 1'b0;
  else if (GO)
    BUSY <=#TCQ 1'b1;
end

reg [9:0] sndval;
reg sndm = 1'b0;
reg sndd = 1'b0;

wire ddone;
SRL16E VCNT (
  .Q(ddone), // SRL data output
  .A0(1'b1), // Select[0] input
  .A1(1'b0), // Select[1] input
  .A2(1'b0), // Select[2] input
  .A3(1'b1), // Select[3] input
  .CE(1'b1), //clock enable
  .CLK(PROGCLK), // Clock input
  .D(GO) // SRL data input
);
// The following defparam declaration 
defparam VCNT.INIT = 16'h0;

always @ (posedge PROGCLK)
begin
  if(RST || ddone)
    sndd <=#TCQ 1'b0;
  else if(GO)
    sndd <=#TCQ 1'b1;
end

//V has been sent now it is M's turn
wire ldm;
SRL16E DMGAP (
  .Q(ldm), // SRL data output
  .A0(1'b0), // Select[0] input
  .A1(1'b0), // Select[1] input
  .A2(1'b1), // Select[2] input
  .A3(1'b0), // Select[3] input
  .CE(1'b1), //clock enable
  .CLK(PROGCLK), // Clock input
  .D(ddone) // SRL data input
);
// The following defparam declaration 
defparam DMGAP.INIT = 16'h0;

wire mdone;
SRL16E MCNT (
  .Q(mdone), // SRL data output
  .A0(1'b1), // Select[0] input
  .A1(1'b0), // Select[1] input
  .A2(1'b0), // Select[2] input
  .A3(1'b1), // Select[3] input
  .CE(1'b1), //clock enable
  .CLK(PROGCLK), // Clock input
  .D(ldm) // SRL data input
);
// The following defparam declaration 
defparam MCNT.INIT = 16'h0;

always @ (posedge PROGCLK)
begin
  if(RST || mdone)
    sndm <=#TCQ 1'b0;
  else if(ldm)
    sndm <=#TCQ 1'b1;
end

wire gocmd;
SRL16E GOGAP (
  .Q(gocmd), // SRL data output
  .A0(1'b0), // Select[0] input
  .A1(1'b0), // Select[1] input
  .A2(1'b1), // Select[2] input
  .A3(1'b0), // Select[3] input
  .CE(1'b1), //clock enable
  .CLK(PROGCLK), // Clock input
  .D(mdone) // SRL data input
);
// The following defparam declaration 
defparam GOGAP.INIT = 16'h0;

always @ (posedge PROGCLK)
begin
  if(RST)
    sndval <=#TCQ 10'h0;
  else if(GO) //send D first
    sndval <=#TCQ dval;
  else if(ldm)
    sndval <=#TCQ mval;
  else if(sndm || sndd)
    sndval <=#TCQ sndval >> 1;
end

always @ (posedge PROGCLK)
begin
  PROGEN <=#TCQ sndd | sndm | gocmd;
end

always @ (posedge PROGCLK)
begin
  if(sndm || sndd)
    PROGDATA <=#TCQ sndval[0];
  else
    PROGDATA <=#TCQ 1'b0;
end

endmodule
