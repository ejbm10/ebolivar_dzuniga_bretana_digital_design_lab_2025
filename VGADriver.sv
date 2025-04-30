module VGADriver(
	input logic clk, rst, visible,
	input logic [1:0] con4_matrix [0:5][0:6],
	output logic vga_hs, vga_vs, vga_blk, vga_sync,
	output logic [7:0] red, green, blue,
	output logic clk_25
);

	logic [9:0] hs;
	logic [9:0] vs;
	
	clkDivisor div(clk,clk_25);
	
	GraphicsDriver gdriver(clk_25, vga_hs, vga_vs, vga_blk, vga_sync, hs, vs);
	
	DrawScreen drw(clk, rst, visible, hs, vs, con4_matrix, red, green, blue);
	
endmodule