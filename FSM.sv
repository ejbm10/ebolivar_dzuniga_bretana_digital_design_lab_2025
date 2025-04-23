module FSM (
	input logic clk,
	input logic rst,
	input logic s,
	input logic fpga_move,
	input logic arduino_move,
	input logic t_out_fpga,
	input logic t_out_arduino,
	input logic fpga_winner,
	input logic arduino_winner,
	input logic full_board_fpga,
	input logic full_board_arduino,
	output logic en_fpga_loading,
	output logic en_arduino_loading,
	output logic start_timer,
);

	logic [3:0] state, next_state;

	always_ff @(posedge clk or posedge rst) begin
		if (rst) state <= 4'b0000;
		else state <= next_state;
	end
	
	always_comb begin
		case (state)
			4'b0000: next_state = s ? 4'b0001 : 4'b0010;
			4'b0001: next_state = load_fpga ? 4'b0101 : 4'b0011;
			4'b0010: next_state = load_arduino ? 4'b0110 : 4'b0100;
			4'b0011: next_state = t_out_fpga ? 4'b0010 : 4'b0001;
			4'b0100: next_state = t_out_arduino ? 4'b0001 : 4'b0010;
			4'b0101: next_state = 4'b0111;
			4'b0110: next_state = 4'b1000;
			4'b0111: next_state = fpga_winner ? 4'b1011 : 4'b1001;
			4'b1000: next_state = arduino_winner ? 4'b1100 : 4'b1010;
			4'b1001: next_state = full_board_fpga ? 4'b1101 : 4'b0010;
			4'b1010: next_state = full_board_arduino ? 4'b1101 : 4'b0001;
			4'b1011: next_state = 4'b1011;
			4'b1100: next_state = 4'b1100;
			4'b1101: next_state = 4'b1101;
		endcase
	end
	
	assign en_fpga_loading = (state == 4'b0101);
	assign en_arduino_loading = (state == 4'b0110);
	assign en_timer = (state == 4'b0001 | state == 4'b0010);
	
	
endmodule
