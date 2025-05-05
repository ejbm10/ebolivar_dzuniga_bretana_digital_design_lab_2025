module DrawScreen(
    input  logic clk,
    input  logic rst,
    input  logic visible,
    input  logic frame_start,
    input  logic [1:0] board [0:5][0:6], // 6 filas x 7 columnas
    output logic [2:0] red,
    output logic [2:0] green,
    output logic [2:0] blue
);

    localparam CELL_W = 80;
    localparam CELL_H = 80;
    localparam BOARD_ORIGIN_X = 40;
    localparam BOARD_ORIGIN_Y = 0;

    logic [18:0] pixel_count = 0; // 640*480 = ~307k, 19 bits está bien
    logic [9:0] x, y;

    always_ff @(posedge clk) begin
        if (rst || frame_start)
            pixel_count <= 0;
        else if (visible)
            pixel_count <= pixel_count + 1;
    end

    // Convertir a coordenadas x,y
    assign x = pixel_count % 640;
    assign y = pixel_count / 640;

    // Variables internas para coordenadas de celda
    logic [2:0] col, row;
    logic inside_board;
    logic [2:0] r, g, b;

    always_comb begin
        // Por defecto: fondo negro
        r = 0; g = 0; b = 0;

        // Verificamos si estamos dentro del área del tablero
        inside_board = (x >= BOARD_ORIGIN_X) && (x < BOARD_ORIGIN_X + 7*CELL_W) &&
                       (y >= BOARD_ORIGIN_Y) && (y < BOARD_ORIGIN_Y + 6*CELL_H);

        if (inside_board) begin
            col = (x - BOARD_ORIGIN_X) / CELL_W;
            row = (y - BOARD_ORIGIN_Y) / CELL_H;

            // Coordenadas relativas dentro de la celda
            int local_x = (x - BOARD_ORIGIN_X) % CELL_W;
            int local_y = (y - BOARD_ORIGIN_Y) % CELL_H;

            // Centro del círculo en la celda
            int dx = local_x - CELL_W/2;
            int dy = local_y - CELL_H/2;
            int dist2 = dx*dx + dy*dy;

            // Dibujar fondo azul para la celda
            r = 0; g = 0; b = 7;

            // Dibujar círculo si está dentro del radio (~30 px)
            if (dist2 < 30*30) begin
                case (board[row][col])
                    2'b00: begin r = 0; g = 0; b = 0; end     // vacía: negro
                    2'b01: begin r = 7; g = 0; b = 0; end     // jugador 1: rojo
                    2'b10: begin r = 7; g = 7; b = 0; end     // jugador 2: amarillo
                    default: begin r = 7; g = 7; b = 7; end   // otro: blanco
                endcase
            end
        end
    end

    assign red   = r;
    assign green = g;
    assign blue  = b;

endmodule
