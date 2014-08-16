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

module hpdmc_obuft4(
	input [1:0] T,
	input [1:0] I,
	output [1:0] O
);

OBUFT obuft0(
	.T(T[0]),
	.I(I[0]),
	.O(O[0])
);
OBUFT obuft1(
	.T(T[1]),
	.I(I[1]),
	.O(O[1])
);

endmodule
