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

module hpdmc_iobuf16 (
	input [15:0] T,
	input [15:0] I,
	output [15:0] O,
	inout [15:0] IO
);

IOBUF iobuf0(
	.T(T[0]),
	.I(I[0]),
	.O(O[0]),
	.IO(IO[0])
);
IOBUF iobuf1(
	.T(T[1]),
	.I(I[1]),
	.O(O[1]),
	.IO(IO[1])
);
IOBUF iobuf2(
	.T(T[2]),
	.I(I[2]),
	.O(O[2]),
	.IO(IO[2])
);
IOBUF iobuf3(
	.T(T[3]),
	.I(I[3]),
	.O(O[3]),
	.IO(IO[3])
);
IOBUF iobuf4(
	.T(T[4]),
	.I(I[4]),
	.O(O[4]),
	.IO(IO[4])
);
IOBUF iobuf5(
	.T(T[5]),
	.I(I[5]),
	.O(O[5]),
	.IO(IO[5])
);
IOBUF iobuf6(
	.T(T[6]),
	.I(I[6]),
	.O(O[6]),
	.IO(IO[6])
);
IOBUF iobuf7(
	.T(T[7]),
	.I(I[7]),
	.O(O[7]),
	.IO(IO[7])
);
IOBUF iobuf8(
	.T(T[8]),
	.I(I[8]),
	.O(O[8]),
	.IO(IO[8])
);
IOBUF iobuf9(
	.T(T[9]),
	.I(I[9]),
	.O(O[9]),
	.IO(IO[9])
);
IOBUF iobuf10(
	.T(T[10]),
	.I(I[10]),
	.O(O[10]),
	.IO(IO[10])
);
IOBUF iobuf11(
	.T(T[11]),
	.I(I[11]),
	.O(O[11]),
	.IO(IO[11])
);
IOBUF iobuf12(
	.T(T[12]),
	.I(I[12]),
	.O(O[12]),
	.IO(IO[12])
);
IOBUF iobuf13(
	.T(T[13]),
	.I(I[13]),
	.O(O[13]),
	.IO(IO[13])
);
IOBUF iobuf14(
	.T(T[14]),
	.I(I[14]),
	.O(O[14]),
	.IO(IO[14])
);
IOBUF iobuf15(
	.T(T[15]),
	.I(I[15]),
	.O(O[15]),
	.IO(IO[15])
);

endmodule
