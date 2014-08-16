/*
 * Milkymist SoC
 * Copyright (C) 2007, 2008, 2009, 2011 Sebastien Bourdeauducq
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

module hpdmc_datactl(
	input sys_clk,
	input sdram_rst,

	input read,
	input write,
	input [3:0] concerned_bank,
	output reg read_safe,
	output reg write_safe,
	output [3:0] precharge_safe,

	output reg direction,
	output direction_r,

	input tim_cas,
	input [1:0] tim_wr
);

/*
 * read_safe: whether it is safe to register a Read command
 * into the SDRAM at the next cycle.
 */

reg [2:0] read_safe_counter;
always @(posedge sys_clk) begin
	if(sdram_rst) begin
		read_safe_counter <= 3'd0;
		read_safe <= 1'b1;
	end else begin
		if(read) begin
			read_safe_counter <= 3'd3;
			read_safe <= 1'b0;
		end else if(write) begin
			/* after a write, read is unsafe for 5 cycles (4 transfers + tWTR=1) */
			read_safe_counter <= 3'd5;
			read_safe <= 1'b0;
		end else begin
			if(read_safe_counter == 3'd1)
				read_safe <= 1'b1;
			if(~read_safe)
				read_safe_counter <= read_safe_counter - 3'd1;
		end
	end
end

/*
 * write_safe: whether it is safe to register a Write command
 * into the SDRAM at the next cycle.
 */

reg [2:0] write_safe_counter;
always @(posedge sys_clk) begin
	if(sdram_rst) begin
		write_safe_counter <= 3'd0;
		write_safe <= 1'b1;
	end else begin
		if(read) begin
			write_safe_counter <= {1'b1, tim_cas, ~tim_cas};
			write_safe <= 1'b0;
		end else if(write) begin
			write_safe_counter <= 3'd4;
			write_safe <= 1'b0;
		end else begin
			if(write_safe_counter == 3'd1)
				write_safe <= 1'b1;
			if(~write_safe)
				write_safe_counter <= write_safe_counter - 3'd1;
		end
	end
end

reg [1:0] counter_writedirection;
always @(posedge sys_clk) begin
	if(sdram_rst) begin
		counter_writedirection <= 2'd0;
	end else begin
		if(write)
			counter_writedirection <= 2'd3;
		else if(|counter_writedirection)
			counter_writedirection <= counter_writedirection - 2'd1;
	end
end

reg direction0;
always @(posedge sys_clk) begin
	direction <= ~(write | (|counter_writedirection));
//	direction <= direction0;
end

/* Counters that prevent a busy bank from being precharged */
hpdmc_banktimer banktimer0(
	.sys_clk(sys_clk),
	.sdram_rst(sdram_rst),

	.tim_cas(tim_cas),
	.tim_wr(tim_wr),

	.read(read & concerned_bank[0]),
	.write(write & concerned_bank[0]),
	.precharge_safe(precharge_safe[0])
);
hpdmc_banktimer banktimer1(
	.sys_clk(sys_clk),
	.sdram_rst(sdram_rst),

	.tim_cas(tim_cas),
	.tim_wr(tim_wr),

	.read(read & concerned_bank[1]),
	.write(write & concerned_bank[1]),
	.precharge_safe(precharge_safe[1])
);
hpdmc_banktimer banktimer2(
	.sys_clk(sys_clk),
	.sdram_rst(sdram_rst),

	.tim_cas(tim_cas),
	.tim_wr(tim_wr),

	.read(read & concerned_bank[2]),
	.write(write & concerned_bank[2]),	.precharge_safe(precharge_safe[2])
);
hpdmc_banktimer banktimer3(
	.sys_clk(sys_clk),
	.sdram_rst(sdram_rst),

	.tim_cas(tim_cas),
	.tim_wr(tim_wr),

	.read(read & concerned_bank[3]),
	.write(write & concerned_bank[3]),
	.precharge_safe(precharge_safe[3])
);

endmodule
