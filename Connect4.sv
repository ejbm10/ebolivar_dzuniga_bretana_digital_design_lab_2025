module Connect4 (
	input logic clk,
	input logic rst,
	input logic [2:0] column,
	input logic load_btn,
	input logic turn
);
	
	logic [1:0] mux_out;
	
	FSM Controller (
		.clk(clk),
		.rst(rst),
		.select(turn),
		.load(load_btn),
		.time_out(0),
		.win(0),
		.full(0)
	);
	
	Mux2to1 Selector (
		.A(2'b01),	// Value for FPGA player
		.B(2'b10),	// Value for Arduino player
		.S(turn),
		.Y(mux_out)
	);
	
	Loader loader (
		.clk(clk),
		.rst(rst),
		.column(column),
		.load_btn(load_btn),
		.mux_out(mux_out)
	);
	
endmodule

	