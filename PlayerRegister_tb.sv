module PlayerRegister_tb();

	logic clk, rst, initial_player, D, Q;
	
	PlayerRegister dut (
		.clk(clk),
		.rst(rst),
		.initial_player(initial_player),
		.D(D),
		.Q(Q)
	);
	
	always #5 clk = ~clk;
	
	initial begin
		clk = 0;
		rst = 0;
		initial_player = 0;
		D = 0;
		
		rst = 1;
		#15;
		rst = 0;
		
		#100;
		
		D = 1;
		
		#100;
	end
endmodule
