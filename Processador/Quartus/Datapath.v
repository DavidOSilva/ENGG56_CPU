module Datapath(
input [4:0] alu_sel,
input stack_pop,
input stack_push,
input stack_clk,
input stack_rstn,
input [7:0] stack_din,
input clk,
input reg_sel,
input reg_we,
input [7:0] reg_din,
output [7:0] alu_output,
output alu_carry,
output stack_full,
output stack_empty,
output [7:0] stack_dout,
output [7:0] temp1,
output [7:0] temp2
);

wire [7:0] reg_to_aluin1, reg_to_aluin2;
assign temp1 = reg_to_aluin1;
assign temp2 = reg_to_aluin2;

Stack stack (.clk(stack_clk), .rstn(stack_rstn), .pop(stack_pop), .push(stack_push), .empty(stack_empty), .full(stack_full), .din(stack_din), .dout(stack_dout));

ALU alu (.in1(reg_to_aluin1), .in2(reg_to_aluin2), .selector(alu_sel), .out(alu_output), .carryOut(alu_carry));

CPURegisters registers (.clk(clk), .data_in(reg_din), .sel_in(reg_sel), .enable_write(reg_we), .temp1(reg_to_aluin1), .temp2(reg_to_aluin2));

endmodule