module VGADriver_tb();
    
    // Señales para el VGADriver
    logic        clk;
    logic        rst;
    logic        visible;
    logic [1:0]  con4_matrix [0:5][0:6];
    logic        vga_hs;
    logic        vga_vs;
    logic        vga_blk;
    logic        vga_sync;
    logic [7:0]  red;
    logic [7:0]  green;
    logic [7:0]  blue;
    logic        clk_25;
    
    // Contadores para ciclos de reloj
    integer      cycle_count;
    integer      vga_cycle_count;
    
    // Instanciar el módulo VGADriver
    VGADriver dut (
        .clk(clk),
        .rst(rst),
        .visible(visible),
        .con4_matrix(con4_matrix),
        .vga_hs(vga_hs),
        .vga_vs(vga_vs),
        .vga_blk(vga_blk),
        .vga_sync(vga_sync),
        .red(red),
        .green(green),
        .blue(blue),
        .clk_25(clk_25)
    );
    
    // Generación de reloj de 50 MHz (20 ns periodo)
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end
    
    // Contador de ciclos para el reloj principal
    initial begin
        cycle_count = 0;
        forever begin
            @(posedge clk);
            cycle_count = cycle_count + 1;
        end
    end
    
    // Contador de ciclos para el reloj VGA
    initial begin
        vga_cycle_count = 0;
        forever begin
            @(posedge clk_25);
            vga_cycle_count = vga_cycle_count + 1;
        end
    end
    
    // Inicializar la matriz con un patrón de prueba
    task init_board;
        for (int row = 0; row < 6; row++) begin
            for (int col = 0; col < 7; col++) begin
                // Crear un patrón de tablero tipo ajedrez
                if ((row + col) % 2 == 0)
                    con4_matrix[row][col] = 2'b01; // Rojo
                else
                    con4_matrix[row][col] = 2'b10; // Amarillo
            end
        end
    endtask
    
    // Secuencia de prueba
    initial begin
        // Inicializar entradas
        rst = 1'b1;
        visible = 1'b0;
        init_board();
        
        // Aplicar reset
        #20 rst = 1'b1;
        #50 rst = 1'b0;
        #50 rst = 1'b1;
        
        // Activar señal visible
        #100 visible = 1'b1;
        
        // Esperar suficientes ciclos para ver al menos un frame VGA completo
        // Un frame VGA a 60Hz toma aproximadamente 16.67ms
        repeat(1000) @(posedge clk);
        
        // Cambiar el patrón del tablero
        for (int row = 0; row < 6; row++) begin
            for (int col = 0; col < 7; col++) begin
                con4_matrix[row][col] = (row < 3) ? 2'b01 : 2'b10;
            end
        end
        
        // Esperar más ciclos para ver el nuevo patrón
        repeat(1000) @(posedge clk);
        
        // Verificar la división de frecuencia
        if (vga_cycle_count > 0) begin
            $display("Verificación del reloj VGA: OK");
            $display("Relación de frecuencia clk/clk_25: %d", cycle_count/vga_cycle_count);
            if (cycle_count/vga_cycle_count >= 1.9 && cycle_count/vga_cycle_count <= 2.1) begin
                $display("División de frecuencia aproximada a 1/2: OK");
            end else begin
                $display("Error: División de frecuencia no es cercana a 1/2");
            end
        end else begin
            $display("Error: El reloj VGA no está funcionando correctamente");
        end
        
        // Verificar señales de sincronización VGA
        $display("Señales VGA al final de la simulación:");
        $display("vga_hs=%b, vga_vs=%b, vga_blk=%b, vga_sync=%b", 
                 vga_hs, vga_vs, vga_blk, vga_sync);
        
        $display("Simulación completada después de %d ciclos", cycle_count);
        $stop;
    end
    
    // Monitor para verificar las señales
    initial begin
        $monitor("Time=%0t: vga_hs=%b vga_vs=%b vga_blk=%b | RGB=[%h,%h,%h] | Ciclos=%0d VGA_Ciclos=%0d", 
                 $time, vga_hs, vga_vs, vga_blk, red, green, blue, cycle_count, vga_cycle_count);
    end
    
endmodule