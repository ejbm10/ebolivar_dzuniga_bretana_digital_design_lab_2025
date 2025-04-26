module Connect4 (
	input logic clk,
	input logic rst,
	input logic [2:0] column,
	input logic load_btn,
	input logic player,
	output logic [1:0] val0,
	output logic [1:0] val1,
	output logic [1:0] val2,
	output logic [1:0] val3,
	output logic [1:0] val4,
	output logic [1:0] val5,
	output logic [3:0] secs
);
	logic swp_player, q_player;
	logic [1:0] mux_out;
	logic en_loading, t_out, rst_timer, change, one_sec1, one_sec2;
	logic [28:0] timer;
	
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
		.mux_out(mux_out),
		.val00(val0),
		.val01(val1),
		.val02(val2),
		.val03(val3),
		.val04(val4),
		.val05(val5)
	);
	
	PlayerRegister current (
		.clk(clk),
		.rst(rst),
		.initial_player(player),
		.D(swp_player),
		.Q(q_player)
	);
	
endmodule

	