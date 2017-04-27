`timescale 1ns/1ps


`ifdef disabled0
module dvi_colorbar_gen
  ( output [3:0] TMDS,
    output [3:0] TMDSB );

   parameter g_pixel_clock = 100e6;
   parameter g_xres = 128;
   parameter g_yres = 128;
   parameter g_porch = 160;

   reg           hsync=0,vsync=0,de=0;
   reg  [7:0]         r,g,b;
   

   localparam period = 1s/g_pixel_clock;

   reg                pclkx10=0;
   reg                pclk= 0, pclkx2=0;
   wire                serdesstrobe;

   always #(period/2) pclkx10 <= ~pclkx10;
   integer                div5cnt=0;
   always@(posedge pclkx10)
     begin
      if(div5cnt == 2)
        pclkx2 <= 0;
      if(div5cnt == 4) begin
         pclkx2 <= 1;
         div5cnt <= 0;
      end else
        div5cnt<=div5cnt+1;
     end

   always@(posedge pclkx2)
     pclk <= ~pclk;

   reg pclkx2_d0=0;
   
   always@(posedge pclkx10)
        pclkx2_d0 <= pclkx2;
   
   assign   serdesstrobe = ~pclkx2_d0 && pclkx2;

   
   reg rst = 1;

   initial #100ns rst = 0;
   
   dvi_encoder_top U_Enc (
                          .pclk(pclk),           // pixel clock
                          .pclkx2(pclkx2),         // pixel clock x2
                          .pclkx10(pclkx10),        // pixel clock x2
                          .serdesstrobe(serdesstrobe),   // OSERDES2 serdesstrobe
                          .rstin(rst),          // reset
                          .blue_din(b),       // Blue data in
                          .green_din(g),      // Green data in
                          .red_din(r),        // Red data in
                          .hsync(hsync),          // hsync data
                          .vsync(vsync),          // vsync data
                          .de(de),             // data enable
                          .TMDS(TMDS),
                          .TMDSB(TMDSB));
               
endmodule // dvi_colorbar_gen
`endif

module colorbar_gen (
		     input 	  pclk,
		     output reg [7:0] r,
		     output reg [7:0] g,
		     output reg [7:0] b,
		     output reg vsync,
		     output reg	hsync,
		     output reg	de,
		     output reg valid);
		     
   parameter g_pixel_clock = 100e6;
   parameter g_xres = 320;
   parameter g_yres = 240;
   parameter g_porch = 8;
   parameter g_vporch = 30;
   
   int 				xcount=g_xres, ycount=g_yres;

   int 				valid_cnt = 0;
   
   always@(posedge pclk)
     begin
	if(valid_cnt !=100) begin
	   valid_cnt <= valid_cnt  +1;
	  valid <= 0;
	end else
	  valid <= 1;
     end
   
   
   always@(posedge pclk)
     begin
        if(xcount == (g_xres+3*g_porch)-1)
          begin
             xcount <= 0;
             if(ycount == (g_yres+3*g_vporch)-1)
               ycount <= 0;
             else
               ycount <= ycount + 1;
          end else 
            xcount <= xcount + 1;
     end
   

   always@* begin
      r <= (xcount == 0 || xcount == g_xres-1 ? 'hff : (xcount % 64 == 0 ? 'h80 : 0));
      g <= (ycount == 0 || ycount == g_yres-1 ? 'hff : (ycount % 64 == 0 ? 'h80 : 0));
      b <= (xcount < g_xres && ycount <g_yres ? xcount + ycount : 0);
      hsync <= (xcount > g_xres + g_porch && xcount < g_xres + 2*g_porch);
      vsync <= (ycount > g_yres + g_vporch && ycount < g_yres + 2*g_vporch);
      de <= (xcount < g_xres && ycount < g_yres);
   end

endmodule // colorbar_gen
