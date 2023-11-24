module registradores(din, load, clk, rstn, opcode, temp1, temp2);

	input load, rstn, clk;
	input [7:0] din;
	input [4:0] opcode;
	output [7:0] temp1, temp2;
	
	reg [7:0] reg1;
	reg [7:0] reg2;
	reg [1:0] estado;
	
	parameter	salvaTemp1  = 2'b00,
					salvaTemp2  = 2'b01;
					
	initial begin
		reg1 = 8'd0;
		reg2 = 8'd0;
		estado = salvaTemp1;
	end
	
	assign temp1 = reg1;
	assign temp2 = reg2;
	
	always @(posedge clk or negedge rstn) begin
	
		if(!rstn) begin
			reg1 <= 8'd0;
			reg2 <= 8'd0;
			estado <= salvaTemp1;
		end
		else begin
			case(estado)
				
				salvaTemp1: begin
					if(opcode >= 5'b00100 && opcode <= 5'b10011 && opcode != 5'b01110 && load) begin reg1 <= din; end
					
					if(opcode >= 5'b00100 && opcode <= 5'b01100 && load) begin estado <= salvaTemp2; end
				end
				
				salvaTemp2: begin
					if(load) begin
						reg2 <= din;
						estado <= salvaTemp1;
					end
				end
				
			endcase	
			
		end
	
	end
	
	
endmodule