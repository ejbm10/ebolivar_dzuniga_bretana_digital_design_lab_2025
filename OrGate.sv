module OrGate (
	input logic A,
	input logic B,
	input logic C,
	output logic Y
);

	assign Y = A | B | C;
	
endmodule
