module integracao(imm, data, rstn, clk, load, opcode, empty, full, carryout, s_ula, pop, push, tmp1, tmp2, outpilha);

	input clk, rstn, pop, push, load;
	input [4:0] opcode;
	input [7:0] data, imm;
	output empty, full, carryout;
	output [7:0] s_ula, tmp1, tmp2, outpilha;
	
	wire [7:0] pilha_to_reg, temp1_to_ula, temp2_to_ula, filtro_to_pilha, ula_to_pilha;
	
	assign tmp1 = temp1_to_ula;
	assign tmp2 = temp2_to_ula;
	assign outpilha = pilha_to_reg;
	assign s_ula = ula_to_pilha;
	
	
	pilha pilha(.clk(clk), .rstn(rstn), .pop(pop), .push(push), .empty(empty), .full(full), .din(filtro_to_pilha), .dout(pilha_to_reg));
	registradores regs(.din(pilha_to_reg), .load(load), .clk(clk), .rstn(rstn), .opcode(opcode), .temp1(temp1_to_ula), .temp2(temp2_to_ula));
	ula ula(.temp1(temp1_to_ula), .temp2(temp2_to_ula), .seletor(opcode), .saida(ula_to_pilha), .carryOut(carryout));
	filtro filtro(.temp1(temp1_to_ula), .imm(imm), .data(data), .ula(s_ula), .opcode(opcode), .dout(filtro_to_pilha));

	
endmodule