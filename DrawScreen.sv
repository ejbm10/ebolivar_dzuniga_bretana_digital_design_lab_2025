module DrawScreen (
    input logic clk,
    input logic rst,
    input logic visible,
	 input logic frame_start,
    input logic [1:0] board [0:5][0:6],
    output logic [2:0] red,
    output logic [2:0] green,
    output logic [2:0] blue
);

    logic [18:0] pixel_count; // Para contar hasta 307200 píxeles

    logic frame_start_d;
	 
	 always_ff @(posedge clk) begin
		frame_start_d <= frame_start;
		if (rst || (frame_start && !frame_start_d)) begin
			pixel_count <= 0;
		end else if (visible) begin
			pixel_count <= pixel_count + 1;
		end
	end


	always_ff @(posedge clk) begin
        if (!visible) begin
            red <= 0;
            green <= 0;
            blue <= 0;
        end else begin
            if (pixel_count < 10000) begin // Letra T (blanco)
                red   <= 3'b111;
                green <= 3'b111;
                blue  <= 3'b111;
            end else if (pixel_count < 20000) begin // Letra E (rojo)
                red   <= 3'b111;
                green <= 3'b000;
                blue  <= 3'b000;
            end else if (pixel_count < 30000) begin // Letra S (verde)
                red   <= 3'b000;
                green <= 3'b111;
                blue  <= 3'b000;
            end else if (pixel_count < 40000) begin // Letra T (azul)
                red   <= 3'b000;
                green <= 3'b000;
                blue  <= 3'b111;
            end else begin
                red   <= 0;
                green <= 0;
                blue  <= 0;
            end
        end
    end
endmodule
