vlib work
vlog arithmetic_unit.v logic_unit.v cmp_unit.v SHIFT_unit.v decoder.v  ALU_TOP.v alu_tb.v
vsim -voptargs=+acc work.alu_tb
add wave *
run -all
#quit -sim