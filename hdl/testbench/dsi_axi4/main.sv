`timescale 1ns/1ps

`include "simdrv_defs.svh"
//`include "../../rtl/dsi_core/dsi_defs.vh"

`define REG_H_FRONT_PORCH 'h0
`define REG_H_BACK_PORCH  'h4
`define REG_H_ACTIVE      'h8
`define REG_H_TOTAL       'hc
`define REG_V_FRONT_PORCH 'h10
`define REG_V_BACK_PORCH  'h14
`define REG_V_ACTIVE      'h18
`define REG_V_TOTAL       'h1c
`define REG_TIMING_CTL    'h20
`define REG_DSI_TICKDIV   'h24
`define REG_DSI_CTL       'h28
`define REG_TEST_XSIZE    'h2c
`define REG_TEST_YSIZE    'h30
`define REG_TEST_CTL      'h34
`define REG_LP_TX         'h38
`define REG_DSI_GPIO      'h3c
`define REG_DSI_LANE_CTL      'h40


virtual class CStreamMasterAccessor;

   pure virtual task send( byte data[$], uint64_t aux[$], int count, int user = 0, int dest = 0, int id = 0 );
   
endclass // CStreamMasterAccessor

class CAXI4StreamMasterAccessor extends CStreamMasterAccessor;

   virtual interface Axi4StreamMaster m_intf;

   function new (virtual interface Axi4StreamMaster intf);
      m_intf = intf;
   endfunction // new

   virtual task send( byte data[$], uint64_t aux[$], int count, int user = 0, int dest = 0, int id = 0 );
      byte d2[];
      bit  strb[];
      bit  keep[];
      int  i;
      
      d2 = new [count];
      strb = new [count];
      keep = new [count];

      for(i=0;i<count;i++)
	begin
	   d2[i] = data [i];
	   keep[i] = 1;
	   strb[i] = 'hff;
	end
      
      
      m_intf.SendPacket( d2, strb, keep, id, dest, user, count );
   endtask 
   
endclass // CAXI4StreamMasterAccessor


class CDummyFrameGenerator;

   CStreamMasterAccessor m_stream;
   int m_w, m_h;
   
   
   
   function new (CStreamMasterAccessor acc, int w, int h);
      m_stream = acc;
      m_w = w;
      m_h = h;
   endfunction // new
   

   task run();
      while (1)
	begin
	   byte d[$];
	   
//	   int y, x;
	   
	   for(int y=0;y<m_h;y++)
	     begin
		d='{};

		for(int x = 0; x < m_w;x++)
		  begin
		     if(y==0 || y== (m_h-1) || x == 0 || x== (m_w-1))
		       begin
			  d.push_back('hff);
			  d.push_back('hff);
			  d.push_back('hff);
		       end else begin
			  d.push_back(x);
			  d.push_back(x);
			  d.push_back(x);
		       end
		  end
		
		m_stream.send(d, '{}, m_w*3, y == 0 ? 1 : 0);
		
		#10ns;
		

	     end
	   
	end
      
      
   endtask // run
   
      
endclass // CDummyFrameGenerator

   

class CAXI4LiteMasterAccessor extends CBusAccessor;

   virtual interface Axi4LiteMaster m_intf;
   
   virtual task writem(uint64_t addr[], uint64_t data[], input int size, ref int result);
      bit[1:0] resp;
      
//      if(size != 4)
//	$fatal("CAXI4LiteMasterAccessor : only 32-bit writes accepted %d", size );
      
     m_intf.WriteTransaction(addr[0], 0, data[0], 'hff, resp);
   endtask // writem
   
   virtual task readm(uint64_t addr[], ref uint64_t data[], input int size, ref int result);
      bit[63:0] rv, resp;
  //    m_intf.ReadTransaction(addr[0], 0, rv, resp);
      data[0] = rv;
   endtask // readm
   

   function new (virtual interface Axi4LiteMaster intf);
      m_intf = intf;
   endfunction // new
   

      

endclass // AXI4LiteMasterAccessor


module main;

   reg clk_sys = 0;
   reg clk_dsi = 0;
   reg rst_n = 0;
   
   parameter int g_dsi_clk_period = 36.4583ns;

   always #5ns clk_sys <= ~clk_sys;
   always #(g_dsi_clk_period/2) clk_dsi <= ~clk_dsi;

   initial begin
      repeat(10) @(posedge clk_sys);
      rst_n <= 1;
   end
      
   AXI4Lite #(.N(4)) control( .ACLK(clk_sys), .ARESETn(rst_n ));
   AXI4Stream #(.N(3)) pixels(  .ACLK(clk_sys), .ARESETn(rst_n ));

   Axi4LiteMaster U_BusMaster(.intf(control));
   Axi4StreamMaster U_DataMaster(.intf(pixels));
  
   
   dsi_core 
     #(
       .g_control_interface_type("AXI4"),
       .g_pixel_interface_type("AXI4")
       ) DUT(
	     .s_axil_ACLK(clk_sys),
	     .s_axil_ARESETN(rst_n),
	     
	     .clk_dsi_i(clk_sys),
 	     .s_axil_ARVALID(control.ARVALID),
 	     .s_axil_AWVALID(control.AWVALID),
	     .s_axil_BREADY(control.BREADY),
	     .s_axil_RREADY(control.RREADY),
 	     .s_axil_WVALID(control.WVALID),
 	     .s_axil_ARADDR(control.ARADDR),
 	     .s_axil_AWADDR(control.AWADDR),
	     .s_axil_WDATA(control.WDATA),
 	     .s_axil_WSTRB(control.WSTRB),
 	     .s_axil_ARREADY(control.ARREADY),
 	     .s_axil_AWREADY(control.AWREADY),
 	     .s_axil_BVALID(control.BVALID),
 	     .s_axil_RVALID(control.RVALID),
 	     .s_axil_WREADY(control.WREADY),
 	     .s_axil_BRESP(control.BRESP),
 	     .s_axil_RRESP(control.RRESP),
 	     .s_axil_RDATA(control.RDATA),

	     .s_axis_aclk(pixels.ACLK),
	     .s_axis_aresetn(pixels.ARESETn),
	     .s_axis_tdata(pixels.TDATA),
	     .s_axis_tdest(pixels.TDEST),
	     .s_axis_tid(pixels.TID),
	     .s_axis_tkeep(pixels.TKEEP),
	     .s_axis_tlast(pixels.TLAST),
	     .s_axis_tready(pixels.TREADY),
	     .s_axis_tstrb(pixels.TSTRB),
	     .s_axis_tuser(pixels.TUSER),
	     .s_axis_tvalid(pixels.TVALID)
	     );


   typedef struct 
		  {
		     int width, height;

		     int h_front_porch, h_back_porch;
		     int v_front_porch, v_back_porch;
		     int frame_gap;
		  } dsi_panel_t;
   
   
   initial begin
      uint64_t dsi_ctl;
      dsi_panel_t panel;
      
      CAXI4LiteMasterAccessor acc = new (U_BusMaster);
      CAXI4StreamMasterAccessor acc_stream = new (U_DataMaster);
      CDummyFrameGenerator fgen = new(acc_stream, 640, 480);
      
      
      panel.h_front_porch = 16*6;
      panel.h_back_porch = 16*6;
      panel.v_front_porch = 10;
      panel.v_back_porch = 10;
      panel.width = 640;
      panel.height = 480;
      panel.frame_gap = 1000;
      
      
      
      
      while(!rst_n)
	@(posedge clk_sys);


      acc.write(`REG_DSI_LANE_CTL, 0);
      acc.write(`REG_DSI_CTL, 0); // disable core
      acc.write(`REG_DSI_TICKDIV, 5);
      acc.write(`REG_DSI_TICKDIV, 5);

      dsi_ctl = (3 << 8);
      acc.write(`REG_DSI_CTL, dsi_ctl); /* disable DSI clock, set lane count */
      dsi_ctl |= 1;
      acc.write(`REG_DSI_CTL, dsi_ctl); /* enable DSI clock */


      acc.write(`REG_H_FRONT_PORCH, panel.h_front_porch);
      acc.write(`REG_H_BACK_PORCH, panel.h_back_porch);
      acc.write(`REG_H_ACTIVE, panel.width * 3);
      acc.write(`REG_H_TOTAL, panel.frame_gap);
      acc.write(`REG_V_BACK_PORCH, panel.v_back_porch);
      acc.write(`REG_V_FRONT_PORCH, panel.v_back_porch + panel.height);
      acc.write(`REG_V_ACTIVE,
		panel.v_back_porch + panel.height + panel.v_front_porch);
      acc.write(`REG_V_TOTAL,
		panel.v_back_porch + panel.height + panel.v_front_porch);

      acc.write(`REG_TIMING_CTL, 1); /* start display refresh */

      $display("Config done!");
      fgen.run();
      
      
      
      
      
   end
      
endmodule // main


