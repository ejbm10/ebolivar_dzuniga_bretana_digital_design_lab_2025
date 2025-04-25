module Connect4_tb();

	logic clk, rst, load_btn, select, in_column0, is0x5empty;
	logic [2:0] column;
	logic [1:0] val;

	Connect4 dut (
		.clk(clk),
		.rst(rst),
		.column(column),
		.load_btn(load_btn),
		.select(select),
		.val(val),
		.in_column0(in_column0),
		.is0x5empty(is0x5empty)
	);

	initial clk = 0;
	always #5 clk = ~clk;  // 10ns full period

	initial begin
		// Init
		rst = 1;
		select = 0;       // So mux_out = 2'b10
		column = 3'd0;    // Target column
		load_btn = 0;

		#12;              // Pass reset during a posedge clk
		rst = 0;

		#20;              // Wait for clk to stabilize

		// Now check result after some negative edges
		#100;
		
		rst = 1;
		
		#10;
		
		rst = 0;
		
		#100;
	end

endmodule

