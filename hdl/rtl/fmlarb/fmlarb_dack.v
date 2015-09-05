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

/* 
 * Generate ack signal from early ack signal and mask strobe.
 * After an early acked write, it should pulse after 2 cycles.
 * After an early acked read, it should pulse after CL+3 cycles, that is
 * 5 cycles when tim_cas = 0 (assumed here)
 * 6 cycles when tim_cas = 1
 */

module fmlarb_dack(
	input sys_clk,
	input sys_rst,
	
	input stb,
	input eack,
	input we,

	output stbm,
	output reg ack
);

wire read = eack & ~we;
wire write = eack & we;

reg ack_read2;
reg ack_read1;
reg ack_read0;

always @(posedge sys_clk) begin
	if(sys_rst) begin
		ack_read2 <= 1'b0;
		ack_read1 <= 1'b0;
		ack_read0 <= 1'b0;
	end else begin
		ack_read2 <= read;
		ack_read1 <= ack_read2;
		ack_read0 <= ack_read1;
	end
end

reg ack0;
always @(posedge sys_clk) begin
	if(sys_rst) begin
		ack0 <= 1'b0;
		ack <= 1'b0;
	end else begin
//	   ack0 <= ack_read0;
	   ack <= ack_read0|write;

	end
end

reg mask;
assign stbm = stb & ~mask;

always @(posedge sys_clk) begin
	if(sys_rst)
		mask <= 1'b0;
	else begin
		if(eack)
			mask <= 1'b1;
		if(ack)
			mask <= 1'b0;
	end
end

endmodule
