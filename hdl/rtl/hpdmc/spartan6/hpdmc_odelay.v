`timescale 1ns/1ps

module hpdmc_ofd
  #(parameter g_width = 1,
    parameter g_delay = 0)
   (
    input 		 rst_i,
    
    input 		 clk_p_i,
    input 		 clk_n_i,
    
    input [g_width-1:0]  in_i,
    output [g_width-1:0] out_o 
);

   genvar 	      i;
   wire [g_width-1:0] predelay;
   
   
   generate
      for(i=0; i<g_width; i=i+1) begin

	 ODDR2
	    #(.DDR_ALIGNMENT  ("C0"),
	      .INIT           (1'b0),
	      .SRTYPE         ("ASYNC"))
	 oddr2_inst
	    (.D0             (in_i[i]),
	     .D1             (in_i[i]),
	     .C0             (clk_p_i),
	     .C1             (clk_n_i),
	     .CE             (1'b1),
	     .Q              (predelay[i]),
	     .R              (1'b0),
	     .S              (1'b0));
	 
	 IODELAY2
	    #(.DATA_RATE                  ("DDR"),
	      .ODELAY_VALUE               ( g_delay ),
	      .COUNTER_WRAPAROUND         ("STAY_AT_LIMIT"),
	      .DELAY_SRC                  ("ODATAIN"),
	      .SERDES_MODE                ("NONE"),
	      .SIM_TAPDELAY_VALUE         (75))
	 iodelay2_bus
	    (
	     // required datapath
	     .T                      (1'b0),
	     .DOUT                   (out_o[i]),
	     .ODATAIN                (predelay[i]),
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
	     .RST                    (rst_i));
      end // for (i=0; i<g_width; i=i+1)
   endgenerate
   
   
endmodule // hpdmc_odelay

