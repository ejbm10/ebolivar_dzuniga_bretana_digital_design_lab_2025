module Check4InLine (
	input logic [1:0] q0,
	input logic [1:0] q1,
	input logic [1:0] q2,
	input logic [1:0] q3,
	output logic win
);
	logic cmp1_out, cmp2_out, cmp3_out;
	logic empty, not_empty;
	
	Comparator #(.N(2)) empty1 (
		.A(q0),
		.B(2'b00),
		.cmp(empty)
	);
	
	Inverter inv1 (
		.A(empty),
		.en(1),
		.Y(not_empty)
	);
	
	Comparator #(.N(2)) cmp1 (
		.A(q0),
		.B(q1),
		.cmp(cmp1_out)
	);
	
	Comparator #(.N(2)) cmp2 (
		.A(q1),
		.B(q2),
		.cmp(cmp2_out)
	);
	
	Comparator #(.N(2)) cmp3 (
		.A(q2),
		.B(q3),
		.cmp(cmp3_out)
	);
	
	AndGate and1 (
		.A(cmp1_out),
		.B(cmp2_out),
		.C(cmp3_out),
		.D(not_empty),
		.Y(win)
	);
	
endmodule
