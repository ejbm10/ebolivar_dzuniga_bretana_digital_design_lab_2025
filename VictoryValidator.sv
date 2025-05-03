module VictoryValidator (
	input logic [1:0] q0,
	input logic [1:0] q1,
	input logic [1:0] q2,
	input logic [1:0] q3,
	input logic [1:0] q4,
	input logic [1:0] q5,
	output logic win
);
	logic is_empty1, is_empty2, is_empty3;
	logic not_empty1, not_empty2, not_empty3;
	logic cmp1_out, cmp2_out, cmp3_out, cmp4_out, cmp5_out;
	logic win1_out, win2_out, win3_out;
	
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
	
	Comparator #(.N(2)) cmp4 (
		.A(q3),
		.B(q4),
		.cmp(cmp4_out)
	);
	
	Comparator #(.N(2)) cmp5 (
		.A(q4),
		.B(q5),
		.cmp(cmp5_out)
	);
	
	Comparator #(.N(2)) not_empty_cmp1 (
    .A(q1),
    .B(2'b00),
    .cmp(is_empty1)
	);

	Inverter inv1 (
		 .A(is_empty1),
		 .en(1),
		 .Y(not_empty1)
	);

	AndGate possible_win_1 (
		.A(cmp1_out),
		.B(cmp2_out),
		.C(cmp3_out),
		.D(not_empty1),
		.Y(win1_out)
	);
	
	Comparator #(.N(2)) not_empty_cmp2 (
    .A(q2),
    .B(2'b00),
    .cmp(is_empty2)
	);

	Inverter inv2 (
		 .A(is_empty2),
		 .en(1),
		 .Y(not_empty2)
	);
	
	AndGate possible_win_2 (
		.A(cmp2_out),
		.B(cmp3_out),
		.C(cmp4_out),
		.D(not_empty2),
		.Y(win2_out)
	);
	
	Comparator #(.N(2)) not_empty_cmp3 (
    .A(q3),
    .B(2'b00),
    .cmp(is_empty3)
	);

	Inverter inv3 (
		 .A(is_empty3),
		 .en(1),
		 .Y(not_empty3)
	);
	
	AndGate possible_win_3 (
		.A(cmp3_out),
		.B(cmp4_out),
		.C(cmp5_out),
		.D(not_empty3),
		.Y(win3_out)
	);
	
	OrGate or1 (
		.A(win1_out),
		.B(win2_out),
		.C(win3_out),
		.Y(win)
	);
	
endmodule
