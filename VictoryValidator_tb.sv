module VictoryValidator_tb();
	
	logic [1:0] val00, val01, val02, val03, val04, val05;
	logic [1:0] val10, val11, val12, val13, val14, val15;
	logic [1:0] val20, val21, val22, val23, val24, val25;
	logic [1:0] val30, val31, val32, val33, val34, val35;
	logic [1:0] val40, val41, val42, val43, val44, val45;
	logic [1:0] val50, val51, val52, val53, val54, val55;
	logic [1:0] val60, val61, val62, val63, val64, val65;
	logic win;
	
	VictoryValidator dut (
		.val00(val00),
		.val01(val01),
		.val02(val02), 
		.val03(val03),
		.val04(val04),
		.val05(val05),
		.val10(val10), 
		.val11(val11), 
		.val12(val12), 
		.val13(val13), 
		.val14(val14), 
		.val15(val15),
		.val20(val20), 
		.val21(val21), 
		.val22(val22), 
		.val23(val23), 
		.val24(val24), 
		.val25(val25),
		.val30(val30), 
		.val31(val31), 
		.val32(val32), 
		.val33(val33), 
		.val34(val34), 
		.val35(val35),
		.val40(val40), 
		.val41(val41), 
		.val42(val42), 
		.val43(val43), 
		.val44(val44), 
		.val45(val45),
		.val50(val50),
		.val51(val51), 
		.val52(val52), 
		.val53(val53), 
		.val54(val54), 
		.val55(val55),
		.val60(val60), 
		.val61(val61), 
		.val62(val62), 
		.val63(val63), 
		.val64(val64), 
		.val65(val65),
		.win(win)
	);
	
	initial begin
		// Set all values to zero (initial state)
		val00 = 2'd0;
		val01 = 2'd0;
		val02 = 2'd0;
		val03 = 2'd0;
		val04 = 2'd0;
		val05 = 2'd0;
		
		val10 = 2'd0;
		val11 = 2'd0;
		val12 = 2'd0;
		val13 = 2'd0;
		val14 = 2'd0;
		val15 = 2'd0;
		
		val20 = 2'd0;
		val21 = 2'd0;
		val22 = 2'd0;
		val23 = 2'd0;
		val24 = 2'd0;
		val25 = 2'd0;
		
		val30 = 2'd0;
		val31 = 2'd0;
		val32 = 2'd0;
		val33 = 2'd0;
		val34 = 2'd0;
		val35 = 2'd0;
		
		val40 = 2'd0;
		val41 = 2'd0;
		val42 = 2'd0;
		val43 = 2'd0;
		val44 = 2'd0;
		val45 = 2'd0;
		
		val50 = 2'd0;
		val51 = 2'd0;
		val52 = 2'd0;
		val53 = 2'd0;
		val54 = 2'd0;
		val55 = 2'd0;
		
		val60 = 2'd0;
		val61 = 2'd0;
		val62 = 2'd0;
		val63 = 2'd0;
		val64 = 2'd0;
		val65 = 2'd0;
		
		// Check horizontal wins
		
		// Horizontal win on line 0
		val00 = 2'd1;
		val10 = 2'd1;
		val20 = 2'd1;
		val30 = 2'd1;
		#100;
		val00 = 2'd0;
		val10 = 2'd0;
		val20 = 2'd0;
		val30 = 2'd0;
		#100;
		
		// Horizontal win on line 2
		val12 = 2'd1;
		val22 = 2'd1;
		val32 = 2'd1;
		val42 = 2'd1;
		#100;
		val12 = 2'd0;
		val22 = 2'd0;
		val32 = 2'd0;
		val42 = 2'd0;
		#100;
		
		// Horizontal win on line 5
		val25 = 2'd1;
		val35 = 2'd1;
		val45 = 2'd1;
		val55 = 2'd1;
		#100;
		val25 = 2'd0;
		val35 = 2'd0;
		val45 = 2'd0;
		val55 = 2'd0;
		#100;
		
		// Vertical win on column 3
		val32 = 2'd1;
		val33 = 2'd1;
		val34 = 2'd1;
		val35 = 2'd1;
		#100;
		val32 = 2'd0;
		val33 = 2'd0;
		val34 = 2'd0;
		val35 = 2'd0;
		#100;
		
		// Vertical win on column 6
		val61 = 2'd1;
		val62 = 2'd1;
		val63 = 2'd1;
		val64 = 2'd1;
		val65 = 2'd2;	// Different value below, still 4 above
		#100;
		val61 = 2'd0;
		val62 = 2'd0;
		val63 = 2'd0;
		val64 = 2'd0;
		val65 = 2'd0;
		#100;
		
		//Diagonal win 1
		val00 = 2'd2;
		val11 = 2'd2;
		val22 = 2'd2;
		val33 = 2'd2;
		#100;
		val00 = 2'd0;
		val11 = 2'd0;
		val22 = 2'd0;
		val33 = 2'd0;
		#100;
		// Diagonal win 2
		val61 = 2'd2;
		val52 = 2'd2;
		val43 = 2'd2;
		val34 = 2'd2;
		#100;
		val61 = 2'd0;
		val52 = 2'd0;
		val43 = 2'd0;
		val34 = 2'd0;
		#100;
	end
endmodule
