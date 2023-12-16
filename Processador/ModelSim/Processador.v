// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
// CREATED		"Fri Dec 15 20:19:56 2023"

module Processador(
	clk,
	reset,
	carryOut,
	empty,
	full,
	alu_output,
	q_ram_values,
	stack_output,
	temp1
);


input wire	clk;
input wire	reset;
output wire	carryOut;
output wire	empty;
output wire	full;
output wire	[7:0] alu_output;
output wire	[7:0] q_ram_values;
output wire	[7:0] stack_output;
output wire	[7:0] temp1;

wire	[7:0] data_from_stack;
wire	push;
wire	reset_controller;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[7:0] SYNTHESIZED_WIRE_2;
wire	[7:0] SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_4;
wire	[7:0] SYNTHESIZED_WIRE_5;
wire	[7:0] SYNTHESIZED_WIRE_6;
wire	[12:0] SYNTHESIZED_WIRE_7;
wire	[7:0] SYNTHESIZED_WIRE_8;
wire	[7:0] SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	[4:0] SYNTHESIZED_WIRE_15;
wire	[7:0] SYNTHESIZED_WIRE_17;

assign	alu_output = SYNTHESIZED_WIRE_6;
assign	q_ram_values = SYNTHESIZED_WIRE_8;
assign	temp1 = SYNTHESIZED_WIRE_9;




ValuesRAM	b2v_inst(
	.wren(SYNTHESIZED_WIRE_0),
	.clock(SYNTHESIZED_WIRE_1),
	.address(SYNTHESIZED_WIRE_2),
	.data(SYNTHESIZED_WIRE_18),
	.q(SYNTHESIZED_WIRE_8));


InstructionsROM	b2v_inst13(
	.clock(SYNTHESIZED_WIRE_4),
	.address(SYNTHESIZED_WIRE_5),
	.q(SYNTHESIZED_WIRE_7));


CPUControl	b2v_inst4(
	.clk(clk),
	.reset(reset_controller),
	.alu_result(SYNTHESIZED_WIRE_6),
	.bus_inst_data(SYNTHESIZED_WIRE_7),
	.bus_values_data(SYNTHESIZED_WIRE_8),
	.data_from_stack(data_from_stack),
	.temp1(SYNTHESIZED_WIRE_9),
	.reg_selector(SYNTHESIZED_WIRE_13),
	.rst(SYNTHESIZED_WIRE_12),
	.stack_clk(SYNTHESIZED_WIRE_11),
	.values_ram_clk(SYNTHESIZED_WIRE_1),
	.inst_ram_clk(SYNTHESIZED_WIRE_4),
	.ew_reg(SYNTHESIZED_WIRE_14),
	.pop(SYNTHESIZED_WIRE_10),
	.push(push),
	.ew_ram_values(SYNTHESIZED_WIRE_0),
	.alu_selector(SYNTHESIZED_WIRE_15),
	.data_to_push(SYNTHESIZED_WIRE_17),
	.ip(SYNTHESIZED_WIRE_5),
	.values_addr(SYNTHESIZED_WIRE_2),
	.values_data(SYNTHESIZED_WIRE_18));


Datapath	b2v_inst5(
	.stack_pop(SYNTHESIZED_WIRE_10),
	.stack_push(push),
	.stack_clk(SYNTHESIZED_WIRE_11),
	.stack_rstn(SYNTHESIZED_WIRE_12),
	.clk(clk),
	.reg_sel(SYNTHESIZED_WIRE_13),
	.reg_we(SYNTHESIZED_WIRE_14),
	.alu_sel(SYNTHESIZED_WIRE_15),
	.reg_din(SYNTHESIZED_WIRE_18),
	.stack_din(SYNTHESIZED_WIRE_17),
	.alu_carry(carryOut),
	.stack_full(full),
	.stack_empty(empty),
	.alu_output(SYNTHESIZED_WIRE_6),
	.stack_dout(data_from_stack),
	.temp1(SYNTHESIZED_WIRE_9));

assign	reset_controller = reset;
assign	stack_output = data_from_stack;

endmodule
