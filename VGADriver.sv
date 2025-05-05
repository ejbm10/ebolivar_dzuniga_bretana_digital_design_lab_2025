module VGADriver(
	input logic clk, rst,
	input logic [1:0] con4_matrix [0:5][0:6],
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
	
	logic [1:0] tablero_prueba[0:5][0:6];

	initial begin
		tablero = '{default: 2'b00}; // vacío
		tablero[5][0] = 2'b01; // ficha roja
		tablero[5][1] = 2'b10; // ficha amarilla
		tablero[4][0] = 2'b01;
	end

	DrawScreen drw(
		.clk(clk_25),
		.rst(rst),
		.visible(vga_blk),
		.frame_start(frame_start),
		.board(tablero_prueba),
		.red(r3),
		.green(g3),
		.blue(b3)
	);

	assign red = {r3, 5'b0};
	assign green = {g3, 5'b0};
	assign blue = {b3, 5'b0};
	
endmodule