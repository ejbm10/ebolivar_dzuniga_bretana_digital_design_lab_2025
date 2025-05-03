module VictoryValidator (
	input logic [1:0] val00, val01, val02, val03, val04, val05,
	input logic [1:0] val10, val11, val12, val13, val14, val15,
	input logic [1:0] val20, val21, val22, val23, val24, val25,
	input logic [1:0] val30, val31, val32, val33, val34, val35,
	input logic [1:0] val40, val41, val42, val43, val44, val45,
	input logic [1:0] val50, val51, val52, val53, val54, val55,
	input logic [1:0] val60, val61, val62, val63, val64, val65,
	output logic win
);
	
	logic col0_win, col0_win1, col0_win2, col0_win3;
	
	Check4InLine op1_column0 (
		.q0(val00),
		.q1(val01),
		.q2(val02),
		.q3(val03),
		.win(col0_win1)
	);
	
	Check4InLine op2_column0 (
		.q0(val01),
		.q1(val02),
		.q2(val03),
		.q3(val04),
		.win(col0_win2)
	);
	
	Check4InLine op3_column0 (
		.q0(val02),
		.q1(val03),
		.q2(val04),
		.q3(val05),
		.win(col0_win3)
	);
	
	assign win = col0_win1 | col0_win2 | col0_win3;
	
endmodule

