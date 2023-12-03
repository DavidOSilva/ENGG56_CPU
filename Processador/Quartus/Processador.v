// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
// CREATED		"Sun Dec  3 04:19:55 2023"

module Processador(
	clk,
	reset,
	carryOut,
	empty,
	full,
	q_ram_values,
	temp1,
    q_rom_inst
);


input wire	clk;
input wire	reset;
output wire	carryOut;
output wire	empty;
output wire	full;
output wire	[7:0] q_ram_values;
output wire	[7:0] temp1;
output wire [12:0] q_rom_inst;

wire	[7:0] alu_result;
wire	[4:0] alu_selector;
wire	[7:0] data_bus;
wire	[7:0] data_from_stack;
wire	[7:0] data_to_push;
wire	enable_write_reg;
wire	[7:0] inst_addr;
wire	[12:0] inst_bus;
wire	inst_ram_clk;
wire	pop;
wire	push;
wire	reg_selector;
wire	reset_controller;
wire	reset_output;
wire	stack_clk;
wire	[7:0] temp1_enter_processor;
wire	[7:0] values_addr;
wire	[7:0] values_data;
wire	values_ram_clk;
wire	SYNTHESIZED_WIRE_0;
wire	[7:0] SYNTHESIZED_WIRE_1;





ValuesRAM	b2v_inst(
	.wren(SYNTHESIZED_WIRE_0),
	.clock(values_ram_clk),
	.address(values_addr),
	.data(values_data),
	.q(data_bus));


InstructionsROM	b2v_inst13(
	.clock(inst_ram_clk),
	.address(inst_addr),
	.q(inst_bus));


CPURegisters	b2v_inst15(
	.clk(clk),
	.sel_in(reg_selector),
	.enable_write(enable_write_reg),
	.data_in(values_data),
	.temp1(temp1_enter_processor),
	.temp2(SYNTHESIZED_WIRE_1));


ALU	b2v_inst2(
	.in1(temp1_enter_processor),
	.in2(SYNTHESIZED_WIRE_1),
	.selector(alu_selector),
	.carryOut(carryOut),
	.out(alu_result));


Stack	b2v_inst3(
	.clk(stack_clk),
	.rstn(reset_output),
	.pop(pop),
	.push(push),
	.din(data_to_push),
	.empty(empty),
	.full(full),
	.dout(data_from_stack));
	defparam	b2v_inst3.DEPTH = 8;
	defparam	b2v_inst3.WIDTH = 8;


CPUControl	b2v_inst4(
	.clk(clk),
	.reset(reset_controller),
	.alu_result(alu_result),
	.bus_inst_data(inst_bus),
	.bus_values_data(data_bus),
	.data_from_stack(data_from_stack),
	.temp1(temp1_enter_processor),
	.reg_selector(reg_selector),
	.rst(reset_output),
	.stack_clk(stack_clk),
	.values_ram_clk(values_ram_clk),
	.inst_ram_clk(inst_ram_clk),
	.ew_reg(enable_write_reg),
	.pop(pop),
	.push(push),
	.ew_ram_values(SYNTHESIZED_WIRE_0),
	.alu_selector(alu_selector),
	.data_to_push(data_to_push),
	.ip(inst_addr),
	.values_addr(values_addr),
	.values_data(values_data));

assign	reset_controller = reset;
assign	q_ram_values = data_bus;
assign	temp1 = temp1_enter_processor;
assign	q_rom_inst = inst_bus;

endmodule
