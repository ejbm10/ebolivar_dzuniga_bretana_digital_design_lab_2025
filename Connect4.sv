module Connect4 (
	input logic clk,
	input logic rst,
	input logic [2:0] column,
	input logic load_btn,
	input logic select,
	output logic [1:0] val0,
	output logic [1:0] val1,
	output logic [1:0] val2,
	output logic [1:0] val3,
	output logic [1:0] val4,
	output logic [1:0] val5
);
	
	logic [1:0] mux_out;
	
	logic col0;
	
	Mux2to1 SELECTOR (
		.A(2'b01),	// Value for FPGA player
		.B(2'b10),	// Value for Arduino player
		.S(select),
		.Y(mux_out)
	);
	
	Comparator #(.N(3)) comp_col0 (
		.A(column),
		.B(3'd0),
		.cmp(col0)
	);
	
	ColumnModule column0 (
		.clk(clk),
		.rst(rst),
		.load_btn(load_btn),
		.mux_out(mux_out),
		.en(col0),
		.q0(val0),
		.q1(val1),
		.q2(val2),
		.q3(val3),
		.q4(val4),
		.q5(val5)
	);
	
endmodule

	