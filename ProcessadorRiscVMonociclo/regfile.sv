
//
// regfile.sv : registrador flip-flop c/ reset
//
// Simulação: Waverform6.vwf
//
// Arquivo de registradores de três portas
// -lê duas portas combinacionalmente (a1/rd1, a2/rd2)
// -grava a terceira porta na borda de subida do clock (a3/wd3/we3)
// -registrador 0 conectado a 0 (retorna sempre zero como leitura)
//
// Capacidade de armazenamento: 32 registradores de 32 bits.)
//


module regfile(input logic clk,
					input logic we3, //sinal vindo do controle
					input logic [5:0] a1, a2, a3, //a3 é o endereço de onde vc quer gravar
					input logic [31:0] wd3, //valor a ser inserido no registrador.
					output logic [31:0] rd1, rd2);

	logic [31:0] rf[31:0]; //arquivo de registradores o primeiro [31:0] indica o tamanho do registradores o outro a quantidade
	
	always_ff @(posedge clk)
		if (we3) 
			rf[a3] <= wd3;   
	
	
	assign rd1 = (a1 != 0) ? rf[a1] : 0; // se a1 for diferente de 0 saida igual o registrador. ele deixa assim pro valor zero sair direto.
	assign rd2 = (a2 != 0) ? rf[a2] : 0; // o registrador zero ja sai com o resultado direito.

endmodule