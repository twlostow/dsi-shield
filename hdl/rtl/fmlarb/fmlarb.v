/*
 * Milkymist SoC
 * Copyright (C) 2007, 2008, 2009, 2010, 2011 Sebastien Bourdeauducq
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

module fmlarb #(
	        parameter fml_depth = 26,
                parameter fml_width = 32
) (
	input sys_clk,
	input sys_rst,
	
	/* Interface 0 has higher priority than the others */
	input [fml_depth-1:0] m0_adr,
	input m0_stb,
	input m0_we,
	output m0_ack,
	input [fml_width/8-1:0] m0_sel,
	input [fml_width-1:0] m0_di,
	output [fml_width-1:0] m0_do,
	
	input [fml_depth-1:0] m1_adr,
	input m1_stb,
	input m1_we,
	output m1_ack,
	input [fml_width/8-1:0] m1_sel,
	input [fml_width-1:0] m1_di,
	output [fml_width-1:0] m1_do,
	
	input [fml_depth-1:0] m2_adr,
	input m2_stb,
	input m2_we,
	output m2_ack,
	input [fml_width/8-1:0] m2_sel,
	input [fml_width-1:0] m2_di,
	output [fml_width-1:0] m2_do,
	
	input [fml_depth-1:0] m3_adr,
	input m3_stb,
	input m3_we,
	output m3_ack,
	input [fml_width/8-1:0] m3_sel,
	input [fml_width-1:0] m3_di,
	output [fml_width-1:0] m3_do,

	input [fml_depth-1:0] m4_adr,
	input m4_stb,
	input m4_we,
	output m4_ack,
	input [fml_width/8-1:0] m4_sel,
	input [fml_width-1:0] m4_di,
	output [fml_width-1:0] m4_do,

	input [fml_depth-1:0] m5_adr,
	input m5_stb,
	input m5_we,
	output m5_ack,
	input [fml_width/8-1:0] m5_sel,
	input [fml_width-1:0] m5_di,
	output [fml_width-1:0] m5_do,
	
	output reg [fml_depth-1:0] s_adr,
	output reg s_stb,
	output reg s_we,
	input s_eack,
	output reg [fml_width/8-1:0] s_sel,
	input [fml_width-1:0] s_di,
	output reg [fml_width-1:0] s_do
);

assign m0_do = s_di;
assign m1_do = s_di;
assign m2_do = s_di;
assign m3_do = s_di;
assign m4_do = s_di;
assign m5_do = s_di;

wire m0_stbm;
wire m1_stbm;
wire m2_stbm;
wire m3_stbm;
wire m4_stbm;
wire m5_stbm;

reg [2:0] master;
reg [2:0] next_master;

always @(posedge sys_clk) begin
	if(sys_rst)
		master <= 3'd0;
	else
		master <= next_master;
end

/* Decide the next master */
always @(*) begin
	/* By default keep our current master */
	next_master = master;
	
	case(master)
		3'd0: if(~m0_stbm | s_eack) begin
                   if(m0_stbm | m0_stb) next_master = 3'd0;
		   else if(m1_stbm) next_master = 3'd1;
		   else if(m2_stbm) next_master = 3'd2;
		   else if(m3_stbm) next_master = 3'd3;
		   else if(m4_stbm) next_master = 3'd4;
		   else if(m5_stbm) next_master = 3'd5;
		end
		3'd1: if(~m1_stbm | s_eack) begin
			if(m0_stbm) next_master = 3'd0;
			else if(m3_stbm) next_master = 3'd3;
			else if(m4_stbm) next_master = 3'd4;
			else if(m5_stbm) next_master = 3'd5;
			else if(m2_stbm) next_master = 3'd2;
		end
		3'd2: if(~m2_stbm | s_eack) begin
			if(m0_stbm) next_master = 3'd0;
			else if(m3_stbm) next_master = 3'd3;
			else if(m4_stbm) next_master = 3'd4;
			else if(m5_stbm) next_master = 3'd5;
			else if(m1_stbm) next_master = 3'd1;
		end
		3'd3: if(~m3_stbm | s_eack) begin
			if(m0_stbm) next_master = 3'd0;
			else if(m4_stbm) next_master = 3'd4;
			else if(m5_stbm) next_master = 3'd5;
			else if(m1_stbm) next_master = 3'd1;
			else if(m2_stbm) next_master = 3'd2;
		end
		3'd4: if(~m4_stbm | s_eack) begin
			if(m0_stbm) next_master = 3'd0;
			else if(m5_stbm) next_master = 3'd5;
			else if(m1_stbm) next_master = 3'd1;
			else if(m2_stbm) next_master = 3'd2;
			else if(m3_stbm) next_master = 3'd3;
		end
		default: if(~m5_stbm | s_eack) begin // 3'd5
			if(m0_stbm) next_master = 3'd0;
			else if(m1_stbm) next_master = 3'd1;
			else if(m2_stbm) next_master = 3'd2;
			else if(m3_stbm) next_master = 3'd3;
			else if(m4_stbm) next_master = 3'd4;
		end
	endcase
end

/* Mux control signals */
always @(*) begin
	case(master)
		3'd0: begin
			s_adr = m0_adr;
			s_stb = m0_stbm;
			s_we = m0_we;
		end
		3'd1: begin
			s_adr = m1_adr;
			s_stb = m1_stbm;
			s_we = m1_we;
		end
		3'd2: begin
			s_adr = m2_adr;
			s_stb = m2_stbm;
			s_we = m2_we;
		end
		3'd3: begin
			s_adr = m3_adr;
			s_stb = m3_stbm;
			s_we = m3_we;
		end
		3'd4: begin
			s_adr = m4_adr;
			s_stb = m4_stbm;
			s_we = m4_we;
		end
		default: begin // 3'd5
			s_adr = m5_adr;
			s_stb = m5_stbm;
			s_we = m5_we;
		end
	endcase
end


/* Generate delayed ack signals and masked strobes */
fmlarb_dack dack0(.sys_clk(sys_clk), .sys_rst(sys_rst),
	.stb(m0_stb), .eack((master == 3'd0) & s_eack), .we(m0_we),
	.stbm(m0_stbm), .ack(m0_ack));
fmlarb_dack dack1(.sys_clk(sys_clk), .sys_rst(sys_rst),
	.stb(m1_stb), .eack((master == 3'd1) & s_eack), .we(m1_we),
	.stbm(m1_stbm), .ack(m1_ack));
fmlarb_dack dack2(.sys_clk(sys_clk), .sys_rst(sys_rst),
	.stb(m2_stb), .eack((master == 3'd2) & s_eack), .we(m2_we),
	.stbm(m2_stbm), .ack(m2_ack));
fmlarb_dack dack3(.sys_clk(sys_clk), .sys_rst(sys_rst),
	.stb(m3_stb), .eack((master == 3'd3) & s_eack), .we(m3_we),
	.stbm(m3_stbm), .ack(m3_ack));
fmlarb_dack dack4(.sys_clk(sys_clk), .sys_rst(sys_rst),
	.stb(m4_stb), .eack((master == 3'd4) & s_eack), .we(m4_we),
	.stbm(m4_stbm), .ack(m4_ack));
fmlarb_dack dack5(.sys_clk(sys_clk), .sys_rst(sys_rst),
	.stb(m5_stb), .eack((master == 3'd5) & s_eack), .we(m5_we),
	.stbm(m5_stbm), .ack(m5_ack));

/* Mux data write signals */
reg [2:0] wmaster;

always @(posedge sys_clk) begin
	if(sys_rst)
		wmaster <= 3'd0;
	else if(s_we & s_eack)
		wmaster <= master;
end

always @(*) begin
	case(wmaster)
		3'd0: begin
			s_do = m0_di;
			s_sel = m0_sel;
		end
		3'd1: begin
			s_do = m1_di;
			s_sel = m1_sel;
		end
		3'd2: begin
			s_do = m2_di;
			s_sel = m2_sel;
		end
		3'd3: begin
			s_do = m3_di;
			s_sel = m3_sel;
		end
		3'd4: begin
			s_do = m4_di;
			s_sel = m4_sel;
		end
		default: begin // 3'd5
			s_do = m5_di;
			s_sel = m5_sel;
		end
	endcase
end

endmodule
