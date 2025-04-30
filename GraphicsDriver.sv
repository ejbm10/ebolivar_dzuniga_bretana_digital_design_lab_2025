module GraphicsDriver(
	input logic clk_25,
	output logic vga_hsync, vga_vsync, sync_blk, sync_b,
	output logic [9:0] hs, vs
);

	always @(posedge clk_25) begin
		hs++;
		if (hs == 10'd800) begin
			hs = 0;
			vs++;
			if (vs == 10'd525) vs = 0;
		end
	end
	
	assign vga_hsync = ~(hs > 10'd640 + 10'd16 & hs < 10'd640 + 10'd16 + 10'd96);
	
	assign vga_vsync = ~(vs > 10'd480 + 10'd11 & vs < 10'd480 + 10'd11 + 10'd2);
	
	assign sync_b =  vga_hsync & vga_vsync;
	
	assign sync_blk = (hs < 10'd640) & (vs < 10'd480);
		

endmodule