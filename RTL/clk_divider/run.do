vlib work
vlog -f src_files.list
vsim -voptargs=+acc work.int_clk_div_tb
do wave.do
run -all
#quit -sim