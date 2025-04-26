module Inverter (
	input logic A,
	input logic en,
	output logic Y
);

	assign Y = en ? ~A : A;
	
endmodule
