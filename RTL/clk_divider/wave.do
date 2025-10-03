onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /int_clk_div_tb/DUT/i_rst_n
add wave -noupdate /int_clk_div_tb/DUT/clk_div_en
add wave -noupdate /int_clk_div_tb/DUT/i_clk_en
add wave -noupdate /int_clk_div_tb/DUT/odd
add wave -noupdate /int_clk_div_tb/DUT/i_ref_clk
add wave -noupdate -color {Orange Red} /int_clk_div_tb/DUT/o_div_clk
add wave -noupdate -color White /int_clk_div_tb/DUT/i_div_ratio
add wave -noupdate /int_clk_div_tb/DUT/half_togg_pl
add wave -noupdate /int_clk_div_tb/DUT/half_togg
add wave -noupdate /int_clk_div_tb/DUT/flag
add wave -noupdate -color Blue /int_clk_div_tb/DUT/counter
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {195 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {557 ns}
