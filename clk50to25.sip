set_global_assignment -entity "clk50to25" -library "lib_clk50to25" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "clk50to25" -library "lib_clk50to25" -name IP_TOOL_VERSION "23.1"
set_global_assignment -entity "clk50to25" -library "lib_clk50to25" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_clk50to25" -name SPD_FILE [file join $::quartus(sip_path) "clk50to25.spd"]

set_global_assignment -library "lib_clk50to25" -name MISC_FILE [file join $::quartus(sip_path) "clk50to25_sim/clk50to25.vo"]
