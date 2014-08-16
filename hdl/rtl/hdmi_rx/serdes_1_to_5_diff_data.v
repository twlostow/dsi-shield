//////////////////////////////////////////////////////////////////////////////
//
//  Xilinx, Inc. 2010                 www.xilinx.com
//
//  XAPP xxx - 1:5 Differential Data De-serializer
//
//////////////////////////////////////////////////////////////////////////////
//
//  File name :       serdes_1_to_5_diff_data.v
//
//  Description :     This module instantiates IODELAY2 and ISERDES2 primitives
//                    to receive TMDS differential data in 1:5 format
//
//  Note:             
//
//  Author :    Bob Feng 
//////////////////////////////////////////////////////////////////////////////
//
//  Disclaimer: 
//
//    This disclaimer is not a license and does not grant any rights to the materials 
//    distributed herewith. Except as otherwise provided in a valid license issued to you 
//    by Xilinx, and to the maximum extent permitted by applicable law: 
//    (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, 
//    AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, 
//    INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, OR 
//    FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable (whether in contract 
//    or tort, including negligence, or under any other theory of liability) for any loss or damage 
//    of any kind or nature related to, arising under or in connection with these materials, 
//    including for any direct, or any indirect, special, incidental, or consequential loss 
//    or damage (including loss of data, profits, goodwill, or any type of loss or damage suffered 
//    as a result of any action brought by a third party) even if such damage or loss was 
//    reasonably foreseeable or Xilinx had been advised of the possibility of the same.
//
//  Critical Applications:
//
//    Xilinx products are not designed or intended to be fail-safe, or for use in any application 
//    requiring fail-safe performance, such as life-support or safety devices or systems, 
//    Class III medical devices, nuclear facilities, applications related to the deployment of airbags,
//    or any other applications that could lead to death, personal injury, or severe property or 
//    environmental damage (individually and collectively, "Critical Applications"). Customer assumes 
//    the sole risk and liability of any use of Xilinx products in Critical Applications, subject only 
//    to applicable laws and regulations governing limitations on product liability.
//
//  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT ALL TIMES.
//
//////////////////////////////////////////////////////////////////////////////

`timescale 1ps/1ps

module serdes_1_to_5_diff_data # (
  parameter DIFF_TERM = "TRUE",
  parameter SIM_TAP_DELAY = 49,
  parameter BITSLIP_ENABLE = "FALSE"
)(
  input  wire        use_phase_detector,  // '1' enables the phase detector logic
  input  wire        datain_p,            // Input from LVDS receiver pin
  input  wire        datain_n,            // Input from LVDS receiver pin
  input  wire        rxioclk,             // IO Clock network
  input  wire        rxserdesstrobe,      // Parallel data capture strobe
  input  wire        reset,               // Reset line
  input  wire        gclk,                // Global clock
  input  wire        bitslip,             // Bitslip control line
  output wire [4:0]  data_out             // Output data
);  

  wire       ddly_m;
  wire       ddly_s;
  wire       busys;
  wire       rx_data_in;
  wire       cascade;
  wire       pd_edge;
  reg  [8:0] counter;
  reg  [3:0] state;
  reg        cal_data_sint;
  wire       busy_data;
  reg        busy_data_d;
  wire       cal_data_slave;
  reg        enable;
  reg        cal_data_master;
  reg        rst_data;
  reg        inc_data_int;
  wire       inc_data;
  reg        ce_data;
  reg        valid_data_d;
  reg        incdec_data_d;
  reg  [4:0] pdcounter;
  wire       valid_data;
  wire       incdec_data;
  reg        flag;
  reg        mux;
  reg        ce_data_inta ;
  wire [1:0] incdec_data_or;
  wire       incdec_data_im;
  wire [1:0] valid_data_or;
  wire       valid_data_im;
  wire [1:0] busy_data_or;
  wire       all_ce;

  wire [1:0] debug_in = 2'b00;

  assign busy_data = busys ;

  assign cal_data_slave = cal_data_sint ;

  /////////////////////////////////////////////////
  //
  // IDELAY Calibration FSM
  //
  /////////////////////////////////////////////////
  always @ (posedge gclk or posedge reset)
  begin
  if (reset == 1'b1) begin
    state <= 0 ;
    cal_data_master <= 1'b0 ;
    cal_data_sint <= 1'b0 ;
    counter <= 9'h000 ;
    enable <= 1'b0 ;
    mux <= 1'h1 ;
  end
  else begin
      counter <= counter + 9'h001 ;
      if (counter[8] == 1'b1) begin
      counter <= 9'h000 ;
      end
      if (counter[5] == 1'b1) begin
      enable <= 1'b1 ;
      end
      if (state == 0 && enable == 1'b1) begin       // Wait for IODELAY to be available
      cal_data_master <= 1'b0 ;
      cal_data_sint <= 1'b0 ;
      rst_data <= 1'b0 ;
        if (busy_data_d == 1'b0) begin
        state <= 1 ;
      end
      end
      else if (state == 1) begin          // Issue calibrate command to both master and slave, needed for simulation, not for the silicon
        cal_data_master <= 1'b1 ;
        cal_data_sint <= 1'b1 ;
        if (busy_data_d == 1'b1) begin        // and wait for command to be accepted
          state <= 2 ;
        end
      end
      else if (state == 2) begin          // Now RST master and slave IODELAYs needed for simulation, not for the silicon
        cal_data_master <= 1'b0 ;
        cal_data_sint <= 1'b0 ;
        if (busy_data_d == 1'b0) begin
          rst_data <= 1'b1 ;
          state <= 3 ;
        end
      end
      else if (state == 3) begin          // Wait for IODELAY to be available
        rst_data <= 1'b0 ;
        if (busy_data_d == 1'b0) begin
          state <= 4 ;
        end
      end
      else if (state == 4) begin          // Wait for occasional enable
        if (counter[8] == 1'b1) begin
          state <= 5 ;
        end
        end
        else if (state == 5) begin          // Calibrate slave only
        if (busy_data_d == 1'b0) begin
          cal_data_sint <= 1'b1 ;
          state <= 6 ;
        end
      end
        else if (state == 6) begin          // Wait for command to be accepted
        cal_data_sint <= 1'b0 ;
        if (busy_data_d == 1'b1) begin
          state <= 7 ;
        end
      end
      else if (state == 7) begin          // Wait for all IODELAYs to be available, ie CAL command finished
          cal_data_sint <= 1'b0 ;
        if (busy_data_d == 1'b0) begin
          state <= 4 ;
        end
      end
  end
  end

always @ (posedge gclk or posedge reset)        // Per-bit phase detection state machine
begin
if (reset == 1'b1) begin
  pdcounter <= 5'b1000 ;
  ce_data_inta <= 1'b0 ;
  flag <= 1'b0 ;              // flag is there to only allow one inc or dec per cal (test)
end
else begin
  busy_data_d <= busy_data_or[1] ;
    if (use_phase_detector == 1'b1) begin       // decide whther pd is used
    incdec_data_d <= incdec_data_or[1] ;
    valid_data_d <= valid_data_or[1] ;
    if (ce_data_inta == 1'b1) begin
      ce_data <= mux ;
    end
    else begin
      ce_data <= 64'h0000000000000000 ;
    end
      if (state == 7) begin
      flag <= 1'b0 ;
    end
      else if (state != 4 || busy_data_d == 1'b1) begin // Reset filter if state machine issues a cal command or unit is busy
      pdcounter <= 5'b10000 ;
        ce_data_inta <= 1'b0 ;
      end
      else if (pdcounter == 5'b11111 && flag == 1'b0) begin // Filter has reached positive max - increment the tap count
        ce_data_inta <= 1'b1 ;
        inc_data_int <= 1'b1 ;
      pdcounter <= 5'b10000 ;
      flag <= 1'b1 ;
    end
        else if (pdcounter == 5'b00000 && flag == 1'b0) begin // Filter has reached negative max - decrement the tap count
        ce_data_inta <= 1'b1 ;
        inc_data_int <= 1'b0 ;
      pdcounter <= 5'b10000 ;
      flag <= 1'b1 ;
      end
    else if (valid_data_d == 1'b1) begin      // increment filter
        ce_data_inta <= 1'b0 ;
      if (incdec_data_d == 1'b1 && pdcounter != 5'b11111) begin
        pdcounter <= pdcounter + 5'b00001 ;
      end
      else if (incdec_data_d == 1'b0 && pdcounter != 5'b00000) begin  // decrement filter
        pdcounter <= pdcounter + 5'b11111 ;
      end
      end
      else begin
        ce_data_inta <= 1'b0 ;
      end
    end
    else begin
    ce_data <= all_ce ;
    inc_data_int <= debug_in[1] ;
    end
end
end

assign inc_data = inc_data_int ;

assign incdec_data_or[0] = 1'b0 ;             // Input Mux - Initialise generate loop OR gates
assign valid_data_or[0] = 1'b0 ;
assign busy_data_or[0] = 1'b0 ;

assign incdec_data_im = incdec_data & mux;          // Input muxes
assign incdec_data_or[1] = incdec_data_im | incdec_data_or;      // AND gates to allow just one signal through at a tome
assign valid_data_im = valid_data & mux;          // followed by an OR
assign valid_data_or[1] = valid_data_im | valid_data_or;     // for the three inputs from each PD
assign busy_data_or[1] = busy_data | busy_data_or;       // The busy signals just need an OR gate

assign all_ce = debug_in[0] ;

IBUFDS #(
  .DIFF_TERM    (DIFF_TERM)) 
data_in (
  .I            (datain_p),
  .IB           (datain_n),
  .O            (rx_data_in)
);

//
// Master IDELAY
//
IODELAY2 #(
  .DATA_RATE            ("SDR"),
  .IDELAY_VALUE         (0),
  .IDELAY2_VALUE        (0),
  .IDELAY_MODE          ("NORMAL" ),
  .ODELAY_VALUE         (0),
  .IDELAY_TYPE          ("DIFF_PHASE_DETECTOR"),
  .COUNTER_WRAPAROUND   ("STAY_AT_LIMIT"), //("WRAPAROUND"),
  .DELAY_SRC            ("IDATAIN"),
  .SERDES_MODE          ("MASTER"),
  .SIM_TAPDELAY_VALUE   (SIM_TAP_DELAY)
) iodelay_m (
  .IDATAIN              (rx_data_in),      // data from IBUFDS
  .TOUT                 (),                // tri-state signal to IOB
  .DOUT                 (),                // output data to IOB
  .T                    (1'b1),            // tri-state control from OLOGIC/OSERDES2
  .ODATAIN              (1'b0),            // data from OLOGIC/OSERDES2
  .DATAOUT              (ddly_m),          // Output data 1 to ILOGIC/ISERDES2
  .DATAOUT2             (),                // Output data 2 to ILOGIC/ISERDES2
  .IOCLK0               (rxioclk),         // High speed clock for calibration
  .IOCLK1               (1'b0),            // High speed clock for calibration
  .CLK                  (gclk),            // Fabric clock (GCLK) for control signals
  .CAL                  (cal_data_master), // Calibrate control signal
  .INC                  (inc_data),        // Increment counter
  .CE                   (ce_data),         // Clock Enable
  .RST                  (rst_data),        // Reset delay line
  .BUSY                 ()                 // output signal indicating sync circuit has finished / calibration has finished
);

//
// Slave IDELAY
//
IODELAY2 #(
  .DATA_RATE            ("SDR"),
  .IDELAY_VALUE         (0),
  .IDELAY2_VALUE        (0),
  .IDELAY_MODE          ("NORMAL" ),
  .ODELAY_VALUE         (0),
  .IDELAY_TYPE          ("DIFF_PHASE_DETECTOR"),
  .COUNTER_WRAPAROUND   ("WRAPAROUND"),
  .DELAY_SRC            ("IDATAIN"),
  .SERDES_MODE          ("SLAVE"),
  .SIM_TAPDELAY_VALUE   (SIM_TAP_DELAY)
) iodelay_s (
  .IDATAIN              (rx_data_in),  // data from IBUFDS
  .TOUT                 (),            // tri-state signal to IOB
  .DOUT                 (),            // output data to IOB
  .T                    (1'b1),        // tri-state control from OLOGIC/OSERDES2
  .ODATAIN              (1'b0),        // data from OLOGIC/OSERDES2
  .DATAOUT              (ddly_s),      // Slave output data to ILOGIC/ISERDES2
  .DATAOUT2             (),            //
  .IOCLK0               (rxioclk),     // High speed IO clock for calibration
  .IOCLK1               (1'b0),
  .CLK                  (gclk),        // Fabric clock (GCLK) for control signals
  .CAL                  (cal_data_slave), // Calibrate control signal
  .INC                  (inc_data),       // Increment counter
  .CE                   (ce_data),        // Clock Enable
  .RST                  (rst_data),       // Reset delay line
  .BUSY                 (busys)        // output signal indicating sync circuit has finished / calibration has finished
);

//
// Master ISERDES
//

ISERDES2 #(
  .DATA_WIDTH       (5),
  .DATA_RATE        ("SDR"),
  .BITSLIP_ENABLE   (BITSLIP_ENABLE),
  .SERDES_MODE      ("MASTER"),
  .INTERFACE_TYPE   ("RETIMED"))
iserdes_m (
  .D                (ddly_m),
  .CE0              (1'b1),
  .CLK0             (rxioclk),
  .CLK1             (1'b0),
  .IOCE             (rxserdesstrobe),
  .RST              (reset),
  .CLKDIV           (gclk),
  .SHIFTIN          (pd_edge),
  .BITSLIP          (bitslip),
  .FABRICOUT        (),
  .Q4               (data_out[4]),
  .Q3               (data_out[3]),
  .Q2               (data_out[2]),
  .Q1               (data_out[1]),
  .DFB              (),
  .CFB0             (),
  .CFB1             (),
  .VALID            (valid_data),
  .INCDEC           (incdec_data),
  .SHIFTOUT         (cascade));

//
// Slave ISERDES
//

ISERDES2 #(
  .DATA_WIDTH       (5),
  .DATA_RATE        ("SDR"),
  .BITSLIP_ENABLE   (BITSLIP_ENABLE),
  .SERDES_MODE      ("SLAVE"),
  .INTERFACE_TYPE   ("RETIMED")
) iserdes_s (
  .D                (ddly_s),
  .CE0              (1'b1),
  .CLK0             (rxioclk),
  .CLK1             (1'b0),
  .IOCE             (rxserdesstrobe),
  .RST              (reset),
  .CLKDIV           (gclk),
  .SHIFTIN          (cascade),
  .BITSLIP          (bitslip),
  .FABRICOUT        (),
  .Q4               (data_out[0]),
  .Q3               (),
  .Q2               (),
  .Q1               (),
  .DFB              (),
  .CFB0             (),
  .CFB1             (),
  .VALID            (),
  .INCDEC           (),
  .SHIFTOUT         (pd_edge));


reg [7:0] rxpdcntr = 8'h7f;
always @ (posedge gclk or posedge reset) begin
  if (reset)
    rxpdcntr <= 8'h7f;
  else if (ce_data)
    if (inc_data)
      rxpdcntr <= rxpdcntr + 1'b1;
    else
      rxpdcntr <= rxpdcntr - 1'b1;
end

endmodule
