module TIMER (
	input logic clk,
	input logic rst,
	input logic start,
	output logic [3:0] count
);
	
	logic [25:0] clk_cycles;
	
	always_ff @(posedge clk or negedge rst) begin
		if (rst) begin
			clk_cycles <= 0;
			count <= 0;
		end
		else if (start) begin
			if (clk_cycles == 26'd49_999_999) begin
				clk_cycles <= 0;
				count <= count + 1;
			else clk_cycles <= clk_cycles + 1;
		end
	end
		
endmodule
