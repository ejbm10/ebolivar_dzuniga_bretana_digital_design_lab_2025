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
	
	logic col_win, col0_win, col1_win, col2_win, col3_win, col4_win, col5_win, col6_win;
	logic row_win, row0_win, row1_win, row2_win, row3_win, row4_win, row5_win;
	logic diag_win_pt1, diag1_win, diag2_win, diag3_win, diag4_win, diag5_win, diag6_win, diag7_win, diag8_win, diag9_win, diag10_win, diag11_win, diag12_win;
	
	CheckColumnWin col0 (
		.val0(val00),
		.val1(val01),
		.val2(val02),
		.val3(val03),
		.val4(val04),
		.val5(val05),
		.win(col0_win)
	);
	
	CheckColumnWin col1 (
		.val0(val10),
		.val1(val11),
		.val2(val12),
		.val3(val13),
		.val4(val14),
		.val5(val15),
		.win(col1_win)
	);
	
	CheckColumnWin col2 (
		.val0(val20),
		.val1(val21),
		.val2(val22),
		.val3(val23),
		.val4(val24),
		.val5(val25),
		.win(col2_win)
	);
	
	CheckColumnWin col3 (
		.val0(val30),
		.val1(val31),
		.val2(val32),
		.val3(val33),
		.val4(val34),
		.val5(val35),
		.win(col3_win)
	);
	
	CheckColumnWin col4 (
		.val0(val40),
		.val1(val41),
		.val2(val42),
		.val3(val43),
		.val4(val44),
		.val5(val45),
		.win(col4_win)
	);
	
	CheckColumnWin col5 (
		.val0(val50),
		.val1(val51),
		.val2(val52),
		.val3(val53),
		.val4(val54),
		.val5(val55),
		.win(col5_win)
	);
	
	CheckColumnWin col6 (
		.val0(val60),
		.val1(val61),
		.val2(val62),
		.val3(val63),
		.val4(val64),
		.val5(val65),
		.win(col6_win)
	);
	
	CheckRowWin row0 (
		.val0(val00),
		.val1(val10),
		.val2(val20),
		.val3(val30),
		.val4(val40),
		.val5(val50),
		.val6(val60),
		.win(row0_win)
	);
	
	CheckRowWin row1 (
		.val0(val01),
		.val1(val11),
		.val2(val21),
		.val3(val31),
		.val4(val41),
		.val5(val51),
		.val6(val61),
		.win(row1_win)
	);
	
	CheckRowWin row2 (
		.val0(val02),
		.val1(val12),
		.val2(val22),
		.val3(val32),
		.val4(val42),
		.val5(val52),
		.val6(val62),
		.win(row2_win)
	);
	
	CheckRowWin row3 (
		.val0(val03),
		.val1(val13),
		.val2(val23),
		.val3(val33),
		.val4(val43),
		.val5(val53),
		.val6(val63),
		.win(row3_win)
	);
	
	CheckRowWin row4 (
		.val0(val04),
		.val1(val14),
		.val2(val24),
		.val3(val34),
		.val4(val44),
		.val5(val54),
		.val6(val64),
		.win(row4_win)
	);
	
	CheckRowWin row5 (
		.val0(val05),
		.val1(val15),
		.val2(val25),
		.val3(val35),
		.val4(val45),
		.val5(val55),
		.val6(val65),
		.win(row5_win)
	);
	
	Check4InLine diag1 (
		.q0(val00),
		.q1(val11),
		.q2(val22),
		.q3(val33),
		.win(diag1_win)
	);
	
	Check4InLine diag2 (
		.q0(val10),
		.q1(val21),
		.q2(val32),
		.q3(val43),
		.win(diag2_win)
	);
	
	Check4InLine diag3 (
		.q0(val20),
		.q1(val31),
		.q2(val42),
		.q3(val53),
		.win(diag3_win)
	);
	
	Check4InLine diag4 (
		.q0(val30),
		.q1(val41),
		.q2(val52),
		.q3(val63),
		.win(diag4_win)
	);
	
	Check4InLine diag5 (
		.q0(val01),
		.q1(val12),
		.q2(val23),
		.q3(val34),
		.win(diag5_win)
	);
	
	Check4InLine diag6 (
		.q0(val11),
		.q1(val22),
		.q2(val33),
		.q3(val44),
		.win(diag6_win)
	);
	
	Check4InLine diag7 (
		.q0(val21),
		.q1(val32),
		.q2(val43),
		.q3(val54),
		.win(diag7_win)
	);
	
	Check4InLine diag8 (
		.q0(val31),
		.q1(val42),
		.q2(val53),
		.q3(val64),
		.win(diag8_win)
	);
	
	Check4InLine diag9 (
		.q0(val02),
		.q1(val13),
		.q2(val24),
		.q3(val35),
		.win(diag9_win)
	);
	
	Check4InLine diag10 (
		.q0(val12),
		.q1(val23),
		.q2(val34),
		.q3(val45),
		.win(diag10_win)
	);
	
	Check4InLine diag11 (
		.q0(val22),
		.q1(val33),
		.q2(val44),
		.q3(val55),
		.win(diag11_win)
	);
	
	Check4InLine diag12 (
		.q0(val32),
		.q1(val43),
		.q2(val54),
		.q3(val65),
		.win(diag12_win)
	);
	
	assign diag_win_pt1 = diag1_win | diag2_win | diag3_win | diag4_win | diag5_win | diag6_win | diag7_win | diag8_win | diag9_win | diag10_win | diag11_win | diag12_win;
	assign col_win = col0_win | col1_win | col2_win | col3_win | col4_win | col5_win | col6_win;
	assign row_win = row0_win | row1_win | row2_win | row3_win | row4_win | row5_win;
	
	assign win = col_win | row_win | diag_win_pt1;
endmodule

