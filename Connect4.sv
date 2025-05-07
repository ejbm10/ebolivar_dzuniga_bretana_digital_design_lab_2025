module Connect4 (
	input logic clk,
	input logic rst,
	input logic sck,
	input logic ss,
	input logic mosi,
	input logic pin_recibido,
	input logic [2:0] jugada1,
	input logic fpga_btn,
	input logic fpga_btn2,
	input logic player,
	output logic [6:0] segs1,
	output logic [6:0] segs0,
	output logic vga_hs, vga_vs, vga_blk, vga_sync,
	output logic [7:0] red, green, blue,
	output logic clk_25
);
	logic swp_player, q_player;
	logic [1:0] mux_out;
	logic board_full, en_loading, t_out, rst_timer, change, player1_winner, player2_winner, ard_btn;
	
	logic win, game_over;
	logic [1:0] q_state;
	logic [3:0] secs;
	
	logic [5:0] spots;

	logic [1:0] con4_matrix [0:5][0:6];
	
	
	FSM controller (
		.clk(clk),
		.rst(rst),
		.load(q_player ? !fpga_btn2 : !fpga_btn),
		.time_out(t_out),
		.win(win),
		.current_player(q_player),
		.full(board_full),
		.en_loading(en_loading),
		.rst_timer(rst_timer),
		.change_player(change),
		.player1_winner(player1_winner),
		.player2_winner(player2_winner),
		.game_over(game_over)
	);
	
	Mux2to1 #(.N(2)) selector (
		.A(2'b01),	// Value for FPGA player
		.B(2'b10),	// Value for Arduino player
		.S(q_player),
		.Y(mux_out)
	);
	
	Inverter swap (
		.A(q_player),
		.en(change),
		.Y(swp_player)
	);
	
	SecondsValidator sval (
		.clk(clk),
		.rst(rst | rst_timer),
		.t_out(t_out),
		.secs(secs)
	);
	
	Comparator #(.N(6)) is_board_full (
		.A(spots),
		.B(6'd42),
		.cmp(board_full)
	);
	
	Counter #(.N(6)) filled_spots (
		.clk(clk),
		.rst(rst),
		.en_count(en_loading),
		.count(spots)
	);
	
	Loader loader (
		.clk(clk),
		.rst(rst),
		.current_player(q_player),
		.jugada1(jugada1),
		//.jugada2(jugada1),
		.load(en_loading),
		.mux_out(mux_out),
		.val00(con4_matrix[0][0]),
		.val01(con4_matrix[1][0]),
		.val02(con4_matrix[2][0]), 
		.val03(con4_matrix[3][0]),
		.val04(con4_matrix[4][0]),
		.val05(con4_matrix[5][0]),
		.val10(con4_matrix[0][1]), 
		.val11(con4_matrix[1][1]), 
		.val12(con4_matrix[2][1]), 
		.val13(con4_matrix[3][1]), 
		.val14(con4_matrix[4][1]), 
		.val15(con4_matrix[5][1]),
		.val20(con4_matrix[0][2]), 
		.val21(con4_matrix[1][2]), 
		.val22(con4_matrix[2][2]), 
		.val23(con4_matrix[3][2]), 
		.val24(con4_matrix[4][2]), 
		.val25(con4_matrix[5][2]),
		.val30(con4_matrix[0][3]), 
		.val31(con4_matrix[1][3]), 
		.val32(con4_matrix[2][3]), 
		.val33(con4_matrix[3][3]), 
		.val34(con4_matrix[4][3]), 
		.val35(con4_matrix[5][3]),
		.val40(con4_matrix[0][4]), 
		.val41(con4_matrix[1][4]), 
		.val42(con4_matrix[2][4]), 
		.val43(con4_matrix[3][4]), 
		.val44(con4_matrix[4][4]), 
		.val45(con4_matrix[5][4]),
		.val50(con4_matrix[0][5]),
		.val51(con4_matrix[1][5]), 
		.val52(con4_matrix[2][5]), 
		.val53(con4_matrix[3][5]), 
		.val54(con4_matrix[4][5]), 
		.val55(con4_matrix[5][5]),
		.val60(con4_matrix[0][6]), 
		.val61(con4_matrix[1][6]), 
		.val62(con4_matrix[2][6]), 
		.val63(con4_matrix[3][6]), 
		.val64(con4_matrix[4][6]), 
		.val65(con4_matrix[5][6])
	);
	
	VictoryValidator victory (
		.val00(con4_matrix[0][0]),
		.val01(con4_matrix[1][0]),
		.val02(con4_matrix[2][0]), 
		.val03(con4_matrix[3][0]),
		.val04(con4_matrix[4][0]),
		.val05(con4_matrix[5][0]),
		.val10(con4_matrix[0][1]), 
		.val11(con4_matrix[1][1]), 
		.val12(con4_matrix[2][1]), 
		.val13(con4_matrix[3][1]), 
		.val14(con4_matrix[4][1]), 
		.val15(con4_matrix[5][1]),
		.val20(con4_matrix[0][2]), 
		.val21(con4_matrix[1][2]), 
		.val22(con4_matrix[2][2]), 
		.val23(con4_matrix[3][2]), 
		.val24(con4_matrix[4][2]), 
		.val25(con4_matrix[5][2]),
		.val30(con4_matrix[0][3]), 
		.val31(con4_matrix[1][3]), 
		.val32(con4_matrix[2][3]), 
		.val33(con4_matrix[3][3]), 
		.val34(con4_matrix[4][3]), 
		.val35(con4_matrix[5][3]),
		.val40(con4_matrix[0][4]), 
		.val41(con4_matrix[1][4]), 
		.val42(con4_matrix[2][4]), 
		.val43(con4_matrix[3][4]), 
		.val44(con4_matrix[4][4]), 
		.val45(con4_matrix[5][4]),
		.val50(con4_matrix[0][5]),
		.val51(con4_matrix[1][5]), 
		.val52(con4_matrix[2][5]), 
		.val53(con4_matrix[3][5]), 
		.val54(con4_matrix[4][5]), 
		.val55(con4_matrix[5][5]),
		.val60(con4_matrix[0][6]), 
		.val61(con4_matrix[1][6]), 
		.val62(con4_matrix[2][6]), 
		.val63(con4_matrix[3][6]), 
		.val64(con4_matrix[4][6]), 
		.val65(con4_matrix[5][6]),
		.win(win)
	);
	
	PlayerRegister current (
		.clk(clk),
		.rst(rst),
		.initial_player(player),
		.D(swp_player),
		.Q(q_player)
	);
	
	Register game_state (
		.clk(clk),
		.rst(rst),
		.en(player1_winner | player2_winner | game_over),
		.D(player1_winner ? 2'b01 : (player2_winner ? 2'b10 : (game_over ? 2'b11 : 2'b00))),
		.Q(q_state)
	);
	
	SevenSegmentDecoder sg (
		.A(secs),
		.seg1(segs1),
		.seg0(segs0)
	);
	
	/*comunicacionFPGA j2 (
		.clk(clk),
		.rst(rst),
		.sck(sck),
		.ss(ss),
		.mosi(mosi),
		.jugada(jugada2),
		.pin_recibido(pin_recibido),
		.recibido(ard_btn)
	);*/
	
	VGADriver vga(
		.clk(clk),
		.rst(rst),
		.con4_matrix(con4_matrix),
		.player1_win(player1_winner),
		.player2_win(player2_winner),
		.vga_hs(vga_hs), 
		.vga_vs(vga_vs), 
		.vga_blk(vga_blk), 
		.vga_sync(vga_sync),
		.red(red), 
		.green(green), 
		.blue(blue),
		.clk_25(clk_25)
	);
	
endmodule

	