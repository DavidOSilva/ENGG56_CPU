// ENGG56 - PROJETO DE CIRCUITOS INTEGRADOS DIGITAIS
// TRABALHO PRATICO - PROCESSADOR - DATAPATH - CPUREGISTERS
// INTEGRANTES: ANDRE COSTA, DAVID FERRARI, DAVID OLIVEIRA E PALOMA ARIZE.

module CPURegisters(
  input wire clk,             // Sinal de clock de entrada
  input wire [7:0] data_in,   // Dados de entrada de 8 bits
  input wire sel_in,          // Sinal de seleção de registrador
  input wire enable_write,    // Sinal de escrita habilitado
  output wire [7:0] temp1,     // Saída temporária 1
  output wire [7:0] temp2      // Saída temporária 2
);

  reg [7:0] registers[0:1];    // Declaração de dois registradores de 8 bits

  always @ (posedge clk) begin
    if (enable_write)
      registers[sel_in] = data_in;  // Escreve dados no registrador selecionado quando a escrita está habilitada
  end
  
  assign temp1 = registers[0];      // Atribui o valor do primeiro registrador à saída temp1
  assign temp2 = registers[1];      // Atribui o valor do segundo registrador à saída temp2
endmodule

