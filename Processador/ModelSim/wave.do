onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Testbench/clk
add wave -noupdate /Testbench/reset
add wave -noupdate /Testbench/empty
add wave -noupdate /Testbench/full
add wave -noupdate /Testbench/carryOut
add wave -noupdate /Testbench/temp1
add wave -noupdate /Testbench/q_ram_values
add wave -noupdate /Testbench/q_rom_inst
add wave -noupdate /Testbench/DUV/b2v_inst4/ip
add wave -noupdate /Testbench/DUV/b2v_inst4/values_ram_clk
add wave -noupdate /Testbench/DUV/b2v_inst4/inst_ram_clk
add wave -noupdate /Testbench/DUV/b2v_inst4/ir
add wave -noupdate /Testbench/DUV/b2v_inst4/state
add wave -noupdate /Testbench/DUV/b2v_inst4/future_state
add wave -noupdate /Testbench/DUV/b2v_inst4/bus_values_data
add wave -noupdate /Testbench/DUV/b2v_inst4/bus_inst_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {130 ns} 0}
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
WaveRestoreZoom {0 ns} {556 ns}
