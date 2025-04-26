module FSM (
	input logic clk,
	input logic rst,
	input logic load,
	input logic time_out,
	output logic en_loading,
	output logic rst_timer,
	output logic change_player
);

	logic [3:0] state, next_state;

	always_ff @(posedge clk or posedge rst) begin
		if (rst) state <= 4'b0000;
		else state <= next_state;
	end
	
	always_comb begin
		case (state)
			4'b0000: next_state = load ? 4'b0001 : 4'b0010;
			4'b0001: next_state = 4'b0000;
			4'b0010: next_state = time_out ? 4'b0011 : 4'b0000;
			4'b0011: next_state = 4'b0000;
			default: next_state = 4'b0000;
		endcase
	end
	
	assign en_loading = (state == 4'b0001);
	assign rst_timer = (state == 4'b0011);
	assign change_player = (state == 4'b0011);
	
endmodule
