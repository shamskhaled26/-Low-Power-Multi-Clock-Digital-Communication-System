onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /DATA_SYNC_tb/CLK_PERIOD
add wave -noupdate /DATA_SYNC_tb/data_width
add wave -noupdate /DATA_SYNC_tb/NUM_STAGES
add wave -noupdate /DATA_SYNC_tb/clk
add wave -noupdate /DATA_SYNC_tb/rst
add wave -noupdate -color Goldenrod /DATA_SYNC_tb/bus_enable
add wave -noupdate -color Cyan /DATA_SYNC_tb/unsync_bus
add wave -noupdate /DATA_SYNC_tb/enable_pulse
add wave -noupdate -color {Violet Red} /DATA_SYNC_tb/sync_bus
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {77321 ps} 0}
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {304500 ps}
