module VGADriver(
	input logic clk, rst,
	input logic [1:0] con4_matrix [0:5][0:6],
	input player1_win,
	input player2_win,
	output logic vga_hs, vga_vs, vga_blk, vga_sync,
	output logic [7:0] red, green, blue,
	output logic clk_25
);

	logic [9:0] hs;
	logic [9:0] vs;
	
	logic [2:0] r3, g3, b3;
	logic frame_start;
	
	clk50to25 clk50to25_inst(
		.refclk(clk),
		.rst(rst),
		.outclk_0(clk_25),
		.locked()
	);
	
	GraphicsDriver gdriver(
		.clk_25(clk_25), 
		.vga_hsync(vga_hs), 
		.vga_vsync(vga_vs), 
		.vga_blk(vga_blk), 
		.vga_sync(vga_sync), 
		.hs(hs), 
		.vs(vs),
		.frame_start(frame_start)
	);

	DrawScreen drw(
		.clk(clk_25),
		.rst(rst),
		.visible(vga_blk),
		.frame_start(frame_start),
		.board(con4_matrix),
		.player1_win(player1_win),
		.player2_win(player2_win),
		.red(r3),
		.green(g3),
		.blue(b3)
	);

	assign red = {r3, 5'b0};
	assign green = {g3, 5'b0};
	assign blue = {b3, 5'b0};
	
endmodule