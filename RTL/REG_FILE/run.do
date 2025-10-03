vlib work
vlog  register8_16.v register8_16_tb.v
vsim -voptargs=+acc work.register8_16_tb
add wave *
add wave -position insertpoint  \
sim:/register8_16_tb/DUT/memory
run -all
#quit -sim