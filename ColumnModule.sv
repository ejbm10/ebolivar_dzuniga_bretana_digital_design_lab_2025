module ColumnModule (
	input logic clk,
	input logic rst,
	input logic load,
	input logic [1:0] mux_out,
	input logic en,
	output logic [1:0] q0,
	output logic [1:0] q1,
	output logic [1:0] q2,
	output logic [1:0] q3,
	output logic [1:0] q4,
	output logic [1:0] q5
);

	logic empty0, empty1, empty2, empty3, empty4, empty5;
	logic occupied0, occupied1, occupied2, occupied3, occupied4, occupied5;
	logic en0, en1, en2, en3, en4, en5;
	
	Comparator #(.N(2)) reg0_empty (
		.A(q0),
		.B(2'b00),
		.cmp(empty0)
	);
	
	Comparator #(.N(2)) reg1_empty (
		.A(q1),
		.B(2'b00),
		.cmp(empty1)
	);
	
	Comparator #(.N(2)) reg2_empty (
		.A(q2),
		.B(2'b00),
		.cmp(empty2)
	);
	
	Comparator #(.N(2)) reg3_empty (
		.A(q3),
		.B(2'b00),
		.cmp(empty3)
	);
	
	Comparator #(.N(2)) reg4_empty (
		.A(q4),
		.B(2'b00),
		.cmp(empty4)
	);
	
	Comparator #(.N(2)) reg5_empty (
		.A(q5),
		.B(2'b00),
		.cmp(empty5)
	);
	
	Inverter inv0 (
		.A(empty1),
		.Y(occupied1)
	);
	
	Inverter inv1 (
		.A(empty2),
		.Y(occupied2)
	);
	
	Inverter inv2 (
		.A(empty3),
		.Y(occupied3)
	);
	
	Inverter inv3 (
		.A(empty4),
		.Y(occupied4)
	);
	
	Inverter inv4 (
		.A(empty5),
		.Y(occupied5)
	);
	
	AndGate and0 (
		.A(empty0),
		.B(occupied1),
		.C(en),
		.D(load),
		.Y(en0)
	);
	
	AndGate and1 (
		.A(empty1),
		.B(occupied2),
		.C(en),
		.D(load),
		.Y(en1)
	);
	
	AndGate and2 (
		.A(empty2),
		.B(occupied3),
		.C(en),
		.D(load),
		.Y(en2)
	);
	
	AndGate and3 (
		.A(empty3),
		.B(occupied4),
		.C(en),
		.D(load),
		.Y(en3)
	);
	
	AndGate and4 (
		.A(empty4),
		.B(occupied5),
		.C(en),
		.D(load),
		.Y(en4)
	);
	
	AndGate and5 (
		.A(empty5),
		.B(1),	// BOTTOM ROW, NO NEED TO CHECK FOR TOKEN BELOW.
		.C(en),
		.D(load),
		.Y(en5)
	);
	
	Register pos0 (
		.clk(clk),
		.rst(rst),
		.en(en0),
		.D(mux_out),
		.Q(q0)
	);
	
	Register pos1 (
		.clk(clk),
		.rst(rst),
		.en(en1),
		.D(mux_out),
		.Q(q1)
	);
	
	Register pos2 (
		.clk(clk),
		.rst(rst),
		.en(en2),
		.D(mux_out),
		.Q(q2)
	);
	
	Register pos3 (
		.clk(clk),
		.rst(rst),
		.en(en3),
		.D(mux_out),
		.Q(q3)
	);
	
	Register pos4 (
		.clk(clk),
		.rst(rst),
		.en(en4),
		.D(mux_out),
		.Q(q4)
	);
	
	Register pos5 (
		.clk(clk),
		.rst(rst),
		.en(en5),
		.D(mux_out),
		.Q(q5)
	);
	
endmodule
