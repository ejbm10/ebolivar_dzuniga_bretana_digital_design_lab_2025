module Counter (
	input logic clk,
	input logic rst,
	input logic en_count,
	output logic [28:0] count
);

	always_ff @(negedge clk or posedge rst) begin
		if (rst) count <= 0;
		else if (en_count) count <= count + 1;
	end
	
endmodule
