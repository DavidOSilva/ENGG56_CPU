module ula(
           input [7:0] A,B,  // ALU 8-bit Inputs                 
           input [3:0] ALU_Sel,// ALU Selection
           output [7:0] ALU_Out, // ALU 8-bit Output
           output CarryOut // Carry Out Flag
    );
    reg [7:0] ALU_Result;
    wire [8:0] tmp;
    assign ALU_Out = ALU_Result; // ALU out
    assign tmp = {1'b0,A} + {1'b0,B};
    assign CarryOut = tmp[8]; // Carryout flag
    always @(*)
    begin
		case(ALU_Sel)
		4'b0000: // ADD
		  ALU_Result = A + B ; 
		 
		4'b0001: // SUB
		  ALU_Result = A - B ;
		 
		4'b0010: // MUL
		  ALU_Result = A * B;
		 
		4'b0011: // DIV
		  ALU_Result = A / B;
		 
		4'b0100: // AND
		  ALU_Result = A & B;
		 
		4'b0101: // NAND
		  ALU_Result = ~(A & B);
		 
		4'b0110: // OR
		  ALU_Result = A | B;
		 
		4'b0111: // XOR 
		  ALU_Result = A ^ B;
		 
		4'b1000: // CMP
		  if(A > B) begin
				ALU_Result = 8'd1;
			end
			
			else if(A < B) begin
				ALU_Result = -8'd1;
			end
			else begin
				ALU_Result = 8'd0;
			end
		 
		4'b1001: // NOT A
		  ALU_Result = ~A;
		 
		4'b1010: // NOT B
		  ALU_Result = ~B;
		 
		default: ALU_Result = 8'd0  ; 
		 
		endcase
	end

endmodule