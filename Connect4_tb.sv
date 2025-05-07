module Connect4_tb();

	logic clk, rst, sck, ss, mosi, pin_recibido, fpga_btn, player;
	logic [2:0] jugada1;
	logic [6:0] segs1, segs0;
	logic [7:0] red, green, blue;
	logic vga_hs, vga_vs, vga_blk, vga_sync, clk_25;
	
	Connect4 dut (
		.clk(clk),
		.rst(rst),
		.sck(sck),
		.ss(ss),
		.mosi(mosi),
		.pin_recibido(pin_recibido),
		.jugada1(jugada1),
		.fpga_btn(fpga_btn),
		.player(player),
		.segs1(segs1),
		.segs0(segs0),
		.vga_hs(vga_hs),
		.vga_vs(vga_vs),
		.vga_blk(vga_blk),
		.vga_sync(vga_sync),
		.red(red),
		.green(green),
		.blue(blue),
		.clk_25(clk_25)
	);

	initial clk = 0;
	always #5 clk = ~clk;  // 10ns full period

	initial begin
		// Init
		player = 0;       // So mux_out = 2'b10
		jugada1 = 3'd0;    // Target column
		fpga_btn = 0;
		
		rst = 1;
		#20 rst = 0;
		
		fpga_btn = 1;
		#20; fpga_btn = 0;
		
		#100;
		
		jugada1 = 3'd1;
		
		#100;
		
		fpga_btn = 1;
		#20; fpga_btn = 0;
		
		#100;
		
	end

endmodule

