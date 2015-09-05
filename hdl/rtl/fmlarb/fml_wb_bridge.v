/* 
 * DSI Shield
 * Copyright (C) 2013-2014 twl <twlostow@printf.cc>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or 
 * (at your option) any later version.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/* fml_wb_bridge.v - FML to Wishbone B.4 bridge (very slow and crappy one) */

`timescale 1ns/1ps

  module fml_wb_bridge 
    #(
    parameter sdram_depth = 26
)
(
 input                        clk_sys_i,
 input                        rst_n_i,
 
 output reg [sdram_depth-1:0] fml_adr,
 output reg                   fml_stb,
 output reg                   fml_we,
 input                        fml_ack,
 output reg [3:0]             fml_sel,
 output reg [31:0]            fml_do,
 input [31:0]                 fml_di,

 input [31:0]                 wb_adr_i,
 input [31:0]                 wb_dat_i,
 input [3:0]                  wb_sel_i,
 input                        wb_cyc_i,
 input                        wb_stb_i,
 input                        wb_we_i,
 output reg                   wb_ack_o,
 output reg                   wb_stall_o,
 output reg [31:0]            wb_dat_o );


   reg                    wb_we_r;
   reg                    wb_ack;
   reg                    is_write;
   reg [1:0]              state;
   
`define ST_IDLE 0
`define ST_REQ 1
`define ST_WAIT 2
   
   reg [3:0]              cnt;
   
   always@(posedge clk_sys_i)
     if(!rst_n_i)
       begin
          wb_stall_o <= 1;
          wb_ack_o <= 0;
          fml_adr <= 0;
          fml_stb <= 0;
          fml_we  <= 0;
          fml_sel <= 0;
          fml_do <= 0;
          state <= `ST_IDLE;
          
          
       end else begin // if (!rst_n_i)
          case(state)
            `ST_IDLE: if(wb_cyc_i && wb_stb_i) begin
               wb_stall_o <= 0;
               wb_ack_o <= 0;
               fml_stb <= 1;
               fml_adr <= wb_adr_i;
               fml_sel <= wb_sel_i;
               fml_we <= wb_we_i;
               is_write <= wb_we_i;
               fml_do <= wb_dat_i;
               state <= `ST_REQ;
               wb_stall_o <= 0;
            end else begin
               wb_stall_o <= 1;
               wb_ack_o <= 0;
               fml_stb <= 0;
            end // else: !if(wb_cyc_i && wb_stb_i)
            
            `ST_REQ:
              begin
                 wb_stall_o <= 1;
                 
               if(fml_ack) 
                 begin
		    fml_do <= 0;
                    fml_sel <= is_write ? 0 : 4'hf;
                    fml_stb <= 0;
                    wb_dat_o <= fml_di;
                    state <= `ST_WAIT;
                    cnt <= 0;
                 end
              end // case: `ST_REQ
            

            `ST_WAIT:
              begin
                 cnt <= cnt + 1;
                 wb_stall_o <= 1;
   
                 if(cnt == 2)
		   
                   begin
                      fml_stb <= 0;
                      fml_we <= 0;
                      wb_ack_o <= 1;
                      state <= `ST_IDLE;
                      fml_sel <= 0;
                      fml_do <= 0;
                   end
              end
          endcase // case (state)
          end // else: !if(!rst_n_i)
   
         
endmodule // fml_wb_bridge
