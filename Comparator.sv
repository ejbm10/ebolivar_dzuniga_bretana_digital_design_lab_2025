module Comparator (
	input logic [28:0] A,
	input logic [28:0] B,
	output logic cmp
);

	assign cmp = (A == B);
	
endmodule
