
# Constraints
# ----------------------------------------------------------------------------
#
# 1. Master Clock Definitions
#
# 2. Generated Clock Definitions
#
# 3. Clock Uncertainties
#
# 4. Clock Latencies 
#
# 5. Clock Relationships
#
# 6. set input/output delay on ports
#
# 7. Driving cells
#
# 8. Output load

####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 4. Clock Transitions
####################################################################################

set REF_CLK clk1
set UART_CLK clk2

set CLK_PER 20
set UART_PER 271.3

set CLK_SETUP_SKEW 0.2
set CLK_HOLD_SKEW 0.1
set CLK_LAT 0
set CLK_RISE 0.05
set CLK_FALL 0.05

set CLK_TRAN 0.05

# 1. Master Clock Definitions

create_clock -period $CLK_PER -name clk1 [get_ports REF_CLK] 
create_clock -period $UART_PER -name clk2 [get_ports UART_CLK]
# 2. Generated Clock Definitions
create_generated_clock -master_clock "clk1" -source [get_pins CLK_GATE/CLK] -name "gated_clk"  [get_pins CLK_GATE/GATED_CLK] -divide_by 1
create_generated_clock -master_clock "clk2" -source [get_pins int_clk_div_tx/i_ref_clk] -name "tx_clk"  [get_pins int_clk_div_tx/o_div_clk] -divide_by 1
create_generated_clock -master_clock "clk2" -source [get_pins int_clk_div_rx/i_ref_clk] -name "rx_clk"  [get_pins int_clk_div_rx/o_div_clk] -divide_by 32


# 3. Clock Latencies
set_clock_latency $CLK_LAT [get_clocks clk1]
set_clock_latency $CLK_LAT [get_clocks clk2]
set_clock_latency $CLK_LAT [get_clocks gated_clk]
set_clock_latency $CLK_LAT [get_clocks tx_clk]
set_clock_latency $CLK_LAT [get_clocks rx_clk]


# 4. Clock Uncertainties
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks clk1] 
set_clock_uncertainty -hold $CLK_HOLD_SKEW [get_clocks clk1] 

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks clk2] 
set_clock_uncertainty -hold $CLK_HOLD_SKEW [get_clocks clk2] 

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks gated_clk] 
set_clock_uncertainty -hold $CLK_HOLD_SKEW [get_clocks gated_clk] 

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks tx_clk] 
set_clock_uncertainty -hold $CLK_HOLD_SKEW [get_clocks tx_clk] 

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks rx_clk] 
set_clock_uncertainty -hold $CLK_HOLD_SKEW [get_clocks rx_clk] 


		   
# 5. Clock Transitions
set_clock_transition $CLK_TRAN [get_clock clk1]
set_clock_transition $CLK_TRAN [get_clocks clk2]

					  

####################################################################################
           #########################################################
                  #### Section 2 : Clocks Relationships ####
           #########################################################
####################################################################################
## clk grouping 
set clks_master_gen  {clk1 clk2 gated_clk tx_clk rx_clk}
set_clock_groups -asynchronous \
   -group [get_clocks {clk1 gated_clk}] \
   -group [get_clocks {clk2 tx_clk rx_clk}] 


####################################################################################
           #########################################################
             #### Section 3 : set input/output delay on ports ####
           #########################################################
####################################################################################

set in_delay  [expr 0.2*$CLK_PER]
set out_delay [expr 0.2*$CLK_PER]


#Constrain Input Paths
set input_list {list RX_IN}
set output_list {list TX_OUT Parity_Error Stop_Error}


set_input_delay $in_delay -clock clk1 [get_ports $input_list]
set_output_delay $out_delay -clock clk1 [get_ports $output_list]

set_dont_touch_network [get_ports {REF_CLK UART_CLK}]
set_dont_touch_network [get_pins  {CLK_GATE/GATED_CLK int_clk_div_tx/TX_CLK int_clk_div_rx/RX_CLK}]


#Constrain Output Paths

####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M [get_ports $input_list]

####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################
set out_load 0.1
set_load $out_load [get_ports $output_list]

####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis
set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" \
			 -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################
           #########################################################
                  #### Section 7 : wireload Model ####
           #########################################################
####################################################################################

set_wire_load_model -name "tsmc13_wl20" -library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"
####################################################################################
           #########################################################
                  #### Section 8 : multicycle path ####
           #########################################################
####################################################################################


###################### Mapping and optimization ########################
puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

compile -map_effort high

#############################################################################
# Write out Design after initial compile
#############################################################################
write_file -format verilog -hierarchy -output System_top.v
write_file -format ddc -hierarchy -output System_top.ddc
write_sdc -nosplit System_top.sdc
write_sdf 	System_top.sdf
################# reporting #######################
report_power -hierarchy > power.rpt
report_area -hierarchy > area.rpt
report_timing -max_paths 100 -delay_type max > setup.rpt
report_timing -max_paths 100 -delay_type min > hold.rpt
report_clock -attributes > clocks.rpt
report_constraint -all_violators > constraints.rpt



