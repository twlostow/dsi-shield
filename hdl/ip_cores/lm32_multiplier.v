/*
 * Milkymist VJ SoC
 * Copyright (C) 2007, 2008, 2009, 2010 Sebastien Bourdeauducq
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

module lm32_multiplier(
	input clk_i,
	input rst_i,
	input stall_x,
	input stall_m,
	input [31:0] operand_0,
	input [31:0] operand_1,
	output [31:0] result
);

// See UG389, esp. p. 29 "Fully Pipelined, 35 x 35 Multiplier Use Model (Large Multiplier)"

wire [17:0] au = {3'd0, operand_0[31:17]};
wire [17:0] al = {1'b0, operand_0[16:0]};
wire [17:0] bu = {3'd0, operand_1[31:17]};
wire [17:0] bl = {1'b0, operand_1[16:0]};

wire [17:0] bl_forward;
wire [35:0] al_bl;

reg [16:0] result_low;
always @(posedge clk_i) begin
	if(rst_i)
		result_low <= 17'd0;
	else
		result_low <= al_bl[16:0];
end
assign result[16:0] = result_low;

DSP48A1 #(
	.A0REG(1),
	.A1REG(0),
	.B0REG(1),
	.B1REG(0),
	.CARRYINREG(0),
	.CARRYINSEL("OPMODE5"),
	.CARRYOUTREG(0),
	.CREG(0),
	.DREG(0),
	.MREG(1),
	.OPMODEREG(0),
	.PREG(0),
	.RSTTYPE("SYNC")
) D1 (
	.BCOUT(bl_forward),
	.PCOUT(),
	.CARRYOUT(),
	.CARRYOUTF(),
	.M(al_bl),
	.P(),
	.PCIN(),
	.CLK(clk_i),
	.OPMODE(8'd1),
	.A(al),
	.B(bl),
	.C(48'h0),
	.CARRYIN(),
	.D(18'b0),
	.CEA(~stall_x),
	.CEB(~stall_x),
	.CEC(1'b0),
	.CECARRYIN(1'b0),
	.CED(1'b0),
	.CEM(~stall_m),
	.CEOPMODE(1'b0),
	.CEP(1'b1),
	.RSTA(rst_i),
	.RSTB(rst_i),
	.RSTC(1'b0),
	.RSTCARRYIN(1'b0),
	.RSTD(1'b0),
	.RSTM(rst_i),
	.RSTOPMODE(1'b0),
	.RSTP(1'b0)
);

wire [47:0] au_bl_sum;

DSP48A1 #(
	.A0REG(1),
	.A1REG(0),
	.B0REG(0),
	.B1REG(0),
	.CARRYINREG(0),
	.CARRYINSEL("OPMODE5"),
	.CARRYOUTREG(0),
	.CREG(0),
	.DREG(0),
	.MREG(1),
	.OPMODEREG(0),
	.PREG(0),
	.RSTTYPE("SYNC")
) D2 (
	.BCOUT(),
	.PCOUT(au_bl_sum),
	.CARRYOUT(),
	.CARRYOUTF(),
	.M(),
	.P(),
	.PCIN(),
	.CLK(clk_i),
	.OPMODE(8'd13),
	.A(au),
	.B(bl_forward),
	.C({31'd0, al_bl[33:17]}),
	.CARRYIN(),
	.D(18'h0),
	.CEA(~stall_x),
	.CEB(1'b0),
	.CEC(1'b0),
	.CECARRYIN(1'b0),
	.CED(1'b0),
	.CEM(~stall_m),
	.CEOPMODE(1'b0),
	.CEP(1'b0),
	.RSTA(rst_i),
	.RSTB(1'b0),
	.RSTC(1'b0),
	.RSTCARRYIN(1'b0),
	.RSTD(1'b0),
	.RSTM(rst_i),
	.RSTOPMODE(1'b0),
	.RSTP(1'b0)
);

wire [47:0] r_full;
assign result[31:17] = r_full[16:0];

DSP48A1 #(
	.A0REG(1),
	.A1REG(0),
	.B0REG(1),
	.B1REG(0),
	.CARRYINREG(0),
	.CARRYINSEL("OPMODE5"),
	.CARRYOUTREG(0),
	.CREG(0),
	.DREG(0),
	.MREG(1),
	.OPMODEREG(0),
	.PREG(1),
	.RSTTYPE("SYNC")
) D3 (
	.BCOUT(),
	.PCOUT(),
	.CARRYOUT(),
	.CARRYOUTF(),
	.M(),
	.P(r_full),
	.PCIN(au_bl_sum),
	.CLK(clk_i),
	.OPMODE(8'd5),
	.A(bu),
	.B(al),
	.C(48'b0),
	.CARRYIN(),
	.D(18'b0),
	.CEA(~stall_x),
	.CEB(~stall_x),
	.CEC(1'b0),
	.CECARRYIN(1'b0),
	.CED(1'b0),
	.CEM(~stall_m),
	.CEOPMODE(1'b0),
	.CEP(1'b1),
	.RSTA(rst_i),
	.RSTB(rst_i),
	.RSTC(1'b0),
	.RSTCARRYIN(1'b0),
	.RSTD(1'b0),
	.RSTM(rst_i),
	.RSTOPMODE(1'b0),
	.RSTP(rst_i)
);

endmodule
