module Connect4_tb();

	logic clk, rst, load_btn, select;
	logic [2:0] column;
	logic [1:0] val0, val1, val2, val3, val4, val5, val6;
	logic win;

	Connect4 dut (
		.clk(clk),
		.rst(rst),
		.column(column),
		.load_btn(load_btn),
		.player(select),
		.val0(val0),
		.val1(val1),
		.val2(val2),
		.val3(val3),
		.val4(val4),
		.val5(val5),
		.val6(val6),
		.win(win)
	);

	initial clk = 0;
	always #5 clk = ~clk;  // 10ns full period

	initial begin
		// Init
		select = 0;       // So mux_out = 2'b10
		column = 3'd0;    // Target column
		load_btn = 0;
		rst = 1;
		#20 rst = 0;
		
		load_btn = 1;
		#20; load_btn = 0;
		
		#100;
		
		column = 3'd1;
		
		#100;
		
		load_btn = 1;
		#20; load_btn = 0;
		
		#100;
		
		column = 3'd2;
		
		#100; 
		
		load_btn = 1;
		#20; load_btn = 0;
		
		#100;
		
		column = 3'd3;
		
		#100; 
		
		load_btn = 1;
		#20; load_btn = 0;
		
		#100;
		
		load_btn = 1;
		#20; load_btn = 0;
		
		#100;
		
		load_btn = 1;
		#20; load_btn = 0;
		
		#100;
		
	end

endmodule

