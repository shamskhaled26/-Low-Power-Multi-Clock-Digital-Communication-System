########################### Define Top Module ############################
                                                   
set top_module system_top
##################### Define Working Library Directory ######################
                                                   
define_design_lib work -path ./work

set_svf system.svf
################## Design Compiler Library Files ######################
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
analyze -format verilog system_top.v

elaborate -lib work system_top

current_design $top_module

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

source -echo ./cons.tcl

###################### Mapping and optimization ########################
puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

compile -map_effort high

set_svf -off

#############################################################################
# Write out Design after initial compile
#############################################################################


################# reporting #######################


################# starting graphical user interface #######################

#gui_start
