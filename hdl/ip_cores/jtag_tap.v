
module jtag_tap(
	output tck,
	output tdi,
	input tdo,
	output capture,
	output shift,
	output e1dr,
	output update,
	output reset
);

// Unfortunately the exit1 state for DR (e1dr) is mising
// We can simulate it by interpretting 'update' as e1dr and delaying 'update'
wire sel;
wire g_capture;
wire g_shift;
wire g_update;
reg update_delay;

assign capture = g_capture & sel;
assign shift = g_shift & sel;
assign e1dr = g_update & sel;
assign update = update_delay;

BSCAN_SPARTAN6 #(
	.JTAG_CHAIN(1)
) bscan (
	.CAPTURE(g_capture),
	.DRCK(tck),
	.RESET(reset),
	.RUNTEST(),
	.SEL(sel),
	.SHIFT(g_shift),
	.TCK(),
	.TDI(tdi),
	.TMS(),
	.UPDATE(g_update),
	.TDO(tdo)
);

always@(posedge tck)
	update_delay <= g_update;

endmodule
