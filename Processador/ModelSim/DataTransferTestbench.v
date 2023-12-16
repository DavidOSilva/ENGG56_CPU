`timescale 1ns/1ns
module DataTransferTestbench;

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
integer cenarios_sucesso;
integer total_cenarios;

initial
begin
    clk = 0;
    reset = 0;
    idx = 0;
    cenarios_sucesso = 0;
    total_cenarios = 4;
    $stop;
    $display("*********************** Inicia testes de instrucoes de transferencia de dados ***********************");
end

initial
begin
    #6000
    display_resultados;
    $stop;
end

parameter push_i = `OP_PUSH_I,
        push = `OP_PUSH,
        pop = `OP_POP,
        push_t = `OP_PUSH_T;

always @ (DUV.b2v_inst4.state) 
begin
    case (DUV.b2v_inst4.ir)
        push_i: testa_push_i;
        push: testa_push;
        pop: testa_pop;
        push_t: testa_push_t; 
    endcase
end

task testa_push_i;
begin
    if(DUV.b2v_inst4.state == `STATE_PUSH_TO_STACK)
    begin
        $display("--------------Inicia teste PUSH_I -------------------");
        $display("Acrescentou um valor na pilha usando a instrção PUSH_I");
        display_tos;
        idx = DUV.b2v_inst5.stack.index;
        
        if(DUV.b2v_inst5.stack.stack[idx] === 8'h5)
        begin
            $display("O topo da pilha foi carregado com o valor 5 corretamente");
            $display("--------------Finaliza teste PUSH_I -------------------");
            cenarios_sucesso = cenarios_sucesso + 1;
            idx = 8'b000_001;
        end
    end
end
endtask

task testa_push;
begin
    if(DUV.b2v_inst4.state == `STATE_PREPARE_PUSH_TO_STACK)
    begin
        $display("--------------Inicia teste PUSH -------------------");
        $display("Acrescentou um valor na pilha usando a instrucao PUSH");
        display_tos;
        display_ram;
        #200
        display_tos;
        idx = DUV.b2v_inst5.stack.index;
        
        if(DUV.b2v_inst5.stack.stack[idx] === 8'h7)
        begin
            $display("O topo da pilha foi carregado com o valor 7 corretamente");
            $display("--------------Finaliza teste PUSH -------------------");
            cenarios_sucesso = cenarios_sucesso + 1;
        end
    end
end
endtask

task testa_push_t;
begin
    if(DUV.b2v_inst4.state == `STATE_PREPARE_PUSH_TO_STACK)
    begin
        $display("--------------Inicia teste PUSH_T -------------------");
        display_temp1;
        $display("Acrescentou um valor na pilha usando a instrucao PUSH_T");
        #300
        idx = DUV.b2v_inst5.stack.index;

        if(DUV.b2v_inst5.stack.stack[idx] === 8'h7)
        begin
            display_tos;
            $display("O topo da pilha foi carregado com o valor 7 corretamente");
            $display("--------------Finaliza teste PUSH_T -------------------");
            cenarios_sucesso = cenarios_sucesso + 1;
        end
    end
end
endtask

task testa_pop;
begin
    if(DUV.b2v_inst4.state == `STATE_DECODE)
    begin
        $display("--------------Inicia teste POP -------------------");
        display_tos;
        display_ram;
        $display("Transfere um valor da pilha para um endereco de memoria");
        #400
        
        if(q_ram_values === 8'b00001100)
        begin
            display_ram;
            $display("O valor no endereco foi alterado para 12 com sucesso");
            if(DUV.b2v_inst5.stack.index == 8'b0)
                $display("A stack foi esvaziada com sucesso");

            $display("--------------Finaliza teste POP -------------------");
            cenarios_sucesso = cenarios_sucesso + 1;
        end
    end
end
endtask

task display_tos;
begin
    #1 $display("Topo da pilha:%0d",
      DUV.b2v_inst5.stack.stack[idx]);
end
endtask

task display_ram;
begin
    #1 $display("Valores na memoria:%0d",
      q_ram_values);
end
endtask

task display_temp1;
begin
    #1 $display("Valor em temp1:%0d",
      temp1);
end
endtask

task display_resultados;
begin
    #1 $display("-------------------Testes executados!! %0d de %0d passaram------------------",
      cenarios_sucesso, total_cenarios);
    #1 $display("*********************** Finaliza testes de instrucoes de transferencia de dados ***********************");
end
endtask

endmodule 
