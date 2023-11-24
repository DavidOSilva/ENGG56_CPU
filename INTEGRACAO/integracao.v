module integracao(din, rstn, clk, load, opcode, empty, full, carryout, s_ula, pop, push, tmp1, tmp2, outpilha);

	input clk, rstn, pop, push, load;
	input [4:0] opcode;
	input [7:0] din;
	output empty, full, carryout;
	output [7:0] s_ula, tmp1, tmp2, outpilha;
	
	wire [7:0] pilha_to_reg;
	wire [7:0] temp1_to_ula;
	wire [7:0] temp2_to_ula;
	
	assign tmp1 = temp1_to_ula;
	assign tmp2 = temp2_to_ula;
	assign outpilha = pilha_to_reg;
	
	
	pilha pilha(.clk(clk), .rstn(rstn), .pop(pop), .push(push), .empty(empty), .full(full), .din(din), .dout(pilha_to_reg));
	registradores regs(.din(pilha_to_reg), .load(load), .clk(clk), .rstn(rstn), .opcode(opcode), .temp1(temp1_to_ula), .temp2(temp2_to_ula));
	ula ula(.temp1(temp1_to_ula), .temp2(temp2_to_ula), .seletor(opcode), .saida(s_ula), .carryOut(carryout));

	
endmodule