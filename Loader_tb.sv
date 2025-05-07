module Loader_tb();
	
	logic clk, rst, current_player, load;
	logic [1:0] mux_out;
	logic [1:0] val00, val01, val02, val03, val04, val05;
	logic [1:0] val10, val11, val12, val13, val14, val15;
	logic [1:0] val20, val21, val22, val23, val24, val25;
	logic [1:0] val30, val31, val32, val33, val34, val35;
	logic [1:0] val40, val41, val42, val43, val44, val45;
	logic [1:0] val50, val51, val52, val53, val54, val55;
	logic [1:0] val60, val61, val62, val63, val64, val65;
	logic [2:0] jugada1, jugada2;
	
	Loader dut (
		.clk(clk),
		.rst(rst),
		.current_player(current_player),
		.jugada1(jugada1),
		.jugada2(jugada2),
		.load(load),
		.mux_out(mux_out),
		.val00(val00),
		.val01(val01),
		.val02(val02), 
		.val03(val03),
		.val04(val04),
		.val05(val05),
		.val10(val10), 
		.val11(val11), 
		.val12(val12), 
		.val13(val13), 
		.val14(val14), 
		.val15(val15),
		.val20(val20), 
		.val21(val21), 
		.val22(val22), 
		.val23(val23), 
		.val24(val24), 
		.val25(val25),
		.val30(val30), 
		.val31(val31), 
		.val32(val32), 
		.val33(val33), 
		.val34(val34), 
		.val35(val35),
		.val40(val40), 
		.val41(val41), 
		.val42(val42), 
		.val43(val43), 
		.val44(val44), 
		.val45(val45),
		.val50(val50),
		.val51(val51), 
		.val52(val52), 
		.val53(val53), 
		.val54(val54), 
		.val55(val55),
		.val60(val60), 
		.val61(val61), 
		.val62(val62), 
		.val63(val63), 
		.val64(val64), 
		.val65(val65)
	);
	
	always #5 clk = ~clk;
	
	initial begin
		clk = 0;
		rst = 0;
		
		current_player = 0; // Turno del jugador 1 (FPGA)
		
		load = 0;
		
		mux_out = 2'b01; // Valor a guardar
		
		#100;
		
		rst = 1;
		#15;
		rst = 0;
		
		jugada1 = 3'd6;	// Jugador 1 elige la columna 6
		
		load = 1;	// Se recibe la señal de carga
		#15;
		load = 0;
		
		jugada2 = 3'd3;	// Jugador 2 elige la columna 3 (no debería dejarlo ya que no es su turno)
		
		load = 1;	// Señal de carga
		#15;
		load = 0;
		
		current_player = 1; // Turno del jugador 2 (Arduino)
		
		#100;
		
		load = 1;	// Carga la ficha
		#15;
		load = 0;
		
		#100;
	end
endmodule
