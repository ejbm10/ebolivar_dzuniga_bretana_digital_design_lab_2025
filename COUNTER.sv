module COUNTER (
	input clk,
	input rst,
	output logic [25:0] count
);

	always_ff @(posedge clk or negedge rst) begin
		if (rst) count <= 0;
		else count <= count + 1;
	end
	
endmodule
