
########################### Define Top Module ############################
                                                   
set top_module system_top_dft

##################### Define Working Library Directory ######################
                                                   
define_design_lib work -path ./work

########################### Formality Setup file ############################

set_svf system_top.svf
################## Design Compiler Library Files #setup ######################

puts "###########################################"
puts "#      #setting Design Libraries           #"
puts "###########################################"

#Add the path of the libraries to the search_path variable
lappend search_path /home/IC/Labs/system/std_cells
lappend search_path /home/IC/Labs/system/rtl/ASYNC_FIFO
lappend search_path /home/IC/Labs/system/rtl/UART_RX
lappend search_path /home/IC/Labs/system/rtl/UART_TX
lappend search_path /home/IC/Labs/system/rtl

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Standard Cell libraries 
set target_library [list $SSLIB $TTLIB $FFLIB]

## Standard Cell & Hard Macros libraries 
set link_library [list * $SSLIB $TTLIB $FFLIB]  

######################## Reading RTL Files #################################

analyze -format verilog ALU.v
analyze -format verilog ASYNC_FIFO.v
analyze -format verilog DF_SYNC.v
analyze -format verilog fifo_mem_ctrl.v
analyze -format verilog fifo_wr.v
analyze -format verilog fifo_rd.v
analyze -format verilog int_clk_div.v
analyze -format verilog CLK_GATE.v
analyze -format verilog DATA_SYNC.v
analyze -format verilog PULSE_GEN.v
analyze -format verilog register8_16.v
analyze -format verilog RST_SYNC.v
analyze -format verilog SYS_CTRL.sv
analyze -format verilog data_sampling.v
analyze -format verilog deserializer.v
analyze -format verilog edge_bit_counter.v
analyze -format verilog par_chk.v
analyze -format verilog stp_chk.v
analyze -format verilog strt_chk.v
analyze -format verilog uart_rx_fsm.v
analyze -format verilog UART_RX.v
analyze -format verilog mux.v
analyze -format verilog parity_calc.v
analyze -format verilog Serializer.v
analyze -format verilog uart_tx_fsm.v
analyze -format verilog UART_TX.v
analyze -format verilog CLK_MUX.v
analyze -format verilog UART_TOP.v
analyze -format verilog system_top_dft.v
analyze -format verilog mux2X1.v

elaborate -lib work system_top_dft

current_design $top_module

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## Liniking All The Design Parts ########"
puts "###############################################"
 link

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## checking design consistency ##########"
puts "###############################################"

check_design
############################### Path groups ################################
puts "###############################################"
puts "################ Path groups ##################"
puts "###############################################"

group_path -name INREG -from [all_inputs]
group_path -name REGOUT -to [all_outputs]
group_path -name INOUT -from [all_inputs] -to [all_outputs]

#################### Define Design Constraints #########################
puts "###############################################"
puts "############ Design Constraints #### ##########"
puts "###############################################"

source ./cons.tcl

#################### Archirecture Scan Chains #########################
puts "###############################################"
puts "############ Configure scan chains ############"
puts "###############################################"
set_scan_configuration -clock_mixing no_mix  \
                       -style multiplexed_flip_flop \
                       -replace true -max_length 100 

###################### Mapping and optimization ########################
puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

compile -scan

################################################################### 
# Setting Test Timing Variables
################################################################### 

# Preclock Measure Protocol (default protocol)
set test_default_period 100
set test_default_delay 0
set test_default_bidir_delay 0
set test_default_strobe 20
set test_default_strobe_width 0

########################## Define DFT Signals ##########################

set_dft_signal -port [get_ports scan_clk] -type ScanClock -view existing_dft -timing {50 100}
set_dft_signal -port [get_ports scan_rst] -type Reset -view existing_dft -active_state 0
set_dft_signal -port [get_ports test_mode] -type Constant -view existing_dft -active_state 1
set_dft_signal -port [get_ports test_mode] -type TestMode -view spec -active_state 1
set_dft_signal -port [get_ports SE] -type ScanEnable -view spec -active_state 1 -usage scan
set_dft_signal -port [get_ports SI*] -type ScanDataIn -view spec
set_dft_signal -port [get_ports SO*] -type ScanDataOut -view spec
############################# Create Test Protocol #####################
                                           
create_test_protocol 

###################### Pre-DFT Design Rule Checking ####################

dft_drc -verbose

############################# Preview DFT ##############################

preview_dft -show scan_summary

############################# Insert DFT ###############################

insert_dft


######################## Optimize Logic post DFT #######################

compile -scan -incremental

###################### Design Rule Checking post DFT ###################
dft_drc -verbose -coverage_estimate  > dft_drc_post_dft.rpt

set_svf -off
#############################################################################
# Write out Design after initial compile
#############################################################################

#Avoid Writing assign statements in the netlist

write_file -format verilog -hierarchy -output system_dft_NETLIST.v
write_file -format ddc -hierarchy -output system_dft.ddc
write_sdc  -nosplit system_dft.sdc
write_sdf           system_dft.sdf

####################### reporting ##########################################

report_area -hierarchy > area_dft.rpt
report_power -hierarchy > power_dft.rpt
report_timing -delay_type min > hold_dft.rpt
report_timing -delay_type max > setup_dft.rpt
report_clock -attributes > clocks_dft.rpt
report_constraint -all_violators > constraints_dft.rpt
report_port > ports_dft.rpt

################# starting graphical user interface #######################

#gui_start

#exit

