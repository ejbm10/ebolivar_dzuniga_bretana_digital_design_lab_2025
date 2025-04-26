module SecondsValidator (
	input logic clk,
	input logic rst,
	output logic [28:0] timer,
	output logic t_out,
	output logic [3:0] secs
);
	
	logic one_sec1, one_sec2, one_sec3, one_sec4, one_sec5, one_sec6, one_sec7, one_sec8, one_sec9;
	
	Counter #(.N(29)) cycles (
		.clk(clk),
		.rst(rst),
		.en_count(1),
		.count(timer)
	);
	
	Counter #(.N(4)) seconds (
		.clk(clk),
		.rst(rst),
		.en_count(one_sec1 | one_sec2 | one_sec3 | one_sec4 | one_sec5 | one_sec6 | one_sec7 | one_sec8 | one_sec9),
		.count(secs)
	);
	
	Comparator #(.N(29)) check_1_sec (
		.A(timer),
		.B(29'd49_999_999),
		.cmp(one_sec1)
	);
	
	Comparator #(.N(29)) check_2_secs (
		.A(timer),
		.B(29'd99_999_999),
		.cmp(one_sec2)
	);
	
	Comparator #(.N(29)) check_3_secs (
		.A(timer),
		.B(29'd149_999_999),
		.cmp(one_sec3)
	);
	
	Comparator #(.N(29)) check_4_secs (
		.A(timer),
		.B(29'd199_999_999),
		.cmp(one_sec4)
	);
	
	Comparator #(.N(29)) check_5_secs (
		.A(timer),
		.B(29'd249_999_999),
		.cmp(one_sec5)
	);
	
	Comparator #(.N(29)) check_6_secs (
		.A(timer),
		.B(29'd299_999_999),
		.cmp(one_sec6)
	);
	
	Comparator #(.N(29)) check_7_secs (
		.A(timer),
		.B(29'd349_999_999),
		.cmp(one_sec7)
	);
	
	Comparator #(.N(29)) check_8_secs (
		.A(timer),
		.B(29'd399_999_999),
		.cmp(one_sec8)
	);
	
	Comparator #(.N(29)) check_9_secs (
		.A(timer),
		.B(29'd449_999_999),
		.cmp(one_sec9)
	);
	
	Comparator #(.N(29)) check_10_secs (
		.A(timer),
		.B(29'd499_999_999),
		.cmp(t_out)
	);
	
endmodule
