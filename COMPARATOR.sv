module COMPARATOR (
	input logic [25:0] A,
	input logic [25:0] B,
	output logic cmp
);

	assign cmp = (A == B);
	
endmodule
