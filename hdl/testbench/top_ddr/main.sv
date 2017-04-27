`timescale 1ns/1ps


`include "ddr.v"
//`define DDR128Mx16
//`define DDR200

//`include "N128MDDR.v"

`timescale 1ps/1ps

module main;

   reg clk = 0;

   parameter int g_dsi_clk_period = 36.4583ns;
   parameter int g_hdmi_pclk_period = 36.4200ns * 3.0 / 4.0;
   parameter int g_lanes = 4;
   
   
   always #20ns clk <= ~clk;

   wire sdram_clk_p;
   wire sdram_clk_n;
   wire sdram_cke;
   wire sdram_cs_n;
   wire sdram_we_n;
   wire sdram_cas_n;
   wire sdram_ras_n;
   wire [12:0] sdram_adr;
   wire [1:0]  sdram_ba;
   wire [1:0]  sdram_dm;
   wire [15:0] sdram_dq;
   wire [1:0]  sdram_dqs;

   wire [3:0] dsi_hs_p;
   wire [3:0] dsi_hs_n;

   wire [3:0] dsi_lp_p;
   wire [3:0] dsi_lp_n;
   wire [3:0] dsi_lp_oe;

   real       txp_vec[4], txn_vec[4];
   

   wire dsi_lp_clk_p, dsi_lp_clk_n, dsi_lp_clk_oe;
   
   wire dsi_clk_p, dsi_clk_n;
  

   pullup(sdram_cs_n);

   pullup(sdram_cke);
   pullup(sdram_we_n);
   pullup(sdram_ras_n);
   pullup(sdram_cas_n);
   pullup(sdram_dm[0]);
   pullup(sdram_dm[1]);
   pullup(sdram_dq[0]);
   pullup(sdram_dq[1]);
   pullup(sdram_dq[2]);
   pullup(sdram_dq[3]);
   pullup(sdram_dq[4]);
   pullup(sdram_dq[5]);
   pullup(sdram_dq[6]);
   pullup(sdram_dq[7]);
   pullup(sdram_dq[8]);
   pullup(sdram_dq[9]);
   pullup(sdram_dq[10]);
   pullup(sdram_dq[11]);
   pullup(sdram_dq[12]);
   pullup(sdram_dq[13]);
   pullup(sdram_dq[14]);
   pullup(sdram_dq[15]);
   pulldown(sdram_dqs[0]);
   pulldown(sdram_dqs[1]);

   
   
   rev2_top
     #( .g_cpu_firmware("../../../software/rev1/rev1.ram"),
	.g_with_hdmi(0),
	.g_use_urv(1),
	.g_simulation(1))
      DUT 
     (
      .rst_n_a_i(1'b1),
      .clk_25m_i(clk),
      .sdram_clk_p(sdram_clk_p),
      .sdram_clk_n(sdram_clk_n),
      .sdram_cs_n(sdram_cs_n),
      .sdram_cke(sdram_cke),
      .sdram_we_n(sdram_we_n),
      .sdram_cas_n(sdram_cas_n),
      .sdram_ras_n(sdram_ras_n),
      .sdram_adr(sdram_adr),
      .sdram_dm(sdram_dm),
      .sdram_ba(sdram_ba),
      .sdram_dq(sdram_dq),
      .sdram_dqs(sdram_dqs)

      );

;
   
   ddr U_DDR 
     (.Cas_n (sdram_cas_n),
      .Clk(sdram_clk_p),
      .Clk_n(sdram_clk_n),
      .Cke(sdram_cke),
      .Cs_n(sdram_cs_n),
      .Dm(sdram_dm),
      .Ras_n(sdram_ras_n),
      .We_n(sdram_we_n),
      .Addr(sdram_adr),
      .Ba(sdram_ba),
      .Dq (sdram_dq),
      .Dqs(sdram_dqs));

/*   DDR U_DDR(.clk(sdram_clk_p),
	     .clk_n(sdram_clk_n),
	     .cke(sdram_cke),
	     .cs_n(sdram_cs_n), 
	     .ras_n(sdram_ras_n), 
	     .cas_n(sdram_cas_n), 
	     .we_n(sdram_we_n), 
	     .ba(sdram_ba), 
	     .addr(sdram_adr), 
	     .udqs(sdram_dqs[1]), 
	     .ldqs(sdram_dqs[0]), 
	     .dq(sdram_dq), 
	     .udm(sdram_dm[1]), 
	     .ldm(sdram_dm[0]));
*/

   task read32(int addr, output bit[31:0] data);
      reg                   [1 : 0] Bank_addr;
      reg        [10 - 1 : 0] Cols_addr, Cols_brst, Cols_temp;
      reg       [13 - 1 : 0] Rows_addr;


      {Bank_addr, Rows_addr, Cols_addr} = addr / 2;

      $display("read: addr %x bank %x row %x col %x\n", addr, Bank_addr, Rows_addr, Cols_addr);
      

      
      U_DDR.read_mem(addr/2,data[31:16]);
      U_DDR.read_mem(addr/2+1,data[15:0]);

      
   endtask // read32
   
     
   
   initial begin
      int i;
      bit [31:0] dq;

      #200us;

/* -----\/----- EXCLUDED -----\/-----
      for(i=0;i<'h400;i+=4 )
	begin
	   read32(i, dq);
	   $display("%x = %x %s", i, dq, i==dq?"OK":"ERROR");
	end
 -----/\----- EXCLUDED -----/\----- */

      $display("2nd half: \n");
      
      for(i='h0;i<'h40;i+=4 )
	begin
	   read32('h10000+i, dq);
	   $display("%x = %x %s", i, dq, i==dq?"OK":"ERROR");
	end
      

   end


endmodule
