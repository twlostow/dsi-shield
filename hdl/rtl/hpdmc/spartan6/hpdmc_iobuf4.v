/*
 * Milkymist SoC
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

module hpdmc_iobuf4(
	input [3:0] T,
	input [3:0] I,
	output [3:0] O,
	inout [3:0] IO
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

endmodule
