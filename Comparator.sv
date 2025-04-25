module Comparator #(parameter N) (
	input logic [N-1:0] A,
	input logic [N-1:0] B,
	output logic cmp
);

	assign cmp = (A == B);
	
endmodule
