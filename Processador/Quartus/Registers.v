module Registers(din, load, clk, rstn, opcode, temp1, temp2);

	input load, rstn, clk;
	input [7:0] din;
	input [4:0] opcode;
	output [7:0] temp1, temp2;
	
	reg [7:0] reg1;
	reg [7:0] reg2;
	reg [1:0] state;
	
	parameter	saveTemp1  = 2'b00,
					saveTemp2  = 2'b01;
					
	initial begin
		reg1 = 8'd0;
		reg2 = 8'd0;
		state = saveTemp1;
	end
	
	assign temp1 = reg1;
	assign temp2 = reg2;
	
	always @(posedge clk or negedge rstn) begin
	
		if(!rstn) begin
			reg1 <= 8'd0;
			reg2 <= 8'd0;
			state <= saveTemp1;
		end
		else begin
			case(state)
				saveTemp1: begin
					if(opcode >= 5'b00100 && opcode <= 5'b10011 && opcode != 5'b01110 && load)
						reg1 <= din;
					if(opcode >= 5'b00100 && opcode <= 5'b01100 && load)
						state <= saveTemp2;
				end
				saveTemp2: begin
					if(load) begin
						reg2 <= din;
						state <= saveTemp1;
					end
				end
			endcase
		end
	end
endmodule