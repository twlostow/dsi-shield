`timescale 1ps/1ps

`include "dsi_defs.vh"
`include "simdrv_defs.svh"


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

`define DSI_LANE(index, swap, reverse) \
    ((swap&3) << ((index) * 2) | ((reverse) ? (1<<((index)+8)) : 0 ))

`define DSI_LANE_INVERT_CLOCK (1<<12)

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



function automatic bit[15:0] dsi_crc(byte d[$], int n);
   bit[15:0] poly = 16'h8408;

   int       byte_counter;
   int       bit_counter;
   bit [7:0] current_data;
   bit[15:0] result = 16'hffff;

   for ( byte_counter = 0; byte_counter < n; byte_counter++)
     begin
        current_data = d[byte_counter];

        for ( bit_counter = 0; bit_counter < 8; bit_counter++)
          begin
          if ( ( ( result & 'h0001 ) ^ ( ( current_data ) & 'h0001 ) ) )
            result = ((result >> 1) & 'h7fff) ^ poly;
          else
            result = ((result >> 1) & 'h7fff);
        current_data = (current_data >> 1 ) & 'h7F;
          end
     end // for ( byte_counter = 0; byte_counter < n; byte_counter++)
   return result;
   
endfunction // dsi_crc


function bit is_long_packet(byte ptype);

   case (ptype)
     `PTYPE_VSYNC_START:
       return 0;
     `PTYPE_VSYNC_END:
       return 0;
     `PTYPE_HSYNC_START:
       return 0;
     `PTYPE_HSYNC_END:
       return 0;
     `PTYPE_BLANKING:
       return 1;
     `PTYPE_RGB24:
       return 1;
   endcase // case (ptype)
endfunction // is_long_packet


typedef struct {
   int         ptype;
   byte        data[$];
   byte        raw_data[$];
   bit crc_ok;
   bit ecc_ok;
} dsi_packet_t;


task automatic dsi_decode( ref byte d[$], ref  dsi_packet_t decoded[$] );

   while(d.size() >= 4)
     begin
        
        bit [7:0] ptype = d[0];
        bit [7:0] wc_l = d[1];
        bit [7:0] wc_h = d[2];
        bit [7:0] ecc = d[3];

        bit       is_long = is_long_packet(ptype);
        reg [15:0] wcount;

        int        i;
        dsi_packet_t pkt;

        bit [15:0] crc = 0, crc_our;
        wcount[15:8] = wc_h;
        wcount[7:0] = wc_l;


//        $display("PType: %d %x long: %d wcount: %d crc: %x", d.size(), ptype, is_long, wcount, crc);
        
        if(d.size() - 4 < wcount && is_long)
          return;
        

        if(ptype == 0 || ptype == 'hff)
          begin
             $display("EoT");
             while(d[0] == 0 || d[0] == 'hff)
               d.pop_front();
             return;
          end
        
        
        pkt.raw_data.push_back (d.pop_front());
        pkt.raw_data.push_back (d.pop_front());
        pkt.raw_data.push_back (d.pop_front());
        pkt.raw_data.push_back (d.pop_front());


        if(is_long)
          begin

             $display("LPKt type %x, wcount %d", pkt.raw_data[0], wcount);
             
             for(i=0;i<wcount;i++)
               begin
                  byte b=d.pop_front();
                  
                  pkt.data.push_back(b);
                  pkt.raw_data.push_back(b);
               end

             crc[7:0] = d.pop_front();
             pkt.raw_data.push_back(crc[7:0]);
             crc[15:8] = d.pop_front();
             pkt.raw_data.push_back(crc[15:8]);

             crc_our = dsi_crc(pkt.raw_data[4:$], wcount);

             if( crc!=crc_our)
               begin
                  $error("CRC failed [%x vs %x]", crc, crc_our);
                  //$stop;
                  
               end
             
             
          end else begin // if (is_long)
             $display("SPKt type %x", pkt.raw_data[0]);
          end // else: !if(is_long)
        

        

        pkt.ptype = ptype;
        decoded.push_back(pkt);
        
        
        
     end
   
   
endtask // dsi_decode

module dsi_hs_decoder
  #(
    parameter g_lanes = 4)
   (
    clk_p_i,
    lane_p_i,
    lane_n_i
    );

   typedef struct {
      reg [7:0]   sreg;
      bit         synced;
      int         bit_count;
   } lane_t;
   
   
   lane_t lanes[g_lanes];

   input          clk_p_i;
   input  lane_p_i[g_lanes];
   real lane_p_i[g_lanes];
   input  lane_n_i[g_lanes];
   real lane_n_i[g_lanes];
   
   wire [g_lanes-1:0] lp_mode;
   wire [g_lanes-1:0] rx_bit;

   genvar             j;
   
   generate 
      for(j=0;j<g_lanes;j++)
        begin
           assign lp_mode[j] = (lane_p_i[j] > 1 && lane_n_i[j] > 1);
           assign rx_bit[j] = (lane_p_i[j] > lane_n_i[j]);
        end
      
   endgenerate // UNMATCHED !!
      
   
   initial begin
      int i;
      
      for(i=0;i<g_lanes;i++)
        lanes[i].synced = 0;

   end

   byte   rx_data[$];
   
   always @(posedge clk_p_i or negedge clk_p_i)
     begin
        int i;
        for(i=0;i<g_lanes;i++)
          begin
             lanes[i].sreg <= (lanes[i].sreg>>1) | (rx_bit[i] ? 'h80 : 0);

             if(lp_mode[i] && lanes[i].synced) begin
               lanes[i].synced <= 0;
                $display("L%d: LP-mode", i);
             end
// else
//               $display("L%d Sreg %x", i, lanes[i].sreg);
             
             
                       
             
                 
             if(lanes[i].synced && lanes[i].bit_count == 7)
               begin
                  automatic byte d = lanes[i].sreg;
                  rx_data.push_back(d);
  //                $display("l%d Rx %x", i, lanes[i].sreg );
                  lanes[i].bit_count <= 0;
               end else
                 lanes[i].bit_count <= lanes[i].bit_count + 1;
        
             if(!lanes[i].synced && lanes[i].sreg == `DSI_SYNC_SEQ)
               begin
                  lanes[i].bit_count <= 0;
                  lanes[i].synced <= 1;
               end
          end // for (i=0;i<g_lanes;i++)
     end // always @ (posedge clk_p_i or negedge clk_p_i)

endmodule // dsi_hs_decoder


module dsi_buffer(
                  input hs_p_i,
                  input hs_n_i,
                  input lp_p_i,
                  input lp_n_i,

                  output real txp_o,
                  output real txn_o
                  );
  real txp, txn;

always@*
   
  begin

     if(lp_p_i == 1'b0 || lp_p_i == 1'b1)
       begin
          txp <= lp_p_i ? 1.2: 0.0;
          txn <= lp_n_i ? 1.2: 0.0;
       end else begin
          txp <= hs_p_i ? 0.5: 0.3;
          txn <= hs_n_i ? 0.5: 0.3;
       end
  end
       
   assign txp_o = txp;
   assign txn_o = txn;
   
endmodule // dsi_buffer

   

module main;
   reg clk_50m = 0;
   wire clk_sys;
   reg rst_n = 0;

   reg tick=0;

   parameter int g_tick_div = 20;
   parameter time g_fast_period = 4ns;

   always #10ns clk_50m <= ~clk_50m;

   int            clk_div = 0;
   

   initial begin
      #100ns;
      @(posedge clk_sys);
      rst_n <= 1;
   end

   task host_write(int addr, int data);
   endtask // host_write

   task host_read(int addr, output int data);
   endtask // host_write

   task lp_write(int value);
      int rv = 0; 
      
      host_write(`REG_DSI_CTL, 'h3);
      while(! (rv & 'h2))
        host_read(`REG_DSI_CTL, rv);

      host_write(`REG_LP_TX, 'h100 | value);

      rv=0;
      while(! (rv & 'h2))
        host_read(`REG_DSI_CTL, rv);
      
   endtask // lp_write

   task set_pixel(int x, int y, int color);
//      host_write(`REG_DBG_DATA, (640*y+x) | (color << 28));
   endtask // set_pixel
   
   
   
      
   wire [3:0] dsi_hs_p;
   wire [3:0] dsi_hs_n;

   wire [3:0] dsi_lp_p;
   wire [3:0] dsi_lp_n;
   wire [3:0] dsi_lp_oe;
   parameter int c_num_lanes = 3;
   real       txp_vec[c_num_lanes], txn_vec[c_num_lanes];
   

   wire dsi_lp_clk_p, dsi_lp_clk_n, dsi_lp_clk_oe;
   
   wire dsi_clk_p, dsi_clk_n;

      
   AXI4Lite #(.N(4)) control( .ACLK(clk_sys), .ARESETn(rst_n ));
   Axi4LiteMaster U_BusMaster(.intf(control));
  
   
   dsi_core_zynq_wrapper
     #(
       ) DUT(
	     .s_axil_ACLK(clk_sys),
	     .s_axil_ARESETN(rst_n),
	     
	     .clk_pll_i(clk_50m),
	     .clk_pll_rstn_i(1'b1),
	     .clk_pll_o(clk_sys),
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

	     .dsi_clk_p_o(dsi_clk_p),
	     .dsi_clk_n_o(dsi_clk_n),
	     .dsi_clk_lp_p_o(dsi_clk_lp_p),
	     .dsi_clk_lp_n_o(dsi_clk_lp_n),
	     .dsi_hs_p_o(dsi_hs_p),
	     .dsi_hs_n_o(dsi_hs_n),
	     .dsi_lp_p_o(dsi_lp_p),
	     .dsi_lp_n_o(dsi_lp_n),

	     .dsi_reset_n_o()

	  
	     );


   
   
/* -----\/----- EXCLUDED -----\/-----
   dsi_core_zynq_wrapper 
     #(
       .g_lanes(4),
       .g_pixels_per_clock(2)
       ) DUT
     (
      .clk_dsi_i(clk),
      .clk_sys_i(clk),
      .clk_phy_i(clk_fast),
   
      .rst_n_i(rst_n),

      .pll_locked_i(1'b1),

      .frame_ready_o(),
   
      .fifo_full_o(),
      .fifo_pixels_i(24'b0),
      .fifo_frame_i(1'b0),
      .fifo_wr_i(1'b0),



      );
 -----/\----- EXCLUDED -----/\----- */

   dsi_hs_decoder #(
                    .g_lanes(c_num_lanes) )
   Decoder 
     (
      .clk_p_i(dsi_clk_p),
      .lane_p_i(txp_vec),
      .lane_n_i(txn_vec)
      );

   generate
      genvar ii;

      for(ii=0;ii<c_num_lanes;ii++)
        begin
           dsi_buffer LaneX
             (
              .hs_p_i(dsi_hs_p[ii]),
              .hs_n_i(dsi_hs_n[ii]), 
              .lp_p_i(dsi_lp_p[ii]),
              .lp_n_i(dsi_lp_n[ii]), 
              .txp_o(txp_vec[ii]),
              .txn_o(txn_vec[ii])
              );
        end // for (ii=0;ii<4;ii++)
      endgenerate
   
    dsi_buffer LaneClk
     (
      .hs_p_i(dsi_clk_p),
      .hs_n_i(dsi_clk_n), 
      .lp_p_i(dsi_clk_lp_p),
      .lp_n_i(dsi_clk_lp_n)
      );
  

      initial begin
	 CAXI4LiteMasterAccessor acc = new (U_BusMaster);
	 uint64_t dsi_ctl = 1 | (c_num_lanes << 8);
	 
         int i;
         
         #5us;
         acc.write(`REG_DSI_TICKDIV, 10);
	 acc.write(`REG_DSI_LANE_CTL, `DSI_LANE(0,0,0) | `DSI_LANE(1,1,0) | `DSI_LANE(2,2,0) | `DSI_LANE(3,3,0) );
	 
         

         acc.write(`REG_GPIO, 0); // toggle RESETB
         #200ns;
         acc.write(`REG_GPIO, 1);
         #200ns;



         acc.write(`REG_DSI_CTL, dsi_ctl);          // enable DSI clock

         #300ns;

/*                  dsi_write(REG_H_FRONT_PORCH, 20*3 );
         dsi_write(REG_H_BACK_PORCH, 20*3 );
         dsi_write(REG_H_ACTIVE, 640*3 );
         dsi_write(REG_H_TOTAL, 700);

         dsi_write(REG_V_BACK_PORCH, 10 );
         dsi_write(REG_V_FRONT_PORCH, 10 + 960 );
         dsi_write(REG_V_ACTIVE, 960 + 10 + 10 );
         dsi_write(REG_V_TOTAL, 960 + 10 + 10 );*/

/* -----\/----- EXCLUDED -----\/-----
                  for(i=0;i<640;i++) begin
           set_pixel(i, 0, 10);
           set_pixel(i, 959, 10);
         end
         for(i=0;i<960;i++) begin
           set_pixel(0, i, 10);
           set_pixel(639, i, 10);
         end
         
 -----/\----- EXCLUDED -----/\----- */
         

         
         acc.write(`REG_H_FRONT_PORCH, 16*3);
         acc.write(`REG_H_BACK_PORCH, 16*3);
         acc.write(`REG_H_ACTIVE, 320*3);
         acc.write(`REG_H_TOTAL, 4000);
         
         acc.write(`REG_V_FRONT_PORCH, 28 + 240 ); // v front porch
         acc.write(`REG_V_BACK_PORCH, 28 ); // v back porch
         acc.write(`REG_V_ACTIVE, 300  );
         acc.write(`REG_V_TOTAL, 320 );
         
         
         acc.write(`REG_TIMING_CTL, 1);
//         acc.write(10, 1);
         
       
         acc.write(`REG_TEST_XSIZE, 320-1);
         acc.write(`REG_TEST_YSIZE, 240-1);
         acc.write(`REG_TEST_CTL, 1);


         
         #30us;

   //      dsi_decode(Decoder.rx_data);
         
         
      end // initial begin

   dsi_packet_t decoded_packets[$];

   int f;
   
   
   initial begin
     f=$fopen("frames.dat","w");
      
      $display("%d", f);

      forever begin
         wait(Decoder.rx_data.size()>4096);
         dsi_decode(Decoder.rx_data, decoded_packets);

         while(decoded_packets.size())
           begin
              automatic int i;
              automatic dsi_packet_t pkt;
              pkt=decoded_packets.pop_front();

              $fwrite(f, "RAW %d ", pkt.raw_data.size());
              for(i=0;i<pkt.raw_data.size(); i++)
                $fwrite(f, "%02x ", pkt.raw_data[i]);  
              $fwrite(f, "\n");  
              
              
              case (pkt.ptype)
                `PTYPE_VSYNC_START:
                   $fwrite(f, "VSYNC_START\n");
                `PTYPE_HSYNC_START:
                   $fwrite(f, "HSYNC_START\n");
                `PTYPE_VSYNC_END:
                   $fwrite(f, "VSYNC_END\n");
                `PTYPE_HSYNC_END:
                   $fwrite(f, "HSYNC_END\n");
                `PTYPE_BLANKING:
                   $fwrite(f, "BLANK %d\n", pkt.data.size());
                `PTYPE_RGB24:
                  begin

                     $fwrite(f, "PIXELS %d ", pkt.data.size());
                     
                     for(i=0;i<pkt.data.size();i++)
                          $fwrite(f,"%02x ", pkt.data[i]);
                     
                     $fwrite(f,"\n");

                  end // case: `PTYPE_RGB24
                default:
                  $fwrite(f, "UNKNOWN %d %d\n", pkt.ptype, pkt.data.size());
                
           endcase // case (pkt.ptype)
              
           $fflush(f);
           
        end
      end // forever begin
   end
   
  
endmodule // main
