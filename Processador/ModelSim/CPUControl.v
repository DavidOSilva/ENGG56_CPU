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
    
    reg two_register_instruction = 1'b0;
    
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
                ir = 5'b00000;
            end
            `STATE_FETCH_INST: begin
                stack_clk = 1'b0;
                push = 1'b0;
                pop = 1'b0;
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
                    `OP_POP:
                        future_state = `STATE_PREPARE_SEND_TO_RAM;
                    `OP_ADD: begin
                        two_register_instruction = 1'b1;
                        future_state = `STATE_POP_TO_TEMP1_1;
                    end
                    `OP_SUB: begin
                        two_register_instruction = 1'b1;
                        future_state = `STATE_POP_TO_TEMP1_1;
                    end
                    `OP_MUL: begin
                        two_register_instruction = 1'b1;
                        future_state = `STATE_POP_TO_TEMP1_1;
                    end
                    `OP_DIV: begin
                        two_register_instruction = 1'b1;
                        future_state = `STATE_POP_TO_TEMP1_1;
                    end
                    `OP_AND: begin
                        two_register_instruction = 1'b1;
                        future_state = `STATE_POP_TO_TEMP1_1;
                    end
                    `OP_NAND: begin
                        two_register_instruction = 1'b1;
                        future_state = `STATE_POP_TO_TEMP1_1;
                    end
                    `OP_OR: begin
                        two_register_instruction = 1'b1;
                        future_state = `STATE_POP_TO_TEMP1_1;
                    end
                    `OP_XOR: begin
                        two_register_instruction = 1'b1;
                        future_state = `STATE_POP_TO_TEMP1_1;
                    end
                    `OP_CMP: begin
                        two_register_instruction = 1'b1;
                        future_state = `STATE_POP_TO_TEMP1_1;
                    end
                    `OP_NOT: begin
                        two_register_instruction = 1'b0;
                        future_state = `STATE_POP_TO_TEMP1_1;
                    end
                    `OP_GOTO:
                        future_state = `STATE_NEXT;
                    `OP_IF_EQ:
                        future_state = `STATE_NEXT;
                    `OP_IF_GT:
                        future_state = `STATE_NEXT;
                    `OP_IF_LT:
                        future_state = `STATE_NEXT;
                    `OP_IF_GE:
                        future_state = `STATE_NEXT;
                    `OP_IF_LE:
                        future_state = `STATE_NEXT;
                    `OP_CALL:
                        future_state = `STATE_NEXT;
                    `OP_RET:
                        future_state = `STATE_NEXT;
                endcase
            end
            `STATE_POP_TO_TEMP1_1: begin
                reg_selector = 1'b0;
                ew_reg = 1'b1;
                values_data = data_from_stack;
                pop = 1'b1;
                stack_clk = 1'b0;
                future_state = `STATE_POP_TO_TEMP1_2;
            end
            `STATE_POP_TO_TEMP1_2: begin
                values_data = data_from_stack;
                pop = 1'b1;
                stack_clk = 1'b1;
                if (two_register_instruction)
                    future_state = `STATE_POP_TO_TEMP2_1;
                else
                    future_state = `STATE_EXECUTE_1_REG_INSTRUCTION;
            end
            `STATE_POP_TO_TEMP2_1: begin
                stack_clk = 1'b0;
                ew_reg = 1'b0;
                values_data = data_from_stack;
                pop = 1'b0;
                future_state = `STATE_POP_TO_TEMP2_2;
            end
            `STATE_POP_TO_TEMP2_2: begin
                reg_selector = 1'b1;
                ew_reg = 1'b1;
                values_data = data_from_stack;
                pop = 1'b1;
                future_state = `STATE_EXECUTE_ALU;
            end
            `STATE_EXECUTE_1_REG_INSTRUCTION: begin
                alu_selector = ir;
                future_state = `STATE_EXECUTE_ALU;
            end
            `STATE_EXECUTE_ALU: begin
                alu_selector = ir;
                future_state = `STATE_PREPARE_PUSH_TO_STACK;
            end
            `STATE_FETCH_DATA_TO_STACK: begin
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
                future_state = `STATE_NEXT;
            end
            `STATE_CONFIG_INST_MEM_READ: begin
                future_state = `STATE_DATA_MEM_READ;
            end
            `STATE_INST_MEM_READ: begin
                future_state = `STATE_NEXT;
            end
            `STATE_PREPARE_SEND_TO_RAM: begin
                values_ram_clk = 1'b0;
                values_addr = bus_inst_data[7:0];
                values_data = temp1;
                ew_ram_values = 1'b1;
                future_state = `STATE_SEND_TO_RAM;
            end
            `STATE_SEND_TO_RAM: begin
                values_ram_clk = 1'b1;
                future_state = `STATE_NEXT;
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
