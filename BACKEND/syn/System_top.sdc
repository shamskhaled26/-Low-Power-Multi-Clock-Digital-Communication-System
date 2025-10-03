###################################################################

# Created by write_sdc on Sat Sep 27 03:50:09 2025

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -max_library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -min scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c -min_library scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c
set_wire_load_model -name tsmc13_wl20 -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c [get_ports RX_IN]
set_load -pin_load 0.1 [get_ports TX_OUT]
set_load -pin_load 0.1 [get_ports Parity_Error]
set_load -pin_load 0.1 [get_ports Stop_Error]
create_clock [get_ports REF_CLK]  -name clk1  -period 20  -waveform {0 10}
set_clock_latency 0  [get_clocks clk1]
set_clock_uncertainty -setup 0.2  [get_clocks clk1]
set_clock_uncertainty -hold 0.1  [get_clocks clk1]
set_clock_transition -max -rise 0.05 [get_clocks clk1]
set_clock_transition -max -fall 0.05 [get_clocks clk1]
set_clock_transition -min -rise 0.05 [get_clocks clk1]
set_clock_transition -min -fall 0.05 [get_clocks clk1]
create_clock [get_ports UART_CLK]  -name clk2  -period 271.3  -waveform {0 135.65}
set_clock_latency 0  [get_clocks clk2]
set_clock_uncertainty -setup 0.2  [get_clocks clk2]
set_clock_uncertainty -hold 0.1  [get_clocks clk2]
set_clock_transition -max -rise 0.05 [get_clocks clk2]
set_clock_transition -max -fall 0.05 [get_clocks clk2]
set_clock_transition -min -rise 0.05 [get_clocks clk2]
set_clock_transition -min -fall 0.05 [get_clocks clk2]
create_generated_clock [get_pins CLK_GATE/GATED_CLK]  -name gated_clk  -source [get_pins CLK_GATE/CLK]  -master_clock clk1  -divide_by 1  -add
set_clock_latency 0  [get_clocks gated_clk]
set_clock_uncertainty -setup 0.2  [get_clocks gated_clk]
set_clock_uncertainty -hold 0.1  [get_clocks gated_clk]
create_generated_clock [get_pins int_clk_div_tx/o_div_clk]  -name tx_clk  -source [get_pins int_clk_div_tx/i_ref_clk]  -master_clock clk2  -divide_by 1  -add
set_clock_latency 0  [get_clocks tx_clk]
set_clock_uncertainty -setup 0.2  [get_clocks tx_clk]
set_clock_uncertainty -hold 0.1  [get_clocks tx_clk]
create_generated_clock [get_pins int_clk_div_rx/o_div_clk]  -name rx_clk  -source [get_pins int_clk_div_rx/i_ref_clk]  -master_clock clk2  -divide_by 32  -add
set_clock_latency 0  [get_clocks rx_clk]
set_clock_uncertainty -setup 0.2  [get_clocks rx_clk]
set_clock_uncertainty -hold 0.1  [get_clocks rx_clk]
group_path -name INOUT  -from [list [get_ports REF_CLK] [get_ports RST] [get_ports UART_CLK] [get_ports RX_IN]]  -to [list [get_ports TX_OUT] [get_ports Parity_Error] [get_ports Stop_Error]]
group_path -name INREG  -from [list [get_ports REF_CLK] [get_ports RST] [get_ports UART_CLK] [get_ports RX_IN]]
group_path -name REGOUT  -to [list [get_ports TX_OUT] [get_ports Parity_Error] [get_ports Stop_Error]]
set_input_delay -clock clk1  4  [get_ports RX_IN]
set_output_delay -clock clk1  4  [get_ports TX_OUT]
set_output_delay -clock clk1  4  [get_ports Parity_Error]
set_output_delay -clock clk1  4  [get_ports Stop_Error]
set_clock_groups -asynchronous -name clk1_1 -group [list [get_clocks clk1] [get_clocks gated_clk]] -group [list [get_clocks clk2] [get_clocks tx_clk] [get_clocks rx_clk]]
