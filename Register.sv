module Register (
	input logic clk,
	input logic rst,
	input logic en,
	input logic [1:0] D,
	output logic [1:0] Q
);

	always_ff @(negedge clk or posedge rst) begin
		if (rst) Q <= 0;
		else if (en) Q <= D;
	end
	
endmodule
