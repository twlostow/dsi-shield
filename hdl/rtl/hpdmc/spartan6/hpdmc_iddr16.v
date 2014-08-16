/*
 * Milkymist VJ SoC
 * Copyright (C) 2007, 2008, 2009 Sebastien Bourdeauducq
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

/*
 * Verilog code that really should be replaced with a generate
 * statement, but it does not work with some free simulators.
 * So I put it in a module so as not to make other code unreadable,
 * and keep compatibility with as many simulators as possible.
 */

module hpdmc_iddr16 #(
	parameter DDR_ALIGNMENT = "C0",
	parameter INIT_Q0 = 1'b0,
	parameter INIT_Q1 = 1'b0,
	parameter SRTYPE = "ASYNC"
) (
	output [15:0] Q0,
	output [15:0] Q1,
	input C0,
	input C1,
	input CE,
	input [15:0] D,
	input R,
	input S
);

IDDR2 #(
	.DDR_ALIGNMENT(DDR_ALIGNMENT),
	.INIT_Q0(INIT_Q0),
	.INIT_Q1(INIT_Q1),
	.SRTYPE(SRTYPE)
) iddr0 (
	.Q0(Q0[0]),
	.Q1(Q1[0]),
	.C0(C0),
	.C1(C1),
	.CE(CE),
	.D(D[0]),
	.R(R),
	.S(S)
);
IDDR2 #(
	.DDR_ALIGNMENT(DDR_ALIGNMENT),
	.INIT_Q0(INIT_Q0),
	.INIT_Q1(INIT_Q1),
	.SRTYPE(SRTYPE)
) iddr1 (
	.Q0(Q0[1]),
	.Q1(Q1[1]),
	.C0(C0),
	.C1(C1),
	.CE(CE),
	.D(D[1]),
	.R(R),
	.S(S)
);
IDDR2 #(
	.DDR_ALIGNMENT(DDR_ALIGNMENT),
	.INIT_Q0(INIT_Q0),
	.INIT_Q1(INIT_Q1),
	.SRTYPE(SRTYPE)
) iddr2 (
	.Q0(Q0[2]),
	.Q1(Q1[2]),
	.C0(C0),
	.C1(C1),
	.CE(CE),
	.D(D[2]),
	.R(R),
	.S(S)
);
IDDR2 #(
	.DDR_ALIGNMENT(DDR_ALIGNMENT),
	.INIT_Q0(INIT_Q0),
	.INIT_Q1(INIT_Q1),
	.SRTYPE(SRTYPE)
) iddr3 (
	.Q0(Q0[3]),
	.Q1(Q1[3]),
	.C0(C0),
	.C1(C1),
	.CE(CE),
	.D(D[3]),
	.R(R),
	.S(S)
);
IDDR2 #(
	.DDR_ALIGNMENT(DDR_ALIGNMENT),
	.INIT_Q0(INIT_Q0),
	.INIT_Q1(INIT_Q1),
	.SRTYPE(SRTYPE)
) iddr4 (
	.Q0(Q0[4]),
	.Q1(Q1[4]),
	.C0(C0),
	.C1(C1),
	.CE(CE),
	.D(D[4]),
	.R(R),
	.S(S)
);
IDDR2 #(
	.DDR_ALIGNMENT(DDR_ALIGNMENT),
	.INIT_Q0(INIT_Q0),
	.INIT_Q1(INIT_Q1),
	.SRTYPE(SRTYPE)
) iddr5 (
	.Q0(Q0[5]),
	.Q1(Q1[5]),
	.C0(C0),
	.C1(C1),
	.CE(CE),
	.D(D[5]),
	.R(R),
	.S(S)
);
IDDR2 #(
	.DDR_ALIGNMENT(DDR_ALIGNMENT),
	.INIT_Q0(INIT_Q0),
	.INIT_Q1(INIT_Q1),
	.SRTYPE(SRTYPE)
) iddr6 (
	.Q0(Q0[6]),
	.Q1(Q1[6]),
	.C0(C0),
	.C1(C1),
	.CE(CE),
	.D(D[6]),
	.R(R),
	.S(S)
);
IDDR2 #(
	.DDR_ALIGNMENT(DDR_ALIGNMENT),
	.INIT_Q0(INIT_Q0),
	.INIT_Q1(INIT_Q1),
	.SRTYPE(SRTYPE)
) iddr7 (
	.Q0(Q0[7]),
	.Q1(Q1[7]),
	.C0(C0),
	.C1(C1),
	.CE(CE),
	.D(D[7]),
	.R(R),
	.S(S)
);
IDDR2 #(
	.DDR_ALIGNMENT(DDR_ALIGNMENT),
	.INIT_Q0(INIT_Q0),
	.INIT_Q1(INIT_Q1),
	.SRTYPE(SRTYPE)
) iddr8 (
	.Q0(Q0[8]),
	.Q1(Q1[8]),
	.C0(C0),
	.C1(C1),
	.CE(CE),
	.D(D[8]),
	.R(R),
	.S(S)
);
IDDR2 #(
	.DDR_ALIGNMENT(DDR_ALIGNMENT),
	.INIT_Q0(INIT_Q0),
	.INIT_Q1(INIT_Q1),
	.SRTYPE(SRTYPE)
) iddr9 (
	.Q0(Q0[9]),
	.Q1(Q1[9]),
	.C0(C0),
	.C1(C1),
	.CE(CE),
	.D(D[9]),
	.R(R),
	.S(S)
);
IDDR2 #(
	.DDR_ALIGNMENT(DDR_ALIGNMENT),
	.INIT_Q0(INIT_Q0),
	.INIT_Q1(INIT_Q1),
	.SRTYPE(SRTYPE)
) iddr10 (
	.Q0(Q0[10]),
	.Q1(Q1[10]),
	.C0(C0),
	.C1(C1),
	.CE(CE),
	.D(D[10]),
	.R(R),
	.S(S)
);
IDDR2 #(
	.DDR_ALIGNMENT(DDR_ALIGNMENT),
	.INIT_Q0(INIT_Q0),
	.INIT_Q1(INIT_Q1),
	.SRTYPE(SRTYPE)
) iddr11 (
	.Q0(Q0[11]),
	.Q1(Q1[11]),
	.C0(C0),
	.C1(C1),
	.CE(CE),
	.D(D[11]),
	.R(R),
	.S(S)
);
IDDR2 #(
	.DDR_ALIGNMENT(DDR_ALIGNMENT),
	.INIT_Q0(INIT_Q0),
	.INIT_Q1(INIT_Q1),
	.SRTYPE(SRTYPE)
) iddr12 (
	.Q0(Q0[12]),
	.Q1(Q1[12]),
	.C0(C0),
	.C1(C1),
	.CE(CE),
	.D(D[12]),
	.R(R),
	.S(S)
);
IDDR2 #(
	.DDR_ALIGNMENT(DDR_ALIGNMENT),
	.INIT_Q0(INIT_Q0),
	.INIT_Q1(INIT_Q1),
	.SRTYPE(SRTYPE)
) iddr13 (
	.Q0(Q0[13]),
	.Q1(Q1[13]),
	.C0(C0),
	.C1(C1),
	.CE(CE),
	.D(D[13]),
	.R(R),
	.S(S)
);
IDDR2 #(
	.DDR_ALIGNMENT(DDR_ALIGNMENT),
	.INIT_Q0(INIT_Q0),
	.INIT_Q1(INIT_Q1),
	.SRTYPE(SRTYPE)
) iddr14 (
	.Q0(Q0[14]),
	.Q1(Q1[14]),
	.C0(C0),
	.C1(C1),
	.CE(CE),
	.D(D[14]),
	.R(R),
	.S(S)
);
IDDR2 #(
	.DDR_ALIGNMENT(DDR_ALIGNMENT),
	.INIT_Q0(INIT_Q0),
	.INIT_Q1(INIT_Q1),
	.SRTYPE(SRTYPE)
) iddr15 (
	.Q0(Q0[15]),
	.Q1(Q1[15]),
	.C0(C0),
	.C1(C1),
	.CE(CE),
	.D(D[15]),
	.R(R),
	.S(S)
);

endmodule
