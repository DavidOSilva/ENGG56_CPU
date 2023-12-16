// ENGG56 - PROJETO DE CIRCUITOS INTEGRADOS DIGITAIS
// TRABALHO PRATICO - PROCESSADOR - UNIDADE DE CONTROLE - CPUCONTROL
// INTEGRANTES: ANDRE COSTA, DAVID FERRARI, DAVID OLIVEIRA E PALOMA ARIZE.

module CPUControl(
input clk, input reset, 
input [7:0] bus_values_data, input [12:0] bus_inst_data, input [7:0] alu_result,
input [7:0] temp1, input [7:0] data_from_stack, output reg [7:0] values_addr, 
output reg reg_selector, output reg [7:0] ip, output reg [4:0] alu_selector,
output reg rst, output reg [7:0] data_to_push, output reg stack_clk,
output reg values_ram_clk, output reg inst_ram_clk, output reg ew_reg,
output reg [7:0] values_data, output reg pop, output reg push,
output reg ew_ram_values);

    `include "Definitions.v"
    
    reg [4:0] ir = 5'b00000;
    reg [4:0] state = `STATE_FETCH_INST;
    reg [4:0] future_state = `STATE_DECODE;
    reg is_jmp_inst = 1'b0;
    reg two_register_instruction = 1'b0;
    reg [7:0] temp_memory = 8'b0;

    initial begin
        ip = 8'b00000000;
        data_to_push = 8'b00000000;
        rst = 1'b0;
        stack_clk = 1'b0;
        values_ram_clk = 1'b0;
        inst_ram_clk = 1'b0;
        alu_selector = 5'b00000;
        reg_selector = 1'b0;
        pop = 1'b0;
        push = 1'b0;
        ew_ram_values = 1'b0;
        values_addr = 8'b00000000;
        values_data = 8'b00000000;
    end
    
    
    always @(posedge clk) begin
      if(reset)
        state <= `STATE_RESET;
      else
        state <= future_state;
    end
	 
    always @(*) begin 
        rst = 1'b0;
        case (state)
            `STATE_RESET: begin
                future_state = `STATE_FETCH_INST;
                ip = 8'b00000000;
                data_to_push = 8'b00000000;
                rst = 1'b1;
                stack_clk = 1'b0;
                values_ram_clk = 1'b0;
                inst_ram_clk = 1'b0;
                alu_selector = 5'b00000;
                reg_selector = 1'b0;
                pop = 1'b0;
                push = 1'b0;
                ew_ram_values = 1'b0;
                values_addr = 8'b00000000;
                values_data = 8'b00000000;
                is_jmp_inst = 1'b0;
                ir = 5'b00000;
            end
            `STATE_FETCH_INST: begin
                stack_clk = 1'b0;
                push = 1'b0;
                pop = 1'b0;
                is_jmp_inst = 1'b0;
                inst_ram_clk = 1'b1;
                future_state = `STATE_DECODE;
            end
            `STATE_DECODE: begin
                ir = bus_inst_data[12:8];
                inst_ram_clk = 1'b0;
                case (ir)
                    `OP_PUSH:
                        future_state = `STATE_PREPARE_PUSH_TO_STACK;
                    `OP_PUSH_I:
                        future_state = `STATE_PREPARE_PUSH_TO_STACK;
                    `OP_PUSH_T:
                        future_state = `STATE_PREPARE_PUSH_TO_STACK;
                    `OP_POP: begin 
                        pop = 1'b1;
                        stack_clk = 1'b0;
                        future_state = `STATE_PREPARE_SEND_TO_RAM;
                    end
                    `OP_ADD: begin
                        two_register_instruction = 1'b1;
                        pop = 1'b1;
                        future_state = `STATE_POP_TO_TEMP1_1;
                    end
                    `OP_SUB: begin
                        two_register_instruction = 1'b1;
                        pop = 1'b1;
                        future_state = `STATE_POP_TO_TEMP1_1;
                    end
                    `OP_MUL: begin
                        two_register_instruction = 1'b1;
                        pop = 1'b1;
                        future_state = `STATE_POP_TO_TEMP1_1;
                    end
                    `OP_DIV: begin
                        two_register_instruction = 1'b1;
                        pop = 1'b1;
                        future_state = `STATE_POP_TO_TEMP1_1;
                    end
                    `OP_AND: begin
                        two_register_instruction = 1'b1;
                        pop = 1'b1;
                        future_state = `STATE_POP_TO_TEMP1_1;
                    end
                    `OP_NAND: begin
                        two_register_instruction = 1'b1;
                        pop = 1'b1;
                        future_state = `STATE_POP_TO_TEMP1_1;
                    end
                    `OP_OR: begin
                        two_register_instruction = 1'b1;
                        pop = 1'b1;
                        future_state = `STATE_POP_TO_TEMP1_1;
                    end
                    `OP_XOR: begin
                        two_register_instruction = 1'b1;
                        pop = 1'b1;
                        future_state = `STATE_POP_TO_TEMP1_1;
                    end
                    `OP_CMP: begin
                        two_register_instruction = 1'b1;
                        pop = 1'b1;
                        future_state = `STATE_POP_TO_TEMP1_1;
                    end
                    `OP_NOT: begin
                        two_register_instruction = 1'b0;
                        pop = 1'b1;
                        future_state = `STATE_POP_TO_TEMP1_1;
                    end
                    `OP_GOTO: begin
                        future_state = `STATE_CONFIG_DATA_MEM_READ;
                    end
                    `OP_IF_EQ, `OP_IF_GT, `OP_IF_GT, `OP_IF_LT, `OP_IF_GE, `OP_IF_LE: begin
                        alu_selector = `OP_CMP;
                        reg_selector = 1'b1;
                        values_data = 8'b0;
                        pop = 1'b1;
                        ew_reg = 1'b1;
                        two_register_instruction = 1'b0;
                        is_jmp_inst = 1'b1;
                        future_state = `STATE_POP_TO_TEMP1_1;
                    end
                    `OP_CALL: begin
                        future_state = `STATE_CONFIG_DATA_MEM_READ;
                    end
                    `OP_RET: begin
                        future_state = `STATE_JMP_NEXT;
                    end
                    default begin
                        future_state = `STATE_DECODE;
                    end
                endcase
            end
            `STATE_POP_TO_TEMP1_1: begin
                reg_selector = 1'b0;
                stack_clk = 1'b1;
                values_data = data_from_stack;
                future_state = `STATE_POP_TO_TEMP1_2;
            end
            `STATE_POP_TO_TEMP1_2: begin
                ew_reg = 1'b1;
                stack_clk = 1'b0;
                pop = 1'b0;
                if (two_register_instruction)
                    future_state = `STATE_POP_TO_TEMP2_1;
                else
                    future_state = `STATE_EXECUTE_1_REG_INSTRUCTION;
            end
            `STATE_POP_TO_TEMP2_1: begin
                pop = 1'b1;
                reg_selector = 1'b1;
                ew_reg = 1'b0;
                values_data = data_from_stack;
                future_state = `STATE_POP_TO_TEMP2_2;
            end
            `STATE_POP_TO_TEMP2_2: begin
                ew_reg = 1'b1;
                stack_clk = 1'b1;
                values_data = data_from_stack;
                alu_selector = ir;
                future_state = `STATE_EXECUTE_ALU;
            end
            `STATE_EXECUTE_1_REG_INSTRUCTION: begin
                stack_clk = 1'b0;
                if(is_jmp_inst)
                    future_state = `STATE_CONFIG_DATA_MEM_READ;
                else begin
                    alu_selector = ir;
                    future_state = `STATE_EXECUTE_ALU;
                end
            end
            `STATE_EXECUTE_ALU: begin
                pop = 1'b0;
                stack_clk = 1'b0;
                ew_reg = 1'b0;
                future_state = `STATE_PREPARE_PUSH_TO_STACK;
            end
            `STATE_PREPARE_PUSH_TO_STACK: begin
                case (ir)
                    `OP_PUSH: begin
                        values_addr = bus_inst_data[7:0];
                        values_ram_clk = 1'b1;
                        data_to_push = bus_values_data;
                        future_state = `STATE_PUSH_TO_STACK;
                    end
                    `OP_PUSH_I: begin
                        data_to_push = bus_inst_data[7:0];
                        future_state = `STATE_PUSH_TO_STACK;
                    end
                    `OP_PUSH_T: begin
                        data_to_push = temp1;
                        future_state = `STATE_PUSH_TO_STACK;
                    end
                    default: begin
                        data_to_push = alu_result;
                        future_state = `STATE_PUSH_TO_STACK;
                    end
                endcase
            end
            `STATE_PUSH_TO_STACK: begin
                push = 1'b1;
                future_state = `STATE_NEXT;
            end
            `STATE_CONFIG_DATA_MEM_READ: begin
                values_addr = bus_inst_data[7:0];
                future_state = `STATE_DATA_MEM_READ;
            end
            `STATE_DATA_MEM_READ: begin
                values_ram_clk = 1'b1;
                future_state = `STATE_JMP_NEXT;
            end
            `STATE_PREPARE_SEND_TO_RAM: begin
                stack_clk = 1'b1;
                values_ram_clk = 1'b0;
                values_addr = bus_inst_data[7:0];
                values_data = data_from_stack;
                ew_ram_values = 1'b1;
                future_state = `STATE_SEND_TO_RAM;
            end
            `STATE_SEND_TO_RAM: begin
                values_ram_clk = 1'b1;
                future_state = `STATE_NEXT;
            end
            `STATE_JMP_NEXT: begin
                case(ir) 
                    `OP_IF_EQ: begin
                        if(alu_result == 8'b0) begin
                            ip = bus_values_data[7:0];
                            future_state = `STATE_FETCH_INST;
                        end
                        else begin
                            future_state = `STATE_NEXT;
                        end
                    end
                    `OP_IF_GT: begin
                        if(alu_result == 8'b0000_0001) begin
                            ip = bus_values_data[7:0];
                            future_state = `STATE_FETCH_INST;
                        end
                        else begin
                            future_state = `STATE_NEXT;
                        end
                    end
                    `OP_IF_LT: begin
                        if(alu_result == 8'b1111_1111) begin
                            ip = bus_values_data[7:0];
                            future_state = `STATE_FETCH_INST;
                        end
                        else begin
                            future_state = `STATE_NEXT;
                        end
                    end
                    `OP_IF_GE: begin
                        if(alu_result == 8'b0 || alu_result == 8'b0000_0001) begin
                            ip = bus_values_data[7:0];
                            future_state = `STATE_FETCH_INST;
                        end
                        else begin
                            future_state = `STATE_NEXT;
                        end
                    end
                    `OP_IF_LE: begin
                        if(alu_result == 8'b0 || alu_result == 8'b1111_1111) begin
                            ip = bus_values_data[7:0];
                            future_state = `STATE_FETCH_INST;
                        end
                        else begin
                            future_state = `STATE_NEXT;
                        end
                    end
                    `OP_CALL: begin
                        temp_memory = ip;
                        ip = bus_values_data[7:0];
                        future_state = `STATE_FETCH_INST;
                    end
                    `OP_RET: begin
                        ip = temp_memory + 8'b00000001;
                        values_ram_clk = 1'b0;
                        inst_ram_clk = 1'b0;
                        ew_ram_values = 1'b0;
                        two_register_instruction = 1'b0;
                        ew_reg = 1'b0;
                        future_state = `STATE_FETCH_INST;
                    end
                    `OP_GOTO: begin
                        ip = bus_values_data[7:0];
                        future_state = `STATE_FETCH_INST;
                    end
                    default: begin
                        future_state = `STATE_RESET;
                    end
                endcase
            end
            `STATE_NEXT: begin
                stack_clk = 1'b1;
                values_ram_clk = 1'b0;
                inst_ram_clk = 1'b0;
                ew_ram_values = 1'b0;
                two_register_instruction = 1'b0;
                ew_reg = 1'b0;
                ip = ip + 8'b00000001;
                future_state = `STATE_FETCH_INST;
            end
        endcase
	end
endmodule
