module ula (
    input [7:0] temp1,
    input [7:0] temp2,
    input [4:0] seletor,
    output reg [7:0] saida,
    output reg carryOut
);

always @(*)
begin
    case (seletor)
        5'b00100: // ADD
            begin
                saida = temp1 + temp2;
                carryOut = (temp1 + temp2 > 255) ? 8'd1 : 8'd0;
            end
				
        5'b00101: // SUB
            saida = temp1 - temp2;
				
        5'b00110: // MUL
            begin
                saida = temp1 * temp2;
                carryOut = (temp1 * temp2 > 255) ? 8'd1 : 8'd0;
            end
				
        5'b00111: // DIV
            saida = temp1 / temp2;
				
        5'b01000: // AND
            saida = temp1 & temp2;
				
        5'b01001: // NAND
            saida = ~(temp1 & temp2);
				
        5'b01010: // OR
            saida = temp1 | temp2;
				
        5'b01011: // XOR 
            saida = temp1 ^ temp2;
				
        5'b01100: // CMP
            if (temp1 > temp2)
                saida = 8'd1;
            else if (temp1 < temp2)
                saida = -8'd1;
            else
                saida = 8'd0;
					 
        5'b01101: // NOT temp1
            saida = ~temp1;
				
        default:
            begin
                saida = 8'd0;
                carryOut = 8'd0;
            end
				
    endcase
end

endmodule
