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
	
	assign col_win = col0_win | col1_win | col2_win | col3_win | col4_win | col5_win | col6_win;
	assign row_win = row0_win | row1_win | row2_win | row3_win | row4_win | row5_win;
	
	assign win = col_win | row_win;
endmodule

