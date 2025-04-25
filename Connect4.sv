module Connect4 (
	input logic clk,
	input logic rst,
	input logic [2:0] column,
	input logic load_btn,
	input logic select,
	output logic in_column0,
	output logic is0x5empty,
	output logic [1:0] val
);
	
	logic [1:0] mux_out;
	
	logic en0x0, en0x1, en0x2, en0x3, en0x4, en0x5;
	
	logic empty0x0, empty0x1, empty0x2, empty0x3, empty0x4, empty0x5;
	
	logic [1:0] q0x0, q0x1, q0x2, q0x3, q0x4, q0x5;
	
	logic col0, col1, col2, col3, col4, col5, col6;
	
	Mux2to1 SELECTOR (
		.A(2'b01),
		.B(2'b10),
		.S(select),
		.Y(mux_out)
	);
	
	// Modulos para colocar fichas en la columna 0
	
	Comparator #(.N(3)) comp_col0 (
		.A(column),
		.B(3'd0),
		.cmp(col0)
	);
	
	Comparator #(.N(2)) reg0x0_empty (
		.A(q0x0),
		.B(2'b00),
		.cmp(empty0x0)
	);
	
	Comparator #(.N(2)) reg0x1_empty (
		.A(q0x1),
		.B(2'b00),
		.cmp(empty0x1)
	);
	
	Comparator #(.N(2)) reg0x2_empty (
		.A(q0x2),
		.B(2'b00),
		.cmp(empty0x2)
	);
	
	Comparator #(.N(2)) reg0x3_empty (
		.A(q0x3),
		.B(2'b00),
		.cmp(empty0x3)
	);
	
	Comparator #(.N(2)) reg0x4_empty (
		.A(q0x4),
		.B(2'b00),
		.cmp(empty0x4)
	);
	
	Comparator #(.N(2)) reg0x5_empty (
		.A(q0x5),
		.B(2'b00),
		.cmp(empty0x5)
	);
	
	AndGate and0x5 (
		.A(empty0x5),
		.B(1),	// Ultima fila, no necesita verificar nada debajo
		.C(col0),
		.Y(en0x5)
	);
	
	Register pos0x5 (
		.clk(clk),
		.rst(rst),
		.en(en0x5),
		.D(mux_out),
		.Q(q0x5)
	);
	
	assign in_column0 = col0;
	assign is0x5empty = empty0x5;
	assign val = q0x5;
	
endmodule

	