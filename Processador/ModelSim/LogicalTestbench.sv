`timescale 1ns/1ns
module LogicalTestbench;

reg	clk;
reg	reset;
wire empty;
wire full;
wire carryOut;
wire [7:0] temp1;
wire [7:0] q_ram_values;

Processador DUV (.clk(clk), .reset(reset), .temp1(temp1), .q_ram_values(q_ram_values), 
    .carryOut(carryOut), .empty(empty), .full(full));

`include "Definitions.v"

always #100 clk = !clk;
reg [7:0] idx;
string cenario;
integer valor_esperado;
integer cenarios_sucesso;
integer total_cenarios;

initial
begin
    clk = 0;
    reset = 0;
    idx = 0;
    valor_esperado = 0;
    cenarios_sucesso = 0;
    total_cenarios = 8;
    $stop;
end

initial
begin
    #55650
    $display("*********************** Inicia testes de instrucoes de logica ***********************");
end

initial
begin
    #79000
    display_resultados;
    $stop;
end

always @ (DUV.b2v_inst4.state) 
begin
    case (DUV.b2v_inst4.ir)
        `OP_AND:    begin
                        cenario = "AND";
                        valor_esperado = 0;
                        testa_logica;
                    end
        `OP_OR:    begin
                        cenario = "OR";
                        valor_esperado = 15;
                        testa_logica;
                    end
        `OP_NOT:    begin
                        cenario = "NOT";
                        valor_esperado = -16;
                        testa_logica;
                    end
        `OP_NAND:    begin
                        cenario = "NAND";
                        valor_esperado = -65;
                        testa_logica;
                    end
        `OP_XOR:    begin
                        cenario = "XOR";
                        valor_esperado = -5;
                        testa_logica;
                    end
        `OP_CMP:    begin
                        decide_cenario_cmp;
                        testa_logica;
                    end
    endcase
end

task testa_logica;
begin
    if(DUV.b2v_inst4.state == `STATE_PUSH_TO_STACK)
    begin
        $display("--------------------Inicia teste %s--------------------", cenario);
        idx = DUV.b2v_inst5.stack.index;
        display_tos;
        display_operandos;
        if($signed(DUV.b2v_inst5.stack.stack[idx]) === valor_esperado)
        begin
            display_esperado;
            $display("------------------Finaliza teste %s------------------", cenario);
            cenarios_sucesso = cenarios_sucesso + 1;
        end
        else    display_inesperado;
    end
end
endtask

task decide_cenario_cmp;
begin
    if(DUV.b2v_inst4.state == `STATE_PUSH_TO_STACK)
    begin
        case ($signed(DUV.b2v_inst5.alu.in1))
            79: begin
                    cenario = "CMP (Caso temp1 > temp2)";
                    valor_esperado = 1;
                end
            -81:begin
                    cenario = "CMP (Caso temp2 > temp1)";
                    valor_esperado = -1;
                end   
            -1: begin
                    cenario = "CMP (Caso temp2 = temp1)";
                    valor_esperado = 0;
                end   
        endcase
    end
end
endtask

task display_tos;
begin
    #1 $display("Topo da pilha: %0d",
      $signed(DUV.b2v_inst5.stack.stack[idx]));
end
endtask

task display_operandos;
begin
    #1 $display("Operandos: %0d e %0d",
      $signed(DUV.b2v_inst5.alu.in1), $signed(DUV.b2v_inst5.alu.in2));
end
endtask

task display_esperado;
begin
    #1 $display("O topo da pilha foi carregado com o resultado corretamente");
end
endtask

task display_inesperado;
begin
    #1 $display("[ERRO] !!! O topo da pilha foi carregado com um resultado incorreto para a operacao !!!");
    $display("-------------------------------------------------------------------------------------");
end
endtask

task display_resultados;
begin
    #1 $display("-------------------Testes executados!! %0d de %0d passaram------------------",
      cenarios_sucesso, total_cenarios);
    #1 $display("*********************** Finaliza testes de instrucoes de logica ***********************");
end
endtask

endmodule 
