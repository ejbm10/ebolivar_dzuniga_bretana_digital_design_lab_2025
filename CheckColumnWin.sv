module CheckColumnWin (
	input logic [1:0] val0,
	input logic [1:0] val1,
	input logic [1:0] val2,
	input logic [1:0] val3,
	input logic [1:0] val4,
	input logic [1:0] val5,
	output logic win
);
	
	logic win1, win2, win3;
	
	Check4InLine op1 (
		.q0(val0),
		.q1(val1),
		.q2(val2),
		.q3(val3),
		.win(win1)
	);
	
	Check4InLine op2 (
		.q0(val1),
		.q1(val2),
		.q2(val3),
		.q3(val4),
		.win(win2)
	);
	
	Check4InLine op3 (
		.q0(val2),
		.q1(val3),
		.q2(val4),
		.q3(val5),
		.win(win3)
	);
	
	assign win = win1 | win2 | win3;
	
endmodule
