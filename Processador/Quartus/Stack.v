module Stack(
  clk,
  rstn,
  pop,
  push,
  empty,
  full,
  din,
  dout
);

  parameter WIDTH = 8;
  parameter DEPTH = 8;

  input clk;
  input rstn;
  input pop;
  input push;
  input [WIDTH-1:0] din;

  output [WIDTH-1:0] dout;
  output empty;
  output full;

  reg [WIDTH-1:0] stack[DEPTH-1:0]; // Memória da pilha
  reg [WIDTH-1:0] index, next_index; 
  reg [WIDTH-1:0] dout, next_dout;

  wire empty, full;

  always @(posedge clk) // Bloco sequencial
  begin
    if (!rstn)
    begin
      dout  <= 8'd0;    // Inicializa o dado de saída em 0
      index <= 1'b0;    // Inicializa o índice em 0
    end
    else
    begin
      dout  <= next_dout;  // Atualiza o dado de saída com o próximo valor
      index <= next_index; // Atualiza o índice com o próximo valor
    end
  end

  assign empty = !(|index);         // A pilha está vazia se o índice for 0
  assign full  = !(|(index ^ DEPTH)); // A pilha está cheia se o índice alcançar a profundidade

  always @(*) // Bloco combinacional
  begin
    if (push) // Operação de escrita
    begin
      stack[index] = din;    // Armazena o dado de entrada na posição atual do índice
      next_index   = index + 1'b1; // Incrementa o índice para a próxima posição
    end
    else if (pop) // Operação de leitura
    begin
      next_dout  = stack[index - 1'b1]; // Lê o dado da posição anterior ao índice atual
      next_index = index - 1'b1;        // Decrementa o índice para a posição anterior
    end
    else
    begin
      next_dout  = dout;   // Mantém o dado de saída inalterado
      next_index = index;  // Mantém o índice inalterado
    end
  end
endmodule