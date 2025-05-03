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
	logic ver_win0, ver_win1, ver_win2, ver_win3, ver_win4, ver_win5, ver_win6;
	logic hor_win0, hor_win1, hor_win2, hor_win3, hor_win4, hor_win5;
	logic final_hor_win, final_ver_win;
	
	HorizontalWin row0 (
		.q0(val00),
		.q1(val10),
		.q2(val20),
		.q3(val30),
		.q4(val40),
		.q5(val50),
		.q6(val60),
		.win(hor_win0)
	);
	
	HorizontalWin row1 (
		.q0(val01),
		.q1(val11),
		.q2(val21),
		.q3(val31),
		.q4(val41),
		.q5(val51),
		.q6(val61),
		.win(hor_win1)
	);
	
	HorizontalWin row2 (
		.q0(val02),
		.q1(val12),
		.q2(val22),
		.q3(val32),
		.q4(val42),
		.q5(val52),
		.q6(val62),
		.win(hor_win2)
	);
	
	HorizontalWin row3 (
		.q0(val03),
		.q1(val13),
		.q2(val23),
		.q3(val33),
		.q4(val43),
		.q5(val53),
		.q6(val63),
		.win(hor_win3)
	);
	
	HorizontalWin row4 (
		.q0(val04),
		.q1(val14),
		.q2(val24),
		.q3(val34),
		.q4(val44),
		.q5(val54),
		.q6(val64),
		.win(hor_win4)
	);
	
	HorizontalWin row5 (
		.q0(val05),
		.q1(val15),
		.q2(val25),
		.q3(val35),
		.q4(val45),
		.q5(val55),
		.q6(val65),
		.win(hor_win5)
	);
	
	VerticalWin column0 (
		.q0(val00),
		.q1(val01),
		.q2(val02),
		.q3(val03),
		.q4(val04),
		.q5(val05),
		.win(ver_win0)
	);
	
	VerticalWin column1 (
		.q0(val10),
		.q1(val11),
		.q2(val12),
		.q3(val13),
		.q4(val14),
		.q5(val15),
		.win(ver_win1)
	);
	
	VerticalWin column2 (
		.q0(val20),
		.q1(val21),
		.q2(val22),
		.q3(val23),
		.q4(val24),
		.q5(val25),
		.win(ver_win2)
	);
	
	VerticalWin column3 (
		.q0(val30),
		.q1(val31),
		.q2(val32),
		.q3(val33),
		.q4(val34),
		.q5(val35),
		.win(ver_win3)
	);
	
	VerticalWin column4 (
		.q0(val40),
		.q1(val41),
		.q2(val42),
		.q3(val43),
		.q4(val44),
		.q5(val45),
		.win(ver_win4)
	);
	
	VerticalWin column5 (
		.q0(val50),
		.q1(val51),
		.q2(val52),
		.q3(val53),
		.q4(val54),
		.q5(val55),
		.win(ver_win5)
	);
	
	VerticalWin column6 (
		.q0(val60),
		.q1(val61),
		.q2(val62),
		.q3(val63),
		.q4(val64),
		.q5(val65),
		.win(ver_win6)
	);
	
	assign final_hor_win = hor_win0 | hor_win1 | hor_win2 | hor_win3 | hor_win4 | hor_win5;
	assign final_ver_win = ver_win0 | ver_win1 | ver_win2 | ver_win3 | ver_win4 | ver_win5 | ver_win6;
	
	assign win = final_hor_win | final_ver_win;
	
endmodule

