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

module hpdmc_iodelay #(
	parameter ODELAY_VALUE = 30,
                       parameter size = 2,
                       parameter DELAY_SRC = "IO"
) (
	/* pad -> fabric */
	input [size-1:0] IDATAIN,
	output [size-1:0] DATAOUT,
	/* fabric -> pad */
	input [size-1:0] T,
	output [size-1:0] TOUT,
	input [size-1:0] ODATAIN,
	output [size-1:0] DOUT,
	/* control pins */
	input INC,
	input CE,
	input RST,
	input CAL,
	input CLK,
	input IOCLK0,
	input IOCLK1
);

   genvar     i;
   
   generate
      for(i=0;i<size;i=i+1)
        IODELAY2 #(
	           .DELAY_SRC(DELAY_SRC),
	           .IDELAY_TYPE("VARIABLE_FROM_ZERO"),
	           .DATA_RATE("DDR"),
	           .ODELAY_VALUE(ODELAY_VALUE)
                   ) idelay (
	                      .IDATAIN(IDATAIN[i]),
	                     .DATAOUT(DATAOUT[i]),
	                     .T(T[i]),
	                     .TOUT(TOUT[i]),
	                     .ODATAIN(ODATAIN[i]),
	                     .DOUT(DOUT[i]),
	                     
	                     .INC(INC),
	                     .CE(CE),
	                     .RST(RST),
	                     .CLK(CLK),
	                     .IOCLK0(IOCLK0),
	                     .IOCLK1(IOCLK1),
	                     .CAL(CAL)
                             );
   endgenerate
   

endmodule
