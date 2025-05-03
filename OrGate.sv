module OrGate (
	input logic A,
	input logic B,
	input logic C,
	input logic D,
	output logic Y
);

	assign Y = A | B | C | D;
	
endmodule
