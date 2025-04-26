module Mux2to1 (
	input logic [1:0] A,
	input logic [1:0] B,
	input logic S,
	output logic [1:0] Y
);
	
	assign Y = S ? B : A;
	
endmodule
