/*.
 * DSI Shield
 * Copyright (C) 2013-2014 twl <twlostow@printf.cc>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or.
 * (at your option) any later version.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */


`timescale 1ns/1ns

  module edid_eeprom (
		      input  clk_sys_i,
		      input  rst_n_i,

		      inout  scl_b,
		      inout  sda_b,

		      input  hdmi_p5v_notif_i,
		      output hdmi_hpd_en_o,

		      input [7:0] addr_i,
		      input [7:0] data_i,
		      input wr_i);
      

   parameter g_size = 128;
//   parameter g_init_file = "edid.dat";
   parameter g_address = 7'h50;

   reg [7:0] 		    tx_byte='haa;
   wire [7:0] 		    rx_byte;
   
   assign hdmi_hpd_en_o = 1'b1;
   
   gc_i2c_slave #(
			      .g_gf_len(1))
   
		U_I2C_Slave 	      
     (
      .clk_i(clk_sys_i),
      .rst_n_i(rst_n_i),

      .scl_i(scl_b),
      .scl_o(scl_out),
      .scl_en_o(scl_en),
      .sda_i(sda_b),
      .sda_o(sda_out),
      .sda_en_o(sda_en),

      .i2c_addr_i(g_address),
      .ack_i(ack),
      .tx_byte_i(tx_byte),
      .rx_byte_o(rx_byte),

      .i2c_sta_p_o(i2c_start),
      .i2c_sto_p_o(i2c_stop),

      .addr_good_p_o(addr_good_p),
      .r_done_p_o(r_done_p),
      .w_done_p_o(w_done_p),

      .op_o(op)
      );

   reg [7:0] 		    edid[0:g_size-1];

   assign ack = 1;
   
   assign tx_byte_i = 0;

   assign scl_b = scl_en?scl_out :1'bz;
   assign sda_b = sda_en?sda_out :1'bz;

   reg [7:0] 		    addr=0;

   
   always@(posedge clk_sys_i)
     if(wr_i)
       edid[addr_i] <= data_i;
     else
       tx_byte <= edid[addr];

   always@(posedge clk_sys_i)
     begin
	if(!op && r_done_p)
	  addr <= rx_byte;
	else if (op && w_done_p)
	  addr <= addr + 1;
     end


		 
   
endmodule // edid_eeprom


