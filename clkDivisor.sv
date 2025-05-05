module clkDivisor(
	input logic clk,
	output logic clk_25
);

	reg [15:0] cnt;
	
	always @(posedge clk)
	clk_25 <= cnt + 16'h8000;

endmodule