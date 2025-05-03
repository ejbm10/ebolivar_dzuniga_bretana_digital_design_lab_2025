module comunicacionFPGA (
    input logic clk,         // Reloj del sistema
    input logic rst,         // Reset
    input logic sck,         // SPI Clock desde el master
    input logic mosi,        // Master Out Slave In
    input logic ss,          // Slave Select (activo en bajo)
    output logic [2:0] jugada,  // Jugada recibida 
    output logic dato_listo  // Bandera: se recibió dato nuevo
);

    logic [2:0] bit_cnt;
    logic [7:0] buffer;

    always_ff @(posedge sck or posedge rst) begin
        if (rst) begin
            bit_cnt <= 0;
            buffer <= 0;
            dato_listo <= 0;
        end else if (!ss) begin // Solo recibir si está seleccionado
            buffer <= {buffer[6:0], mosi};
            bit_cnt <= bit_cnt + 1;
            if (bit_cnt == 7) begin
                jugada <= buffer[2:0];
                dato_listo <= 1;
                bit_cnt <= 0;
            end else begin
                dato_listo <= 0;
            end
        end
    end
endmodule
