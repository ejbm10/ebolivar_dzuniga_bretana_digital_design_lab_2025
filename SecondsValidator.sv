module SecondsValidator (
	input logic clk,
	input logic rst,
	output logic t_out,
	output logic [3:0] secs
);
	logic [29:0] timer;
	
	Counter #(.N(30)) cycles (
		.clk(clk),
		.rst(rst),
		.en_count(1),
		.count(timer)
	);
	
	Comparator #(.N(30)) ten_seconds (
		.A(timer),
		.B(30'd500000000),
		.cmp(t_out)
	);
	
	assign secs = timer / 30'd50000000;
	
endmodule
