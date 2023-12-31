`timescale 1ns/1ns
module Testbench;

reg	clk;
reg	reset;
wire empty;
wire full;
wire carryOut;
wire [7:0] temp1;
wire [7:0] temp2;
wire [7:0] q_ram_values;
wire [12:0] q_rom_inst;
wire [7:0] alu_output;
wire [7:0] stack_output;

Processador CPU (
	.clk(clk),
	.reset(rst),
	.carryOut(carryOut),
	.empty(empty),
	.full(full),
	.alu_output(alu_output),
	.q_ram_values(q_ram_values),
	.stack_output(stack_output),
	.temp1(temp1),
	.temp2(temp2)
);

always #100 clk = !clk;

initial
begin
    clk = 0;
    reset = 0;
    $stop;
end

initial
begin
    #10000
    $stop;
end

endmodule 
