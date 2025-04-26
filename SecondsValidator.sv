module SecondsValidator (
	input logic clk,
	input logic rst,
	output logic [28:0] timer,
	output logic t_out,
	output logic [3:0] secs
);
	
	logic one_sec1, one_sec2, one_sec3, one_sec4, one_sec5, one_sec6, one_sec7, one_sec8, one_sec9;
	
	Counter cycles (
		.clk(clk),
		.rst(rst | rst_timer),
		.en_count(1),
		.count(timer)
	);
	
	Counter seconds (
		.clk(clk),
		.rst(rst | rst_timer),
		.en_count(one_sec1 | one_sec2 | one_sec3 | one_sec4 | one_sec5 | one_sec6 | one_sec7 | one_sec8 | one_sec9),
		.count(secs)
	);
	
	Comparator #(.N(26)) check_1_sec (
		.A(timer),
		.B(26'd5),
		.cmp(one_sec1)
	);
	
	Comparator #(.N(26)) check_2_secs (
		.A(timer),
		.B(26'd10),
		.cmp(one_sec2)
	);
	
	Comparator #(.N(26)) check_3_secs (
		.A(timer),
		.B(26'd15),
		.cmp(one_sec3)
	);
	
	Comparator #(.N(26)) check_4_secs (
		.A(timer),
		.B(26'd20),
		.cmp(one_sec4)
	);
	
	Comparator #(.N(26)) check_5_secs (
		.A(timer),
		.B(26'd25),
		.cmp(one_sec5)
	);
	
	Comparator #(.N(26)) check_6_secs (
		.A(timer),
		.B(26'd30),
		.cmp(one_sec6)
	);
	
	Comparator #(.N(26)) check_7_secs (
		.A(timer),
		.B(26'd35),
		.cmp(one_sec7)
	);
	
	Comparator #(.N(26)) check_8_secs (
		.A(timer),
		.B(26'd40),
		.cmp(one_sec8)
	);
	
	Comparator #(.N(26)) check_9_secs (
		.A(timer),
		.B(26'd45),
		.cmp(one_sec9)
	);
	
	Comparator #(.N(29)) check_10_secs (
		.A(timer),
		.B(29'd50),
		.cmp(t_out)
	);
	
endmodule
