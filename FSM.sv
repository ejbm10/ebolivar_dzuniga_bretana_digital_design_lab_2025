module FSM (
	input logic clk,
	input logic rst,
	input logic select,
	input logic move,
	input logic time_out,
	input logic win,
	input logic full,
	output logic rst_timer,
	output logic en_neg,
	output logic en_load,
	output logic en_check,
	output logic en_comp_board,
	output logic player1_win,
	output logic player2_win,
	output logic game_over
);

	logic [3:0] state, next_state;

	always_ff @(posedge clk or posedge rst) begin
		if (rst) state <= 4'b0000;
		else state <= next_state;
	end
	
	always_comb begin
		case (state)
			4'b0000: next_state = select ? 4'b0001 : 4'b0010;
			4'b0001: next_state = move ? 4'b0101 : 4'b0011;
			4'b0010: next_state = move ? 4'b0101 : 4'b0011;
			4'b0011: next_state = time_out ? 4'b0100 : 4'b0000;
			4'b0100: next_state = 4'b0000;
			4'b0101: next_state = 4'b0110;
			4'b0110: next_state = win ? (select ? 4'b1000 : 4'b1001) : 4'b0111;
			4'b0111: next_state = full ? 4'b1010 : 4'b0100;
			4'b1000: next_state = 4'b1000;
			4'b1001: next_state = 4'b1001;
			4'b1010: next_state = 4'b1010;
		endcase
	end
	
	assign rst_timer = (state == 4'b0100);
	assign en_neg = (state == 4'b0100);
	assign en_load = (state == 4'b0101);
	assign en_check = (state == 4'b0110);
	assign en_comp_board = (state == 4'b0111);
	assign player1_win = (state == 4'b1000);
	assign player2_win = (state == 4'b1001);
	assign game_over = (state == 4'b1010);
	
endmodule
