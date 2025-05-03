module Loader (
	input logic clk,
	input logic rst,
	input logic current_player,
	input logic [2:0] jugada1, jugada2,
	input logic load,
	input logic [1:0] mux_out,
	output logic [1:0] val00, val01, val02, val03, val04, val05,
	output logic [1:0] val10, val11, val12, val13, val14, val15,
	output logic [1:0] val20, val21, val22, val23, val24, val25,
	output logic [1:0] val30, val31, val32, val33, val34, val35,
	output logic [1:0] val40, val41, val42, val43, val44, val45,
	output logic [1:0] val50, val51, val52, val53, val54, val55,
	output logic [1:0] val60, val61, val62, val63, val64, val65
);

	logic col0, col1, col2, col3, col4, col5, col6;
	logic [2:0] column;
	
	Mux2to1 #(.N(3)) select_player (
		.A(jugada1),
		.B(jugada2),
		.S(current_player),
		.Y(column)
	);
	
	Comparator #(.N(3)) comp_col0 (
		.A(column),
		.B(3'd0),
		.cmp(col0)
	);
	
	Comparator #(.N(3)) comp_col1 (
		.A(column),
		.B(3'd1),
		.cmp(col1)
	);
	
	Comparator #(.N(3)) comp_col2 (
		.A(column),
		.B(3'd2),
		.cmp(col2)
	);
	
	Comparator #(.N(3)) comp_col3 (
		.A(column),
		.B(3'd3),
		.cmp(col3)
	);
	
	Comparator #(.N(3)) comp_col4 (
		.A(column),
		.B(3'd4),
		.cmp(col4)
	);
	
	Comparator #(.N(3)) comp_col5 (
		.A(column),
		.B(3'd5),
		.cmp(col5)
	);
	
	Comparator #(.N(3)) comp_col6 (
		.A(column),
		.B(3'd6),
		.cmp(col6)
	);
	
	ColumnModule column0 (
		.clk(clk),
		.rst(rst),
		.load(load),
		.mux_out(mux_out),
		.en(col0),
		.q0(val00),
		.q1(val01),
		.q2(val02),
		.q3(val03),
		.q4(val04),
		.q5(val05)
	);
	
	ColumnModule column1 (
		.clk(clk),
		.rst(rst),
		.load(load),
		.mux_out(mux_out),
		.en(col1),
		.q0(val10),
		.q1(val11),
		.q2(val12),
		.q3(val13),
		.q4(val14),
		.q5(val15)
	);
	
	ColumnModule column2 (
		.clk(clk),
		.rst(rst),
		.load(load),
		.mux_out(mux_out),
		.en(col2),
		.q0(val20),
		.q1(val21),
		.q2(val22),
		.q3(val23),
		.q4(val24),
		.q5(val25)
	);
	
	ColumnModule column3 (
		.clk(clk),
		.rst(rst),
		.load(load),
		.mux_out(mux_out),
		.en(col3),
		.q0(val30),
		.q1(val31),
		.q2(val32),
		.q3(val33),
		.q4(val34),
		.q5(val35)
	);
	
	ColumnModule column4 (
		.clk(clk),
		.rst(rst),
		.load(load),
		.mux_out(mux_out),
		.en(col4),
		.q0(val40),
		.q1(val41),
		.q2(val42),
		.q3(val43),
		.q4(val44),
		.q5(val45)
	);
	
	ColumnModule column5 (
		.clk(clk),
		.rst(rst),
		.load(load),
		.mux_out(mux_out),
		.en(col5),
		.q0(val50),
		.q1(val51),
		.q2(val52),
		.q3(val53),
		.q4(val54),
		.q5(val55)
	);
	
	ColumnModule column6 (
		.clk(clk),
		.rst(rst),
		.load(load),
		.mux_out(mux_out),
		.en(col6),
		.q0(val60),
		.q1(val61),
		.q2(val62),
		.q3(val63),
		.q4(val64),
		.q5(val65)
	);
	
endmodule
