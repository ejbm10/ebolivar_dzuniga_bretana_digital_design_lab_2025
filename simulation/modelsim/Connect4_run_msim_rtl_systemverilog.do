transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/clk50to25.vo}
vlib clk50to25
vmap clk50to25 clk50to25
vlog -vlog01compat -work clk50to25 +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/clk50to25 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/clk50to25/clk50to25_0002.v}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/GraphicsDriver.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/DrawScreen.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/VGADriver.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/FSM.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/Mux2to1.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/Inverter.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/Counter.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/Comparator.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/Register.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/AndGate.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/Connect4.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/ColumnModule.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/Loader.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/PlayerRegister.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/SecondsValidator.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/SevenSegmentDecoder.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/VictoryValidator.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/Check4InLine.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/CheckColumnWin.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/CheckRowWin.sv}

vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/Connect4_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -L clk50to25 -voptargs="+acc"  Connect4_tb

add wave *
view structure
view signals
run -all
