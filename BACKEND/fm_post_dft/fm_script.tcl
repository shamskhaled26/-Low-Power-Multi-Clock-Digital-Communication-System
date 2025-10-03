
###################################################################
########################### Variables #############################
###################################################################

set SSLIB "/home/IC/Labs/system/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/Labs/system/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/Labs/system/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"
###################################################################
############################ Guidance #############################
###################################################################

# Synopsys setup variable
set synopsys_auto_setup true

# Formality Setup File
set_svf "/home/IC/Labs/system/dft/system_top.svf"

###################################################################
###################### Reference Container ########################
###################################################################

# Read Reference Design Verilog Files
read_verilog -container Ref "/home/IC/Labs/system/rtl/ASYNC_FIFO/ASYNC_FIFO.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/ASYNC_FIFO/DF_SYNC.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/ASYNC_FIFO/fifo_mem_ctrl.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/ASYNC_FIFO/fifo_wr.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/ASYNC_FIFO/fifo_rd.v"

read_verilog -container Ref "/home/IC/Labs/system/rtl/UART_TX/uart_tx_fsm.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/UART_TX/UART_TX.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/UART_TX/Serializer.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/UART_TX/parity_calc.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/UART_TX/mux.v"

read_verilog -container Ref "/home/IC/Labs/system/rtl/UART_RX/uart_rx_fsm.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/UART_RX/data_sampling.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/UART_RX/deserializer.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/UART_RX/edge_bit_counter.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/UART_RX/par_chk.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/UART_RX/stp_chk.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/UART_RX/strt_chk.v"  
read_verilog -container Ref "/home/IC/Labs/system/rtl/UART_RX/UART_RX.v"

read_verilog -container Ref "/home/IC/Labs/system/rtl/ALU.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/register8_16.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/RST_SYNC.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/int_clk_div.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/CLK_GATE.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/DATA_SYNC.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/PULSE_GEN.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/CLK_MUX.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/UART_TOP.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/system_top_dft.v"
read_verilog -container Ref "/home/IC/Labs/system/rtl/SYS_CTRL.sv"

read_verilog -container Ref "/home/IC/Labs/system/rtl/mux2X1.v"
# Read Reference technology libraries

read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

# set the top Reference Design 
set_reference_design system_top_dft
set_top system_top_dft

###################################################################
#################### Implementation Container #####################
###################################################################



# Read Implementation Design Files
read_verilog -netlist -container Imp "/home/IC/Labs/system/dft/system_dft_NETLIST.v"


# Read Implementation technology libraries

read_db -container Imp [list $SSLIB $TTLIB $FFLIB]

# set the top Implementation Design

set_implementation_design system_top_dft
set_top system_top_dft



########################## Don't verify ###########################

# do not verify scan in & scan out ports as a compare point as it is existed only after synthesis and not existed in the RTL

#scan in
#set_dont_verify_points -type port Ref:/WORK/*/SI
#set_dont_verify_points -type port Imp:/WORK/*/SI

#scan_out
set_dont_verify_points -type port Ref:/WORK/*/SO
set_dont_verify_points -type port Imp:/WORK/*/SO
############################### contants #####################################

# all atpg enable (test_mode, scan_enable) are zero during formal compare

#test_mode
set_constant Ref:/WORK/*/test_mode 0
set_constant Imp:/WORK/*/test_mode 0

#scan_enable
set_constant Ref:/WORK/*/SE 0
set_constant Imp:/WORK/*/SE 0

###################### Matching Compare points ####################
match

######################### Run Verification ########################

set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}


########################### Reporting ############################# 
report_passing_points > "passing_points.rpt"
report_failing_points > "failing_points.rpt"
report_aborted_points > "aborted_points.rpt"
report_unverified_points > "unverified_points.rpt"


start_gui


