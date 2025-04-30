module DrawScreen (
    input  logic clk,
    input  logic rst,
    input  logic visible,
    input  logic [10:0] x,
    input  logic [10:0] y,
    input  logic [1:0] board [0:5][0:6], //tablero [fila][columna]
    output logic [2:0] red,
    output logic [2:0] green,
    output logic [2:0] blue
);

    // Parámetros del tablero
    localparam CELL_SIZE   = 60;
    localparam BOARD_COLS  = 7;
    localparam BOARD_ROWS  = 6;
    localparam BOARD_WIDTH = BOARD_COLS * CELL_SIZE;  // 420
    localparam BOARD_HEIGHT = BOARD_ROWS * CELL_SIZE; // 360
    localparam BOARD_X0    = (640 - BOARD_WIDTH) / 2; // 110
    localparam BOARD_Y0    = (480 - BOARD_HEIGHT) / 2; // 60

    // Verifica si el píxel está dentro del área del tablero
    logic is_board_area;
    assign is_board_area = (x >= BOARD_X0) && (x < BOARD_X0 + BOARD_WIDTH) &&
                           (y >= BOARD_Y0) && (y < BOARD_Y0 + BOARD_HEIGHT);

    // Coordenadas de fila y columna dentro del tablero
    logic [2:0] col;
    logic [2:0] row;

    assign col = (x - BOARD_X0) / CELL_SIZE;
    assign row = (y - BOARD_Y0) / CELL_SIZE;

    // Selecciona el contenido de la celda actual
    logic [1:0] cell_pos;
    assign cell_pos = board[row][col];

    // Cálculo de círculo (centro de celda)
    logic [10:0] cx, cy;
    logic [10:0] dx, dy;
    logic [20:0] dist2;

    assign cx = BOARD_X0 + col * CELL_SIZE + CELL_SIZE / 2;
    assign cy = BOARD_Y0 + row * CELL_SIZE + CELL_SIZE / 2;
    assign dx = (x > cx) ? (x - cx) : (cx - x);
    assign dy = (y > cy) ? (y - cy) : (cy - y);
    assign dist2 = dx * dx + dy * dy;

    // Radio de la ficha circular (ligeramente más pequeño que la celda)
    localparam RADIUS = (CELL_SIZE / 2) - 5;       // 25
    localparam RADIUS_SQ = RADIUS * RADIUS;        // 625
    logic in_circle;
    assign in_circle = (dist2 <= RADIUS_SQ);

    // Salida RGB
    always_comb begin
        if (!visible) begin
            red = 3'b000;
            green = 3'b000;
            blue = 3'b000;
        end else if (is_board_area) begin
            if (in_circle) begin
                case (cell_pos)
                    2'b01: begin red = 3'b111; green = 3'b000; blue = 3'b000; end // Rojo
                    2'b10: begin red = 3'b111; green = 3'b111; blue = 3'b000; end // Amarillo
                    default: begin red = 3'b000; green = 3'b000; blue = 3'b000; end // Celda vacía (negro)
                endcase
            end else begin
                red = 3'b000;
                green = 3'b000;
                blue = 3'b111; // Fondo del tablero (azul)
            end
        end else begin
            red = 3'b000;
            green = 3'b000;
            blue = 3'b000; // Fondo fuera del tablero
        end
    end

endmodule
