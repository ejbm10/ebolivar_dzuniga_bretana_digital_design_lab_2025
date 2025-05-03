module Connect4 (
	input logic clk,
	input logic rst,
	input logic sck,
	input logic ss,
	input logic mosi,
	input logic [2:0] jugada1,
	input logic fpga_btn,
	input logic player,
	output logic [6:0] segs1,
	output logic [6:0] segs0
);
	logic [2:0] jugada2;
	
	logic swp_player, q_player;
	logic [1:0] mux_out;
	logic board_full, en_loading, t_out, rst_timer, change, player1_winner, player2_winner, ard_btn;
	logic [28:0] timer;
	
	logic [1:0] val00, val01, val02, val03, val04, val05;
	logic [1:0] val10, val11, val12, val13, val14, val15;
	logic [1:0] val20, val21, val22, val23, val24, val25;
	logic [1:0] val30, val31, val32, val33, val34, val35;
	logic [1:0] val40, val41, val42, val43, val44, val45;
	logic [1:0] val50, val51, val52, val53, val54, val55;
	logic [1:0] val60, val61, val62, val63, val64, val65;
	
	logic win, game_over;
	logic [1:0] q_state;
	logic [3:0] secs;
	
	logic [5:0] spots;
	
	FSM controller (
		.clk(clk),
		.rst(rst),
		.load(q_player ? ard_btn : fpga_btn),
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
		.timer(timer),
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
		.jugada2(jugada2),
		.load(en_loading),
		.mux_out(mux_out),
		.val00(val00),
		.val01(val01),
		.val02(val02), 
		.val03(val03),
		.val04(val04),
		.val05(val05),
		.val10(val10), 
		.val11(val11), 
		.val12(val12), 
		.val13(val13), 
		.val14(val14), 
		.val15(val15),
		.val20(val20), 
		.val21(val21), 
		.val22(val22), 
		.val23(val23), 
		.val24(val24), 
		.val25(val25),
		.val30(val30), 
		.val31(val31), 
		.val32(val32), 
		.val33(val33), 
		.val34(val34), 
		.val35(val35),
		.val40(val40), 
		.val41(val41), 
		.val42(val42), 
		.val43(val43), 
		.val44(val44), 
		.val45(val45),
		.val50(val50),
		.val51(val51), 
		.val52(val52), 
		.val53(val53), 
		.val54(val54), 
		.val55(val55),
		.val60(val60), 
		.val61(val61), 
		.val62(val62), 
		.val63(val63), 
		.val64(val64), 
		.val65(val65)
	);
	
	VictoryValidator victory (
		.val00(val00),
		.val01(val01),
		.val02(val02), 
		.val03(val03),
		.val04(val04),
		.val05(val05),
		.val10(val10), 
		.val11(val11), 
		.val12(val12), 
		.val13(val13), 
		.val14(val14), 
		.val15(val15),
		.val20(val20), 
		.val21(val21), 
		.val22(val22), 
		.val23(val23), 
		.val24(val24), 
		.val25(val25),
		.val30(val30), 
		.val31(val31), 
		.val32(val32), 
		.val33(val33), 
		.val34(val34), 
		.val35(val35),
		.val40(val40), 
		.val41(val41), 
		.val42(val42), 
		.val43(val43), 
		.val44(val44), 
		.val45(val45),
		.val50(val50),
		.val51(val51), 
		.val52(val52), 
		.val53(val53), 
		.val54(val54), 
		.val55(val55),
		.val60(val60), 
		.val61(val61), 
		.val62(val62), 
		.val63(val63), 
		.val64(val64), 
		.val65(val65),
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
	
	comunicacionFPGA j2 (
		.clk(clk),
		.rst(rst),
		.sck(sck),
		.ss(ss),
		.mosi(mosi),
		.jugada(jugada2),
		.dato_listo(ard_btn)
	);
	
endmodule

	