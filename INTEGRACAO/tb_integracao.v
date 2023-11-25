module tb_integracao;

	reg clk, rstn, pop, push, load;
	reg [4:0] opcode;
	reg [7:0] imm, data;
	wire empty, full, carryout;
	wire [7:0] s_ula, tmp1, tmp2, outpilha;
	
	integracao tb(.imm(imm), .data(data), .rstn(rstn), .clk(clk), .load(load), .opcode(opcode), .empty(empty),
					  .full(full), .carryout(carryout), .s_ula(s_ula), .pop(pop), .push(push), .tmp1(tmp1), .tmp2(tmp2),
					  .outpilha(outpilha));
					  
	always #5 clk = ~clk;
	
	task reset();
	begin
	clk = 1'b1;
	rstn = 1'b0;
	pop = 1'b0;
	push = 1'b0;
	imm = 8'd0;
	data = 8'd0;
	#30 rstn = 1'b1;
	end
	endtask
	
	task lerPilha();
	begin
	pop = 1'b1;
	#10 pop = 1'b0;
	end
	endtask
	
	task carregarRegistradores();
	begin
	lerPilha();
	#10;
	load = 1'b1;
	#10 load = 1'b0;
	end
	endtask
	
	task add();
	begin
	opcode = 5'b00100;
	carregarRegistradores();
	#10;
	carregarRegistradores();
	#10;
	push = 1'b1;
	#10 push = 1'b0;
	end
	endtask
	
	task push_d(input [7:0]data_tb);
	begin
	opcode = 5'b00000;
	data = data_tb;
	push = 1'b1;
	#10 push = 1'b0;
	end
	endtask
	
	task push_i(input [7:0]imm_tb);
	begin
	opcode = 5'b00001;
	imm = imm_tb;
	push = 1'b1;
	#10 push = 1'b0;
	end
	endtask
	
	task push_t();
	begin
	opcode = 5'b00010;
	push = 1'b1;
	#10 push = 1'b0;
	end
	endtask
	
	
	initial begin
	
		reset();
		#10;
		
		//Enchendo pilha
		push_i(8'd12);
		#10;
		push_i(8'd15);
		#10;
		
		//Operando
		add();
		#10;
		
		$finish;
	
	end
	

endmodule