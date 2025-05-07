module PlayerRegister (
	input logic clk,
	input logic rst,
	input logic initial_player,
	input logic D,
	output logic Q
);

	always_ff @(negedge clk or posedge rst) begin
		if (rst) Q <= initial_player;
		else Q <= D;
	end

endmodule
