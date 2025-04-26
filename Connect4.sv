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
	logic empty1x0, empty1x1, empty1x2, empty1x3, empty1x4, empty1x5;
	logic empty2x0, empty2x1, empty2x2, empty2x3, empty2x4, empty2x5;
	logic empty3x0, empty3x1, empty3x2, empty3x3, empty3x4, empty3x5;
	logic empty4x0, empty4x1, empty4x2, empty4x3, empty4x4, empty4x5;
	logic empty5x0, empty5x1, empty5x2, empty5x3, empty5x4, empty5x5;
	logic empty6x0, empty6x1, empty6x2, empty6x3, empty6x4, empty6x5;
	
	logic occupied0x0, occupied0x1, occupied0x2, occupied0x3, occupied0x4, occupied0x5;
	logic occupied1x0, occupied1x1, occupied1x2, occupied1x3, occupied1x4, occupied1x5;
	logic occupied2x0, occupied2x1, occupied2x2, occupied2x3, occupied2x4, occupied2x5;
	logic occupied3x0, occupied3x1, occupied3x2, occupied3x3, occupied3x4, occupied3x5;
	logic occupied4x0, occupied4x1, occupied4x2, occupied4x3, occupied4x4, occupied4x5;
	logic occupied5x0, occupied5x1, occupied5x2, occupied5x3, occupied5x4, occupied5x5;
	logic occupied6x0, occupied6x1, occupied6x2, occupied6x3, occupied6x4, occupied6x5;
	
	logic en0x0, en0x1, en0x2, en0x3, en0x4, en0x5;
	logic en1x0, en1x1, en1x2, en1x3, en1x4, en1x5;
	logic en2x0, en2x1, en2x2, en2x3, en2x4, en2x5;
	logic en3x0, en3x1, en3x2, en3x3, en3x4, en3x5;
	logic en4x0, en4x1, en4x2, en4x3, en4x4, en4x5;
	logic en5x0, en5x1, en5x2, en5x3, en5x4, en5x5;
	logic en6x0, en6x1, en6x2, en6x3, en6x4, en6x5;
	
	logic [1:0] q0x0, q0x1, q0x2, q0x3, q0x4, q0x5;
	logic [1:0] q1x0, q1x1, q1x2, q1x3, q1x4, q1x5;
	logic [1:0] q2x0, q2x1, q2x2, q2x3, q2x4, q2x5;
	logic [1:0] q3x0, q3x1, q3x2, q3x3, q3x4, q3x5;
	logic [1:0] q4x0, q4x1, q4x2, q4x3, q4x4, q4x5;
	logic [1:0] q5x0, q5x1, q5x2, q5x3, q5x4, q5x5;
	logic [1:0] q6x0, q6x1, q6x2, q6x3, q6x4, q6x5;
	
	Mux2to1 SELECTOR (
		.A(2'b01),	// Value for FPGA player
		.B(2'b10),	// Value for Arduino player
		.S(select),
		.Y(mux_out)
	);
	
	// -------------------- COLUMN 0 MODULES ----------------------------------
	
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
		.B(1),	// BOTTOM ROW, NO NEED TO CHECK FOR TOKEN BELOW.
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
	
	// -------------------- COLUMN 1 MODULES ----------------------------------
	
	Comparator #(.N(3)) comp_col1 (
		.A(column),
		.B(3'd0),
		.cmp(col1)
	);
	
	Comparator #(.N(2)) reg1x0_empty (
		.A(q1x0),
		.B(2'b00),
		.cmp(empty1x0)
	);
	
	Comparator #(.N(2)) reg1x1_empty (
		.A(q1x1),
		.B(2'b00),
		.cmp(empty1x1)
	);
	
	Comparator #(.N(2)) reg1x2_empty (
		.A(q1x2),
		.B(2'b00),
		.cmp(empty1x2)
	);
	
	Comparator #(.N(2)) reg1x3_empty (
		.A(q1x3),
		.B(2'b00),
		.cmp(empty1x3)
	);
	
	Comparator #(.N(2)) reg1x4_empty (
		.A(q1x4),
		.B(2'b00),
		.cmp(empty1x4)
	);
	
	Comparator #(.N(2)) reg1x5_empty (
		.A(q1x5),
		.B(2'b00),
		.cmp(empty1x5)
	);
	
	Inverter inv1x0 (
		.A(empty1x1),
		.Y(occupied1x1)
	);
	
	Inverter inv1x1 (
		.A(empty1x2),
		.Y(occupied1x2)
	);
	
	Inverter inv1x2 (
		.A(empty1x3),
		.Y(occupied1x3)
	);
	
	Inverter inv1x3 (
		.A(empty1x4),
		.Y(occupied1x4)
	);
	
	Inverter inv1x4 (
		.A(empty1x5),
		.Y(occupied1x5)
	);
	
	AndGate and1x0 (
		.A(empty1x0),
		.B(occupied1x1),
		.C(col1),
		.D(load_btn),
		.Y(en1x0)
	);
	
	AndGate and1x1 (
		.A(empty1x1),
		.B(occupied1x2),
		.C(col1),
		.D(load_btn),
		.Y(en1x1)
	);
	
	AndGate and1x2 (
		.A(empty1x2),
		.B(occupied1x3),
		.C(col1),
		.D(load_btn),
		.Y(en1x2)
	);
	
	AndGate and1x3 (
		.A(empty1x3),
		.B(occupied1x4),
		.C(col1),
		.D(load_btn),
		.Y(en1x3)
	);
	
	AndGate and1x4 (
		.A(empty1x4),
		.B(occupied1x5),
		.C(col1),
		.D(load_btn),
		.Y(en1x4)
	);
	
	AndGate and1x5 (
		.A(empty1x5),
		.B(1),	// BOTTOM ROW, NO NEED TO CHECK FOR TOKEN BELOW.
		.C(col1),
		.D(load_btn),
		.Y(en1x5)
	);
	
	Register pos1x0 (
		.clk(clk),
		.rst(rst),
		.en(en1x0),
		.D(mux_out),
		.Q(q1x0)
	);
	
	Register pos1x1 (
		.clk(clk),
		.rst(rst),
		.en(en1x1),
		.D(mux_out),
		.Q(q1x1)
	);
	
	Register pos1x2 (
		.clk(clk),
		.rst(rst),
		.en(en1x2),
		.D(mux_out),
		.Q(q1x2)
	);
	
	Register pos1x3 (
		.clk(clk),
		.rst(rst),
		.en(en1x3),
		.D(mux_out),
		.Q(q1x3)
	);
	
	Register pos1x4 (
		.clk(clk),
		.rst(rst),
		.en(en1x4),
		.D(mux_out),
		.Q(q1x4)
	);
	
	Register pos1x5 (
		.clk(clk),
		.rst(rst),
		.en(en1x5),
		.D(mux_out),
		.Q(q1x5)
	);
	
	// -------------------- COLUMN 2 MODULES ----------------------------------
	
	Comparator #(.N(3)) comp_col2 (
		.A(column),
		.B(3'd0),
		.cmp(col2)
	);
	
	Comparator #(.N(2)) reg2x0_empty (
		.A(q2x0),
		.B(2'b00),
		.cmp(empty2x0)
	);
	
	Comparator #(.N(2)) reg2x1_empty (
		.A(q2x1),
		.B(2'b00),
		.cmp(empty2x1)
	);
	
	Comparator #(.N(2)) reg2x2_empty (
		.A(q2x2),
		.B(2'b00),
		.cmp(empty2x2)
	);
	
	Comparator #(.N(2)) reg2x3_empty (
		.A(q2x3),
		.B(2'b00),
		.cmp(empty2x3)
	);
	
	Comparator #(.N(2)) reg2x4_empty (
		.A(q2x4),
		.B(2'b00),
		.cmp(empty2x4)
	);
	
	Comparator #(.N(2)) reg2x5_empty (
		.A(q2x5),
		.B(2'b00),
		.cmp(empty2x5)
	);
	
	Inverter inv2x0 (
		.A(empty2x1),
		.Y(occupied2x1)
	);
	
	Inverter inv2x1 (
		.A(empty2x2),
		.Y(occupied2x2)
	);
	
	Inverter inv2x2 (
		.A(empty2x3),
		.Y(occupied2x3)
	);
	
	Inverter inv2x3 (
		.A(empty2x4),
		.Y(occupied2x4)
	);
	
	Inverter inv2x4 (
		.A(empty2x5),
		.Y(occupied2x5)
	);
	
	AndGate and2x0 (
		.A(empty2x0),
		.B(occupied2x1),
		.C(col2),
		.D(load_btn),
		.Y(en2x0)
	);
	
	AndGate and2x1 (
		.A(empty2x1),
		.B(occupied2x2),
		.C(col2),
		.D(load_btn),
		.Y(en2x1)
	);
	
	AndGate and2x2 (
		.A(empty2x2),
		.B(occupied2x3),
		.C(col2),
		.D(load_btn),
		.Y(en2x2)
	);
	
	AndGate and2x3 (
		.A(empty2x3),
		.B(occupied2x4),
		.C(col2),
		.D(load_btn),
		.Y(en2x3)
	);
	
	AndGate and2x4 (
		.A(empty2x4),
		.B(occupied2x5),
		.C(col2),
		.D(load_btn),
		.Y(en2x4)
	);
	
	AndGate and2x5 (
		.A(empty2x5),
		.B(1),	// BOTTOM ROW, NO NEED TO CHECK FOR TOKEN BELOW.
		.C(col2),
		.D(load_btn),
		.Y(en2x5)
	);
	
	Register pos2x0 (
		.clk(clk),
		.rst(rst),
		.en(en2x0),
		.D(mux_out),
		.Q(q2x0)
	);
	
	Register pos2x1 (
		.clk(clk),
		.rst(rst),
		.en(en2x1),
		.D(mux_out),
		.Q(q2x1)
	);
	
	Register pos2x2 (
		.clk(clk),
		.rst(rst),
		.en(en2x2),
		.D(mux_out),
		.Q(q2x2)
	);
	
	Register pos2x3 (
		.clk(clk),
		.rst(rst),
		.en(en2x3),
		.D(mux_out),
		.Q(q2x3)
	);
	
	Register pos2x4 (
		.clk(clk),
		.rst(rst),
		.en(en2x4),
		.D(mux_out),
		.Q(q2x4)
	);
	
	Register pos2x5 (
		.clk(clk),
		.rst(rst),
		.en(en2x5),
		.D(mux_out),
		.Q(q2x5)
	);
	
	assign val0 = q1x0;
	assign val1 = q1x1;
	assign val2 = q1x2;
	assign val3 = q1x3;
	assign val4 = q1x4;
	assign val5 = q1x5;
	
endmodule

	