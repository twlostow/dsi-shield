`timescale 1ns/1ps

// a tiny wrapper for Xilinx's HDMI core that packs pixels by 2 without
// applying any changes to the Xilinx's code.

module hdmi_rx_wrapper (
  input wire 	     rst_a_i, 

  input wire 	     tmds_clk_p_i,
  input wire 	     tmds_clk_n_i,
  input wire 	     red_p_i, 
  input wire 	     red_n_i,
  input wire 	     green_p_i,
  input wire 	     green_n_i,
  input wire 	     blue_p_i,
  input wire 	     blue_n_i,

  output wire 	     clk_pixel_o,

  output wire 	     hsync_o,
  output wire 	     vsync_o,
  output wire 	     de_o, 

  output wire 	     link_up_o,
  output wire [47:0] pixel_o,
  output wire 	     pixel_valid_o);

   wire 	     pclk;
   wire [7:0] 	     red;
   wire [7:0] 	     green;
   wire [7:0] 	     blue;
   wire 	     de_int;
   
   
   

   dvi_decoder  U_wrapped_decoder 
     (
      .tmdsclk_p(tmds_clk_p_i),
      .tmdsclk_n(tmds_clk_n_i),
      .red_p(red_p_i),
      .red_n(red_n_i),
      .green_p(green_p_i),
      .green_n(green_n_i),
      .blue_p (blue_p_i),
      .blue_n (blue_n_i),
      .exrst(rst_a_i),
      .pclk(pclk),
      .hsync(hsync_o),
      .vsync(vsync_o),
      .de(de_int),
      .blue_vld(link_up_o),
      .red(red),
      .green(green),
      .blue(blue));
   

   reg [23:0] 			       pix_hi;
   reg 				       even;
   

   
   always@(posedge pclk)
     begin
	if(!de_int)
	  even <= 1;
	else begin
	   even <= ~even;
	   if(even)
	     pix_hi <= {red, green, blue};
	end
     end // always@ (posedge pclk)

   assign pixel_valid = ~even & de;
   assign pixel = {pix_hi, red ,green, blue};
   assign clk_pixel_o = pclk;
   assign de_o = de_int;
   
endmodule // hdmi_rx_wrapper


