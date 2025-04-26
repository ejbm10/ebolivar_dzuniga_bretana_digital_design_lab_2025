module Connect4 (
	input logic clk,
	input logic rst,
	input logic [2:0] column,
	input logic load_btn,
	input logic player,
	output logic [1:0] val0,
	output logic [1:0] val1,
	output logic [1:0] val2,
	output logic [1:0] val3,
	output logic [1:0] val4,
	output logic [1:0] val5,
	output logic time_out
);
	
	logic [1:0] mux_out;
	logic en_loading;
	logic [28:0] timer;
	
	FSM controller (
		.clk(clk),
		.rst(rst),
		.load(load_btn),
		.en_loading(en_loading)
	);
	
	Mux2to1 selector (
		.A(2'b01),	// Value for FPGA player
		.B(2'b10),	// Value for Arduino player
		.S(player),
		.Y(mux_out)
	);
	
	Counter seconds (
		.clk(clk),
		.rst(rst),
		.en_count(1),
		.count(timer)
	);
	
	Comparator #(.N(29)) check10secs (
		.A(timer),
		.B(29'd499_999_999),
		.cmp(time_out)
	);
	
	Loader loader (
		.clk(clk),
		.rst(rst),
		.column(column),
		.load(en_loading),
		.mux_out(mux_out),
		.val00(val0),
		.val01(val1),
		.val02(val2),
		.val03(val3),
		.val04(val4),
		.val05(val5)
	);
	
endmodule

	