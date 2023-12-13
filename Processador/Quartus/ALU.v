// ENGG56 - PROJETO DE CIRCUITOS INTEGRADOS DIGITAIS
// TRABALHO PRATICO - PROCESSADOR - DATAPATH - ALU
// INTEGRANTES: ANDRE COSTA, DAVID FERRARI, DAVID OLIVEIRA E PALOMA ARIZE.

module ALU (
    input signed [7:0] in1,      // Entrada 1 (8 bits, sinalizada)
    input signed [7:0] in2,      // Entrada 2 (8 bits, sinalizada)
    input [4:0] selector,        // Seletor de operação
    output reg signed [7:0] out,  // Saída da ALU (8 bits, sinalizada)
    output reg carryOut          // Saída de transporte (carry out)
);

`include "Definitions.v"         // Inclui um arquivo de definições externo

always @(*)
begin
    case (selector)
        `OP_ADD: begin
            out = in1 + in2;       // Adição
            carryOut = ((out > 8'd128) || (out < -8'd128)) ? 1'b1 : 1'b0;  // Define carryOut baseado no overflow
        end
        `OP_SUB: out = in1 - in2;  // Subtração
        `OP_MUL: begin
            out = in1 * in2;       // Multiplicação
            carryOut = ((out > 8'd128) || (out < -8'd128)) ? 1'b1 : 1'b0;  // Define carryOut baseado no overflow
        end
        `OP_DIV: out = in1 / in2;  // Divisão
        `OP_AND: out = in1 & in2;  // AND lógico
        `OP_NAND: out = ~(in1 & in2);  // NAND lógico
        `OP_OR: out = in1 | in2;   // OR lógico
        `OP_XOR: out = in1 ^ in2;  // XOR lógico
        `OP_CMP:
            if (in1 > in2)
                out = 8'b00000001;  // Comparação: in1 > in2
            else if (in1 < in2)
                out = 8'b11111111;  // Comparação: in1 < in2
            else
                out = 8'b00000000;  // Comparação: in1 == in2
        `OP_NOT: out = ~in1;        // NOT lógico
        default: begin
            out = 8'b00000000;      // Valor padrão para operações não reconhecidas
            carryOut = 1'b0;        // Valor padrão para carryOut
        end
    endcase
end

endmodule

