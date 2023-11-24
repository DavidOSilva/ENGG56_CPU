module tb_integracao;

	reg clk, rstn, pop, push, load;
	reg [4:0] opcode;
	reg [7:0] din;
	wire empty, full, carryout;
	wire [7:0] s_ula, tmp1, tmp2, outpilha;
	
	integracao tb(.clk(clk), .rstn(rstn), .pop(pop), .push(push), .opcode(opcode), .din(din), .load(load),
					  .empty(empty), .full(full), .carryout(carryout), .s_ula(s_ula), .tmp1(tmp1), .tmp2(tmp2), .outpilha(outpilha));
					  
	always #5 clk = ~clk;
	
	task reset();
	begin
	clk = 1'b1;
	rstn = 1'b0;
	pop = 1'b0;
	push = 1'b0;
	din = 8'd0;
	#30 rstn = 1'b1;
	end
	endtask
	
	task ler();
	begin
	pop = 1'b1;
	#10 pop = 1'b0;
	end
	endtask
   
	task escrever(input [7:0]din_tb);
	begin
	push = 1'b1;
	din = din_tb;
	#10 push = 1'b0;
	end
	endtask
	
	task carregar();
	begin
	load = 1'b1;
	#10 load = 1'b0;
	end
	endtask
	
	task calcular();
	begin
	ler();
	carregar();
	#10;
	
	ler();
	carregar();
	#10;
	end
	endtask
	
	initial begin
	
		opcode = 5'b00100;
		#10;
	
		reset();
		#10;
		
		//Enchendo pilha
		escrever(8'd12);
		#10;
		
		escrever(8'd15);
		#10;
		
		calcular();
		#10;
		
		$finish;
	
	end
	

endmodule