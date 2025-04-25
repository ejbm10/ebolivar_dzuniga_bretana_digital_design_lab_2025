transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/Mux2to1.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/Comparator.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/Register.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/AndGate.sv}
vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/Connect4.sv}

vlog -sv -work work +incdir+C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025 {C:/Users/eboli/Documents/Github/ebolivar_dzuniga_bretana_digital_design_lab_2025/Connect4_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  Connect4_tb

add wave *
view structure
view signals
run -all
