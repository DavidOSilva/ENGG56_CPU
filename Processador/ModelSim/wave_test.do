onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /ControlTransferTestbench/DUV/b2v_inst4/state
add wave -noupdate -radix binary /ControlTransferTestbench/DUV/b2v_inst4/ir
add wave -noupdate -radix decimal /ControlTransferTestbench/DUV/b2v_inst5/stack/stack
add wave -noupdate -radix decimal /ControlTransferTestbench/DUV/b2v_inst5/stack/index
add wave -noupdate -radix decimal /ControlTransferTestbench/DUV/b2v_inst5/alu/in1
add wave -noupdate -radix decimal /ControlTransferTestbench/DUV/b2v_inst5/alu/in2
add wave -noupdate -radix decimal /ControlTransferTestbench/DUV/q_ram_values
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {524 ns} 0}
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
WaveRestoreZoom {0 ns} {4425 ns}
