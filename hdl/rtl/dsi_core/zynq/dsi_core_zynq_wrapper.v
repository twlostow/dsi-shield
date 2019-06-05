`timescale 1ns/1ps

module dsi_core_zynq_wrapper (
   // 100 MHz PLL input clock
   clk_pll_i,
   clk_pll_o,
   clk_pll_rstn_i,
   // DSI high speed output
   dsi_hs_p_o,
   dsi_hs_n_o,

   // DSI low power output
   dsi_lp_p_o,
   dsi_lp_n_o,

   // DSI clock lane output
   dsi_clk_p_o,
   dsi_clk_n_o,

   // DSI clock lane LP signals + output enable
   dsi_clk_lp_p_o,
   dsi_clk_lp_n_o,

   // Displat Reset pin
   dsi_reset_n_o,

   // Display Avdd power enable pin/user-defined GPIO
   dsi_gpio_o,

   // axi4 lite slave (control registers)
   s_axil_ACLK,
   s_axil_ARESETN,
   s_axil_ARVALID,
   s_axil_AWVALID,
   s_axil_BREADY,
   s_axil_RREADY,
   s_axil_WVALID,
   s_axil_ARADDR,
   s_axil_AWADDR,
   s_axil_WDATA,
   s_axil_WSTRB,
   s_axil_ARREADY,
   s_axil_AWREADY,
   s_axil_BVALID,
   s_axil_RVALID, 
   s_axil_WREADY,
   s_axil_BRESP,
   s_axil_RRESP,
   s_axil_RDATA,

   // axi4 stream slave (video data)
   s_axis_aclk,
   s_axis_aresetn,
   s_axis_tdata,
   s_axis_tdest,
   s_axis_tid,
   s_axis_tkeep,
   s_axis_tlast,
   s_axis_tready,
   s_axis_tstrb,
   s_axis_tuser,
			      s_axis_tvalid
			      );
			      
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.clk_pll_o CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME CLK.clk_pll_o, FREQ_HZ 50000000, PHASE 0.000 " *) output clk_pll_o;
input clk_pll_rstn_i;

   parameter g_pixels_per_clock = 1;
   parameter g_lanes = 4;
   parameter g_fifo_size = 1024;
   parameter g_clock_period_ps = 3600;
   parameter g_ps_per_delay_tap = 50;
   parameter g_data_delay = (g_clock_period_ps / 2) / g_ps_per_delay_tap;
   

   input 			    clk_pll_i;
 //  output 			    clk_pll_o;
   output [g_lanes-1:0] 	    dsi_lp_p_o, dsi_lp_n_o;
   output [g_lanes-1:0] 	    dsi_hs_p_o, dsi_hs_n_o;
   output 			    dsi_clk_p_o, dsi_clk_n_o;
   
   output 			    dsi_clk_lp_p_o, dsi_clk_lp_n_o;

   
   wire 			    dsi_clk_lp_oe;
   wire [g_lanes-1:0] 		    dsi_lp_oe;
   
   output 			    dsi_reset_n_o;
   output [2:0] 		    dsi_gpio_o;

   
   input 			    s_axil_ACLK;
   input 			    s_axil_ARESETN;
   input 			    s_axil_ARVALID;
   input 			    s_axil_AWVALID;
   input 			    s_axil_BREADY;
   input 			    s_axil_RREADY;
   input 			    s_axil_WVALID;
   input [31:0] 		    s_axil_ARADDR;
   input [31:0] 		    s_axil_AWADDR;
   input [31:0] 		    s_axil_WDATA;
   input [3:0] 			    s_axil_WSTRB;
   output 			    s_axil_ARREADY;
   output 			    s_axil_AWREADY;
   output 			    s_axil_BVALID;
   output 			    s_axil_RVALID; 
   output 			    s_axil_WREADY;
   output [1:0] 		    s_axil_BRESP;
   output [1:0] 		    s_axil_RRESP;
   output [31:0] 		    s_axil_RDATA;
   
   input 			    s_axis_aclk;
   input 			    s_axis_aresetn;
   input [31:0] 		    s_axis_tdata; // fixme: generic
   input 			    s_axis_tdest;
   input 			    s_axis_tid;
   input 			    s_axis_tkeep;
   input 			    s_axis_tlast;
   output 			    s_axis_tready;
   input 			    s_axis_tstrb;
   input 			    s_axis_tuser;
   input 			    s_axis_tvalid;

   
    

   wire clk_serdes, clk_word, clk_word_prebuf;
   wire rst_n = s_axil_ARESETN;
   wire [(g_lanes+1)*8-1:0] 	  serdes_data;
   wire [g_lanes:0] 	  serdes_oe_lane;
   wire [g_lanes-1:0] 	    dsi_lp_p, dsi_lp_n;
   wire 			    dsi_clk_lp_p, dsi_clk_lp_n;


      
dsi_core 
  #(
   .g_pixels_per_clock (g_pixels_per_clock),
   .g_lanes(g_lanes),
   .g_fifo_size(g_fifo_size),
   .g_pixel_interface_type("AXI4"),
   .g_control_interface_type("AXI4"),
   .g_clock_period_ps(g_clock_period_ps),
   .g_ps_per_delay_tap(g_ps_per_delay_tap)
  )
U_WrappedCore
  (
   .clk_dsi_i(clk_word),

   // Shifted version of DSI/PHY clocks (for clock-data lane alignment)
  
   .pll_locked_i(pll_locked),
  
   // DSI high speed output (to serdes)
   .serdes_data_o(serdes_data),
   .serdes_oe_o(serdes_oe_lane),
   
   // DSI low power output
   .dsi_lp_p_o(dsi_lp_p),
   .dsi_lp_n_o(dsi_lp_n),

   // Low power output enable
   .dsi_lp_oe_o(dsi_lp_oe),

   // DSI clock lane LP signals + output enable
   .dsi_clk_lp_p_o(dsi_clk_lp_p),
   .dsi_clk_lp_n_o(dsi_clk_lp_n),
   .dsi_clk_lp_oe_o(dsi_clk_lp_oe),

   // Displat Reset pin
   .dsi_reset_n_o(dsi_reset_n_o),

   // Display Avdd power enable pin/user-defined GPIO
   .dsi_gpio_o(),

   // axi4 lite slave (control registers)
   .s_axil_ACLK      (s_axil_ACLK),	  
   .s_axil_ARESETN   (s_axil_ARESETN),
   .s_axil_ARVALID   (s_axil_ARVALID),
   .s_axil_AWVALID   (s_axil_AWVALID),
   .s_axil_BREADY    (s_axil_BREADY), 
   .s_axil_RREADY    (s_axil_RREADY), 
   .s_axil_WVALID    (s_axil_WVALID), 
   .s_axil_ARADDR    (s_axil_ARADDR), 
   .s_axil_AWADDR    (s_axil_AWADDR), 
   .s_axil_WDATA     (s_axil_WDATA),  
   .s_axil_WSTRB     (s_axil_WSTRB),  
   .s_axil_ARREADY   (s_axil_ARREADY),
   .s_axil_AWREADY   (s_axil_AWREADY),
   .s_axil_BVALID    (s_axil_BVALID), 
   .s_axil_RVALID    (s_axil_RVALID), 
   .s_axil_WREADY    (s_axil_WREADY), 
   .s_axil_BRESP     (s_axil_BRESP),  
   .s_axil_RRESP     (s_axil_RRESP),  
   .s_axil_RDATA     (s_axil_RDATA),  

   // axi4 stream slave (video data)
   .s_axis_aclk     (s_axis_aclk),   	  
   .s_axis_aresetn  (s_axis_aresetn),
   .s_axis_tdata    (s_axis_tdata),  
   .s_axis_tdest    (s_axis_tdest),  
   .s_axis_tid	    (s_axis_tid),	   
   .s_axis_tkeep    (s_axis_tkeep),  
   .s_axis_tlast    (s_axis_tlast),  
   .s_axis_tready   (s_axis_tready), 
   .s_axis_tstrb    (s_axis_tstrb),  
   .s_axis_tuser    (s_axis_tuser),  
   .s_axis_tvalid   (s_axis_tvalid)
   );
    assign clk_pll_o=clk_word_prebuf;
   wire 		  clk_fb_pll;
   
   PLLE2_ADV
     #(
       .BANDWIDTH          ("HIGH"),
       .COMPENSATION       ("ZHOLD"),
       .STARTUP_WAIT       ("FALSE"),
       .DIVCLK_DIVIDE      (1),
       .CLKFBOUT_MULT      (20),
       .CLKFBOUT_PHASE     (0.000),
       .CLKOUT0_DIVIDE     (7), // 100 MHz
       .CLKOUT0_PHASE      (0.000),
       .CLKOUT0_DUTY_CYCLE (0.500),
       .CLKOUT1_DIVIDE     (7*8), // 333/8 MHz
       .CLKOUT1_PHASE      (0.000),
       .CLKOUT1_DUTY_CYCLE (0.500),
       .CLKIN1_PERIOD      (20.000)  // 50 MHz
       ) U_PLL (
		.CLKFBOUT ( clk_fb_pll),
		.CLKOUT0  ( clk_serdes),
		.CLKOUT1  ( clk_word_prebuf ),
		.CLKFBIN  ( clk_fb_pll),
		.CLKIN1   ( clk_pll_i),
		.CLKIN2   ( 1'b0 ),
		.CLKINSEL ( 1'b1 ),
		.DADDR    ( 7'b0 ),
		.DCLK     ( 1'b0 ),
		.DEN      ( 1'b0),
		.DI       ( 16'b0 ),

		.DWE    (1'b0),
		.PWRDWN ( 1'b0),
		.RST    (~clk_pll_rstn_i)
		);
   

    BUFG U_BufClkPar(
		     .I(clk_word_prebuf),
		     .O(clk_word)
		     );

/*      BUFR
     #(.SIM_DEVICE("7SERIES"),
       .BUFR_DIVIDE("8"))
   U_SlowClkDiv
     (.O (clk_word),
      .CE(1'b1),
      .CLR(~rst_n),
      .I (clk_serdes));*/

   genvar i;
   
   generate

      for(i=0;i<g_lanes;i=i+1)
        begin
           dphy_serdes_zynq
            #( .g_delay ( g_data_delay ) )
           U_Serdes_LaneX (
                           .clk_serdes_i(clk_serdes),
                           .clk_word_i(clk_word),
                           .rst_n_a_i(rst_n),
                           .oe_i(serdes_oe_lane[i]),
                           .d_i(serdes_data[i*8 +: 8]),
                           .q_p_o(dsi_hs_p_o[i]),
                           .q_n_o(dsi_hs_n_o[i])
                           );
        end // for (i=0;i<=g_lanes;i+=1)
   endgenerate
   

   dphy_serdes_zynq
     #( .g_delay ( 0 ) )
   U_Serdes_ClkLane (
		     .clk_serdes_i(clk_serdes),
		     .clk_word_i(clk_word),
		     .rst_n_a_i(rst_n),
		     .oe_i(serdes_oe_lane[g_lanes]),
		     .d_i(serdes_data[g_lanes*8 +: 8]),
		     .q_p_o(dsi_clk_p_o),
		     .q_n_o(dsi_clk_n_o)

		     );


   generate

      for(i=0;i<g_lanes;i=i+1)
        begin
	   IOBUF U_IOBUF_LP_P
	    (
	     .O  (),
	     .IO (dsi_lp_p_o[i]),
	     .I  (dsi_lp_p[i]),
	     .T  (~dsi_lp_oe[i])
	     );
	   IOBUF U_IOBUF_LP_N
	    (
	     .O  (),
	     .IO (dsi_lp_n_o[i]),
	     .I  (dsi_lp_n[i]),
	     .T  (~dsi_lp_oe[i])
	     );

	end
      
      endgenerate
   

   	   IOBUF U_IOBUF_LP_P
	    (
	     .O  (),
	     .IO (dsi_clk_lp_p_o),
	     .I  (dsi_clk_lp_p),
	     .T  (~dsi_clk_lp_oe)
	     );
	   IOBUF U_IOBUF_LP_N
	    (
	     .O  (),
	     .IO (dsi_clk_lp_n_o),
	     .I  (dsi_clk_lp_n),
	     .T  (~dsi_clk_lp_oe)
	     );

  
endmodule // dsi_core_zynq_wrapper
