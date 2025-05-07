module fpga_uart_receiver (
    input  logic        clk,
    input  logic        rst,
    input  logic        rx,
    output logic [2:0]  jugada,
    output logic        confirmacion,
    output logic        nuevo_dato
);

    logic [7:0] rx_data;
    logic       rx_ready;

    // Instancia del módulo UART receptor
    uart_rx #(
        .CLK_FREQ(50_000_000),
        .BAUD_RATE(9600)
    ) uart_rx_inst (
        .clk(clk),
        .rst(rst),
        .rx(rx),
        .rx_data(rx_data),
        .rx_ready(rx_ready)
    );

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            jugada        <= 3'b000;
            confirmacion  <= 1'b0;
            nuevo_dato    <= 1'b0;
        end else begin
            nuevo_dato <= 0;

            if (rx_ready) begin
                jugada       <= rx_data[2:0];
                confirmacion <= rx_data[3];
                nuevo_dato   <= 1; // Solo por un ciclo
            end
        end
    end

endmodule
vc  