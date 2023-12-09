module filtro(temp1, imm, data, ula, opcode, dout);

	input [7:0] temp1, imm, data, ula;
	input [4:0] opcode;
	output reg [7:0] dout;
	
	always @(*)
	begin
	
		if(opcode == 5'b00000) begin dout = data; end
		
		else if(opcode == 5'b00001) begin dout = imm; end
		
		else if(opcode == 5'b00010) begin dout = temp1; end
		
		else if(opcode >= 5'b00100 && opcode <= 5'b01101) begin dout = ula; end
		
		else begin dout = 8'b00000000; end
				
	end	

endmodule