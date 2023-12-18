## Generated SDC file "Processador.out.sdc"

## Copyright (C) 1991-2013 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

## DATE    "Sat Dec 16 14:35:39 2023"

##
## DEVICE  "EP4CGX22CF19C6"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {CPUControl:b2v_inst4|stack_clk} -period 40.000 -waveform { 0.000 20.000 } [get_registers {CPUControl:b2v_inst4|stack_clk}]
create_clock -name {CPUControl:b2v_inst4|alu_selector[0]} -period 40.000 -waveform { 0.000 20.000 } [get_registers {CPUControl:b2v_inst4|alu_selector[0]}]
create_clock -name {clk} -period 40.000 -waveform { 0.000 20.000 } [get_ports {clk}]
create_clock -name {CPUControl:b2v_inst4|inst_ram_clk} -period 40.000 -waveform { 0.000 20.000 } [get_registers {CPUControl:b2v_inst4|inst_ram_clk}]
create_clock -name {CPUControl:b2v_inst4|ir[0]} -period 40.000 -waveform { 0.000 20.000 } [get_registers {CPUControl:b2v_inst4|ir[0]}]
create_clock -name {CPUControl:b2v_inst4|state.00000} -period 40.000 -waveform { 0.000 20.000 } [get_registers {CPUControl:b2v_inst4|state.00000}]
create_clock -name {CPUControl:b2v_inst4|push} -period 40.000 -waveform { 0.000 20.000 } [get_registers {CPUControl:b2v_inst4|push}]
create_clock -name {CPUControl:b2v_inst4|state.00010} -period 40.000 -waveform { 0.000 20.000 } [get_registers {CPUControl:b2v_inst4|state.00010}]
create_clock -name {CPUControl:b2v_inst4|values_ram_clk} -period 40.000 -waveform { 0.000 20.000 } [get_registers {CPUControl:b2v_inst4|values_ram_clk}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|values_ram_clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|values_ram_clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|values_ram_clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|values_ram_clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|values_ram_clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|values_ram_clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|values_ram_clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|values_ram_clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|values_ram_clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|values_ram_clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|values_ram_clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|values_ram_clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -rise_to [get_clocks {CPUControl:b2v_inst4|values_ram_clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -fall_to [get_clocks {CPUControl:b2v_inst4|values_ram_clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -rise_to [get_clocks {CPUControl:b2v_inst4|push}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -fall_to [get_clocks {CPUControl:b2v_inst4|push}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -rise_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -fall_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -rise_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -fall_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -rise_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -fall_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -rise_to [get_clocks {CPUControl:b2v_inst4|stack_clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -fall_to [get_clocks {CPUControl:b2v_inst4|stack_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -rise_to [get_clocks {CPUControl:b2v_inst4|values_ram_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -fall_to [get_clocks {CPUControl:b2v_inst4|values_ram_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -rise_to [get_clocks {CPUControl:b2v_inst4|push}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -fall_to [get_clocks {CPUControl:b2v_inst4|push}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -rise_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -fall_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -rise_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -fall_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -rise_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -fall_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -rise_to [get_clocks {CPUControl:b2v_inst4|stack_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00010}] -fall_to [get_clocks {CPUControl:b2v_inst4|stack_clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|push}] -rise_to [get_clocks {CPUControl:b2v_inst4|push}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|push}] -fall_to [get_clocks {CPUControl:b2v_inst4|push}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|push}] -rise_to [get_clocks {CPUControl:b2v_inst4|stack_clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|push}] -fall_to [get_clocks {CPUControl:b2v_inst4|stack_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|push}] -rise_to [get_clocks {CPUControl:b2v_inst4|push}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|push}] -fall_to [get_clocks {CPUControl:b2v_inst4|push}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|push}] -rise_to [get_clocks {CPUControl:b2v_inst4|stack_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|push}] -fall_to [get_clocks {CPUControl:b2v_inst4|stack_clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -rise_to [get_clocks {CPUControl:b2v_inst4|values_ram_clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -fall_to [get_clocks {CPUControl:b2v_inst4|values_ram_clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -rise_to [get_clocks {CPUControl:b2v_inst4|push}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -fall_to [get_clocks {CPUControl:b2v_inst4|push}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -rise_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -fall_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -rise_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -fall_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -rise_to [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -fall_to [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -rise_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -fall_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -rise_to [get_clocks {CPUControl:b2v_inst4|stack_clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -fall_to [get_clocks {CPUControl:b2v_inst4|stack_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -rise_to [get_clocks {CPUControl:b2v_inst4|values_ram_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -fall_to [get_clocks {CPUControl:b2v_inst4|values_ram_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -rise_to [get_clocks {CPUControl:b2v_inst4|push}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -fall_to [get_clocks {CPUControl:b2v_inst4|push}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -rise_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -fall_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -rise_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -fall_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -rise_to [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -fall_to [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -rise_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -fall_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -rise_to [get_clocks {CPUControl:b2v_inst4|stack_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|state.00000}] -fall_to [get_clocks {CPUControl:b2v_inst4|stack_clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -rise_to [get_clocks {CPUControl:b2v_inst4|values_ram_clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -fall_to [get_clocks {CPUControl:b2v_inst4|values_ram_clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -rise_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -fall_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -rise_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -fall_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -rise_to [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -fall_to [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -rise_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -fall_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -rise_to [get_clocks {CPUControl:b2v_inst4|values_ram_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -fall_to [get_clocks {CPUControl:b2v_inst4|values_ram_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -rise_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -fall_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -rise_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -fall_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -rise_to [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -fall_to [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -rise_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|ir[0]}] -fall_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|values_ram_clk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|values_ram_clk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|push}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|push}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|stack_clk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|stack_clk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|values_ram_clk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|values_ram_clk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|push}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|push}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|stack_clk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|stack_clk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}] -rise_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}] -fall_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}] -rise_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}] -fall_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}] -rise_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}] -fall_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}] -rise_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}] -fall_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}] -rise_to [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}] -fall_to [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}] -rise_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}] -fall_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}] -rise_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}] -fall_to [get_clocks {CPUControl:b2v_inst4|ir[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}] -rise_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}] -fall_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}] -rise_to [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}] -fall_to [get_clocks {CPUControl:b2v_inst4|inst_ram_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}] -rise_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}] -fall_to [get_clocks {CPUControl:b2v_inst4|alu_selector[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|stack_clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|stack_clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|stack_clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|push}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|stack_clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|push}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|stack_clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|stack_clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|stack_clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|stack_clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CPUControl:b2v_inst4|stack_clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|stack_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|stack_clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|stack_clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00010}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|stack_clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|push}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|stack_clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|push}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|stack_clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|stack_clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|state.00000}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|stack_clk}] -rise_to [get_clocks {CPUControl:b2v_inst4|stack_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CPUControl:b2v_inst4|stack_clk}] -fall_to [get_clocks {CPUControl:b2v_inst4|stack_clk}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************
set_input_delay -add_delay  -clock [get_clocks {clk}]  2.000 [get_ports {clk}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  2.000 [get_ports {reset}]


#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

