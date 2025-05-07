module FSM_tb();
	
	logic clk, rst, load, time_out, win, q_player, full, en_loading, rst_timer, change_player, player1_winner, player2_winner, game_over;
	
	FSM dut (
		.clk(clk),
		.rst(rst),
		.load(load),
		.time_out(time_out),
		.win(win),
		.q_player(q_player),
		.full(full),
		.en_loading(en_loading),
		.rst_timer(rst_timer),
		.change_player(change_player),
		.player1_winner(player1_winner),
		.player2_winner(player2_winner),
		.game_over(game_over)
	);
	
	always #5 clk = ~clk;
	
	initial begin
		clk = 0;
		load = 0;
		time_out = 0;
		win = 0;
		q_player = 0;
		full = 0;
		rst = 1;
		#20;
		rst = 0;
		
		#100;
		
		// Simulate storing play
		load = 1;
		#20;
		load = 0;
		
		#100;
		
		// Load and simulate a win
		load = 1;
		#20;
		load = 0;
		
		win = 1;
		
		#100;
		
		win = 0;
		
		rst = 1;
		#20;
		rst = 0;
		#100;
		
		// Load and simulate a full board
		load = 1;
		#20;
		load = 0;
		
		full = 1;
		
		#100;
		
		full = 0;
		
		#100;
	end
endmodule
		