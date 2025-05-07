module SevenSegmentDecoder (
    input  [3:0] A,         // Input: 0 to 10 (0000 to 1010)
    output reg [6:0] seg1,  // Left digit: 0 for 0–9, 1 for 10
    output reg [6:0] seg0   // Right digit: 0–9
);

// Active-low encoding: 0 = ON, 1 = OFF
// Segment order: {a, b, c, d, e, f, g}
always @(*) begin
    case (A)
        4'd0:  seg0 = 7'b1000000; // 0
        4'd1:  seg0 = 7'b1111001; // 1
        4'd2:  seg0 = 7'b0100100; // 2
        4'd3:  seg0 = 7'b0110000; // 3
        4'd4:  seg0 = 7'b0011001; // 4
        4'd5:  seg0 = 7'b0010010; // 5
        4'd6:  seg0 = 7'b0000010; // 6
        4'd7:  seg0 = 7'b1111000; // 7
        4'd8:  seg0 = 7'b0000000; // 8
        4'd9:  seg0 = 7'b0010000; // 9
        4'd10: seg0 = 7'b1000000; // 0 (to display "10")
        default: seg0 = 7'b1111111; // blank/off
    endcase

    case (A)
        4'd10: seg1 = 7'b1111001; // 1
        default: seg1 = 7'b1000000; // 0
    endcase
end

endmodule



