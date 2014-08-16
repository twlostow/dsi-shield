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

//`include "setup.v"

`define SDRAM_DEPTH 26
`define SDRAM_COLUMNDEPTH 10

module ddram_controller #(
	parameter csr_addr = 4'h0
) (
	input sys_clk,
	input sys_clk_n,
	input sys_rst,
	
	/* Configuration interface */
	input [13:0] csr_a,
	input csr_we,
	input [31:0] csr_di,
	output [31:0] csr_do,
	
	/* FML 4x64 interface */
	input [`SDRAM_DEPTH-1:0] fml_adr,
	input fml_stb,
	input fml_we,
	output fml_eack,
	input [3:0] fml_sel,
	input [31:0] fml_di,
	output [31:0] fml_do,
	
	/* DDRAM pads */
	output sdram_clk_p,
	output sdram_clk_n,
	output sdram_cke,
	output sdram_cs_n,
	output sdram_we_n,
	output sdram_cas_n,
	output sdram_ras_n,
	output [12:0] sdram_adr,
	output [1:0] sdram_ba,
	output [1:0] sdram_dm,
	inout [31:0] sdram_dq,
	inout [1:0] sdram_dqs
);

ODDR2 #(
	.DDR_ALIGNMENT("NONE"),
	.INIT(1'b0),
	.SRTYPE("SYNC")
) clock_forward_p (
	.Q(sdram_clk_p),
	.C0(sys_clk),
	.C1(sys_clk_n),
	.CE(1'b1),
	.D0(1'b1),
	.D1(1'b0),
	.R(1'b0),
	.S(1'b0)
);

ODDR2 #(
	.DDR_ALIGNMENT("NONE"),
	.INIT(1'b0),
	.SRTYPE("SYNC")
) clock_forward_n (
	.Q(sdram_clk_n),
	.C0(sys_clk),
	.C1(sys_clk_n),
	.CE(1'b1),
	.D0(1'b0),
	.D1(1'b1),
	.R(1'b0),
	.S(1'b0)
);

hpdmc #(
	.csr_addr(csr_addr),
	.sdram_depth(`SDRAM_DEPTH),
	.sdram_columndepth(`SDRAM_COLUMNDEPTH)
) hpdmc (
	.sys_clk(sys_clk),
	.sys_clk_n(sys_clk_n),
	.sys_rst(sys_rst),

	.csr_a(csr_a),
	.csr_we(csr_we),
	.csr_di(csr_di),
	.csr_do(csr_do),

	.fml_adr(fml_adr),
	.fml_stb(fml_stb),
	.fml_we(fml_we),
	.fml_eack(fml_eack),
	.fml_sel(fml_sel),
	.fml_di(fml_di),
	.fml_do(fml_do),

	.sdram_cke(sdram_cke),
	.sdram_cs_n(sdram_cs_n),
	.sdram_we_n(sdram_we_n),
	.sdram_cas_n(sdram_cas_n),
	.sdram_ras_n(sdram_ras_n),
	.sdram_dm(sdram_dm),
	.sdram_adr(sdram_adr),
	.sdram_ba(sdram_ba),
	.sdram_dq(sdram_dq),
	.sdram_dqs(sdram_dqs)
);

endmodule
