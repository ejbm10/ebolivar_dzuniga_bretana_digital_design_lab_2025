module Connect4_tb();

	logic clk, rst, load_btn, select;
	logic [2:0] column;
	logic [1:0] val0, val1, val2, val3, val4, val5;
	logic [3:0] secs;

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
		.secs(secs)
	);

	initial clk = 0;
	always #10 clk = ~clk;  // 10ns full period

	initial begin
		// Init
		select = 0;       // So mux_out = 2'b10
		column = 3'd0;    // Target column
		load_btn = 0;
		rst = 1;
		#20 rst = 0;
		
		#1000;
		
	end

endmodule

