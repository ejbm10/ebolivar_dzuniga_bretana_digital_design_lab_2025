module Connect4 (
	input logic clk,
	input logic rst,
	input logic [2:0] column,
	input logic load_btn,
	input logic player,
	output logic [6:0] segs1,
	output logic [6:0] segs0,
	output logic vga_hs, vga_vs, vga_blk, vga_sync,
	output logic [7:0] red, green, blue,
	output logic clk_25
);
	logic swp_player, q_player;
	logic [1:0] mux_out;
	logic en_loading, t_out, rst_timer, change, one_sec1, one_sec2;
	logic [28:0] timer;
	
	logic [3:0] secs;
	
	logic [1:0] con4_matrix [0:5][0:6];
	
	FSM controller (
		.clk(clk),
		.rst(rst),
		.load(load_btn),
		.time_out(t_out),
		.en_loading(en_loading),
		.rst_timer(rst_timer),
		.change_player(change)
	);
	
	Mux2to1 selector (
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
	
	Loader loader (
		.clk(clk),
		.rst(rst),
		.column(column),
		.load(en_loading),
		.mux_out(mux_out)
	);
	
	PlayerRegister current (
		.clk(clk),
		.rst(rst),
		.initial_player(player),
		.D(swp_player),
		.Q(q_player)
	);
	
	SevenSegmentDecoder sg (
		.A(secs),
		.seg1(segs1),
		.seg0(segs0)
	);
	
	VGADriver vga(
		.clk(clk),
		.rst(rst),
		.con4_matrix(con4_matrix),
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

	