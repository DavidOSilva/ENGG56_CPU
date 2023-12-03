`timescale 1ns/1ns
module Testbench;

reg	clk;
reg	reset;
wire empty;
wire full;
wire carryOut;
wire [7:0] temp1;
wire [7:0] q_ram_values;
wire [12:0] q_rom_inst;

Processador DUV (.clk(clk), .reset(reset), .temp1(temp1), .q_ram_values(q_ram_values), 
    .q_rom_inst(q_rom_inst), .carryOut(carryOut), .empty(empty), .full(full));

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
