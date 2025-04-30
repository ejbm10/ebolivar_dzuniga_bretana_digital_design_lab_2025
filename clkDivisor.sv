module clkDivisor(
	input logic clk,
	output logic clk_25
);

	reg [15:0] cnt;
	
	always @(posedge clk) begin
	
		cnt <= cnt + 16'h4000;
		clk_25 <= cnt[15];
	end

endmodule