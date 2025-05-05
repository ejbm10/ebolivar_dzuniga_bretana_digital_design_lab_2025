module DrawScreen(
    input logic clk,
    input logic rst,
    input logic visible,
    input logic frame_start,
    input logic [1:0] board [0:5][0:6],
    output logic [2:0] red,
    output logic [2:0] green,
    output logic [2:0] blue
);

    parameter CELL_W = 80;
    parameter CELL_H = 80;
    parameter BOARD_ORIGIN_X = 40;
    parameter BOARD_ORIGIN_Y = 0;

    logic [18:0] pixel_count = 0;
    logic [9:0] x, y;

    logic [2:0] col, row;
    logic inside_board;
    logic [2:0] r, g, b;

    // ← Las variables que causaban error, ahora están fuera del always
    integer local_x, local_y;
    integer dx, dy, dist2;

    always_ff @(posedge clk) begin
        if (rst || frame_start)
            pixel_count <= 0;
        else if (visible)
            pixel_count <= pixel_count + 1;
    end

    assign x = pixel_count % 640;
    assign y = pixel_count / 640;

	always_comb begin
		r = 0;
		g = 0;
		b = 0;
		inside_board = 0;
		col = 0;
		row = 0;

		local_x = 0;
		local_y = 0;
		dx = 0;
		dy = 0;
		dist2 = 0;

		if ((x >= BOARD_ORIGIN_X) && (x < BOARD_ORIGIN_X + 7*CELL_W) &&
			(y >= BOARD_ORIGIN_Y) && (y < BOARD_ORIGIN_Y + 6*CELL_H)) begin

			inside_board = 1;

			col = (x - BOARD_ORIGIN_X) / CELL_W;
			row = (y - BOARD_ORIGIN_Y) / CELL_H;

			local_x = (x - BOARD_ORIGIN_X) % CELL_W;
			local_y = (y - BOARD_ORIGIN_Y) % CELL_H;

			dx = local_x - CELL_W/2;
			dy = local_y - CELL_H/2;
			dist2 = dx*dx + dy*dy;

			// fondo azul
			r = 0;
			g = 0;
			b = 7;

				if (dist2 < 30*30) begin
					case (board[row][col])
						2'b00: begin r = 0; g = 0; b = 0; end
						2'b01: begin r = 7; g = 0; b = 0; end
						2'b10: begin r = 7; g = 7; b = 0; end
						default: begin r = 7; g = 7; b = 7; end
					endcase
				end
			end
		end


    assign red   = r;
    assign green = g;
    assign blue  = b;

endmodule
