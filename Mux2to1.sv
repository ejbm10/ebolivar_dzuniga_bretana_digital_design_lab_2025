module Mux2to1 #(parameter N) (
	input logic [N-1:0] A,
	input logic [N-1:0] B,
	input logic S,
	output logic [N-1:0] Y
);
	
	assign Y = S ? B : A;
	
endmodule
