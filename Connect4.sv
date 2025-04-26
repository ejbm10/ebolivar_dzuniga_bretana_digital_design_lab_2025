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
	logic col0, col1, col2, col3, col4, col5, col6;
	
	logic empty0x0, empty0x1, empty0x2, empty0x3, empty0x4, empty0x5;
	logic occupied0x0, occupied0x1, occupied0x2, occupied0x3, occupied0x4, occupied0x5;
	logic en0x0, en0x1, en0x2, en0x3, en0x4, en0x5;
	logic [1:0] q0x0, q0x1, q0x2, q0x3, q0x4, q0x5;
	
	Mux2to1 SELECTOR (
		.A(2'b01),	// Value for FPGA player
		.B(2'b10),	// Value for Arduino player
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
	
	Inverter inv0x0 (
		.A(empty0x1),
		.Y(occupied0x1)
	);
	
	Inverter inv0x1 (
		.A(empty0x2),
		.Y(occupied0x2)
	);
	
	Inverter inv0x2 (
		.A(empty0x3),
		.Y(occupied0x3)
	);
	
	Inverter inv0x3 (
		.A(empty0x4),
		.Y(occupied0x4)
	);
	
	Inverter inv0x4 (
		.A(empty0x5),
		.Y(occupied0x5)
	);
	
	AndGate and0x0 (
		.A(empty0x0),
		.B(occupied0x1),
		.C(col0),
		.D(load_btn),
		.Y(en0x0)
	);
	
	AndGate and0x1 (
		.A(empty0x1),
		.B(occupied0x2),
		.C(col0),
		.D(load_btn),
		.Y(en0x1)
	);
	
	AndGate and0x2 (
		.A(empty0x2),
		.B(occupied0x3),
		.C(col0),
		.D(load_btn),
		.Y(en0x2)
	);
	
	AndGate and0x3 (
		.A(empty0x3),
		.B(occupied0x4),
		.C(col0),
		.D(load_btn),
		.Y(en0x3)
	);
	
	AndGate and0x4 (
		.A(empty0x4),
		.B(occupied0x5),
		.C(col0),
		.D(load_btn),
		.Y(en0x4)
	);
	
	AndGate and0x5 (
		.A(empty0x5),
		.B(1),	// Ultima fila, no necesita verificar nada debajo
		.C(col0),
		.D(load_btn),
		.Y(en0x5)
	);
	
	Register pos0x0 (
		.clk(clk),
		.rst(rst),
		.en(en0x0),
		.D(mux_out),
		.Q(q0x0)
	);
	
	Register pos0x1 (
		.clk(clk),
		.rst(rst),
		.en(en0x1),
		.D(mux_out),
		.Q(q0x1)
	);
	
	Register pos0x2 (
		.clk(clk),
		.rst(rst),
		.en(en0x2),
		.D(mux_out),
		.Q(q0x2)
	);
	
	Register pos0x3 (
		.clk(clk),
		.rst(rst),
		.en(en0x3),
		.D(mux_out),
		.Q(q0x3)
	);
	
	Register pos0x4 (
		.clk(clk),
		.rst(rst),
		.en(en0x4),
		.D(mux_out),
		.Q(q0x4)
	);
	
	Register pos0x5 (
		.clk(clk),
		.rst(rst),
		.en(en0x5),
		.D(mux_out),
		.Q(q0x5)
	);
	
	assign val0 = q0x0;
	assign val1 = q0x1;
	assign val2 = q0x2;
	assign val3 = q0x3;
	assign val4 = q0x4;
	assign val5 = q0x5;
	
endmodule

	