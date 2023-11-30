module ALU (
    input [7:0] in1,
    input [7:0] in2,
    input [4:0] selector,
    output reg signed [7:0] out,
    output reg carryOut
);

`include "Definitions.v"

always @(*)
begin
    case (selector)
        `OP_ADD: begin
            out = in1 + in2;
            carryOut = (in1 + in2 > 8'd255) ? 1'b1 : 1'b0;
        end
        `OP_SUB: out = in1 - in2;
        `OP_MUL: begin
            out = in1 * in2;
            carryOut = (in1 * in2 > 8'd255) ? 1'b1 : 1'b0;
        end
        `OP_DIV: out = in1 / in2;
        `OP_AND: out = in1 & in2;
        `OP_NAND: out = ~(in1 & in2);
        `OP_OR: out = in1 | in2;
        `OP_XOR: out = in1 ^ in2;
        `OP_CMP:
            if (in1 > in2)
                out = 8'b00000001;
            else if (in1 < in2)
                out = -8'b00000001;
            else
                out = 8'b00000000; 
        `OP_NOT: out = ~in1;
        default: begin
            out = 8'b00000000;
            carryOut = 1'b0;
        end
    endcase
end

endmodule
