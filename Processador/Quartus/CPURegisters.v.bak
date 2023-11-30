module CPURegisters(
  input wire clk,
  input wire [7:0] data_in,
  input wire sel_in,
  input wire enable_write,
  output wire [7:0] temp1,
  output wire [7:0] temp2
);

  reg [7:0] registers[0:1];

  always @ (posedge clk) begin
    if (enable_write)
      registers[sel_in] = data_in;
  end
  
  assign temp1 = registers[0];
  assign temp2 = registers[1];
endmodule
