`timescale 1ns/1ns
module ControlTransfer1Testbench;

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
reg [7:0] endereco_esperado;
string cenario;
integer cenarios_sucesso;
integer total_cenarios;

initial
begin
    clk = 0;
    reset = 0;
    cenarios_sucesso = 0;
    total_cenarios = 10;
    $stop;
end

initial
begin
    #30000
    $display("*********************** Inicia testes de instrucoes de transferencia de controle ***********************");
end

initial
begin
    #55650
    display_resultados;
    $stop;
    
end

always @ (DUV.b2v_inst4.state) 
begin
    case (DUV.b2v_inst4.ir)
        `OP_GOTO:   begin
                        cenario = "GOTO";
                        endereco_esperado = 8'd26;
                        testa_cond_e_sub;
                    end

        `OP_IF_LT:  begin
                        cenario = "LT";
                        endereco_esperado = 8'd23;
                        testa_ifs;
                    end

        `OP_IF_GT:  begin
                        cenario = "GT";
                        endereco_esperado = 8'd29;
                        testa_ifs;
                    end

        `OP_IF_EQ:  begin
                        cenario = "EQ";
                        endereco_esperado = 8'd33;
                        testa_ifs;
                    end

        `OP_IF_GE:  begin
                        decide_cenario_ge;
                        testa_ifs;
                    end

        `OP_IF_LE:  begin
                        decide_cenario_le;
                        testa_ifs;
                    end

        `OP_CALL:   begin
                        cenario = "CALL";
                        endereco_esperado = 8'd65;
                        testa_cond_e_sub;
                    end
        
        `OP_RET:  begin
                        cenario = "RET";
                        endereco_esperado = 8'd49;
                        testa_ret;
                    end  
    endcase
end

task testa_cond_e_sub;
begin
    if(DUV.b2v_inst4.state == `STATE_CONFIG_DATA_MEM_READ)
    begin
        $display("----------------Inicia teste %s---------------------", cenario);
        display_ip;
    end
    if(DUV.b2v_inst4.state == `STATE_JMP_NEXT)
    begin
        display_ip;
        if(DUV.b2v_inst4.ip == endereco_esperado)
        begin
            display_esperado;
            $display("------------------Finaliza teste %s-----------------------", cenario);
            cenarios_sucesso = cenarios_sucesso + 1;
        end
        else    display_inesperado;    
    end
end
endtask

task testa_ret;
begin
    if(DUV.b2v_inst4.state == `STATE_DECODE)
    begin
        $display("-----------------Inicia teste %s------------------------", cenario);
        display_ip;
    end
    if(DUV.b2v_inst4.state == `STATE_JMP_NEXT)
    begin
        display_ip;
        if(DUV.b2v_inst4.ip == endereco_esperado)
        begin
            display_esperado;
            $display("---------------Finaliza teste %s----------------------", cenario);
            cenarios_sucesso = cenarios_sucesso + 1;
        end
        else    display_inesperado;    
    end
end
endtask

task testa_ifs;
begin
    if(DUV.b2v_inst4.state == `STATE_CONFIG_DATA_MEM_READ)
    begin
        $display("--------------Inicia teste IF_%s------------------", cenario);
        display_ip;
        display_temp1;
    end
    if(DUV.b2v_inst4.state == `STATE_JMP_NEXT)
    begin
        display_ip;
        if(DUV.b2v_inst4.ip == endereco_esperado)
        begin
            display_esperado;
            $display("--------------Finaliza teste IF_%s------------------", cenario);
            cenarios_sucesso = cenarios_sucesso + 1;
        end
        else    display_inesperado;    
    end
end
endtask

task decide_cenario_ge;
begin
    if(DUV.b2v_inst4.state == `STATE_CONFIG_DATA_MEM_READ)
    begin
        if(cenario == "EQ")
        begin
            cenario = "GE (Caso Temp 1 > 0)";
            endereco_esperado = 8'd36;
        end
        else
        begin
            cenario = "GE (Caso Temp 1 = 0)";
            endereco_esperado = 8'd40;
        end
    end
end
endtask

task decide_cenario_le;
begin
    if(DUV.b2v_inst4.state == `STATE_CONFIG_DATA_MEM_READ)
    begin
        if(cenario == "LE (Caso Temp 1 = 0)")
        begin
            cenario = "LE (Caso Temp 1 > 0)";
            endereco_esperado = 8'd47;
        end
        else 
        begin
            cenario = "LE (Caso Temp 1 = 0)";
            endereco_esperado = 8'd44;
        end
    end
end
endtask

task display_temp1;
begin
    #1 $display("Temp1: %0d",
      $signed(temp1));
end
endtask

task display_ip;
begin
    #1 $display("Proxima instrucao alocada no endereco de memoria: %0d",
      DUV.b2v_inst4.ip);
end
endtask

task display_esperado;
begin
    #1 $display("A transferencia de controle ocorreu corretamente");
end
endtask

task display_inesperado;
begin
    #1 $display("[ERRO] !!! A transferencia de controle nao ocorreu devidamente para a operacao !!!");
    $display("-------------------------------------------------------------------------------------");
end
endtask

task display_resultados;
begin
    #1 $display("-------------------Testes executados!! %0d de %0d passaram------------------",
      cenarios_sucesso, total_cenarios);
    #1 $display("*********************** Finaliza testes de instrucoes de transferencia de controle ***********************");
end
endtask

endmodule 
