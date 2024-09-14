
//
// dmem.sv : memoria de dados
//
// Simulacao: Waverform8.vwf
//
// Funciona como memora RAM (leitura e escrita).
// -lê uma porta combinacionalmente (a/rd)
//   ou grava essa porta na borda de subida do clock (a/wd/we)
// -word aligned - leitura em endereços múltiplos de 4

// Capacidade de armazenamento: 64 posicoes de 32 bits.)
//

module dmem(input logic clk, we,
				input logic [31:0] a,   //endereço da memoria para leitura ou escrita.
				input logic [31:0] wd, //conteudo que sera escrito caso haja sinal
				output logic [31:0] rd);
	
	logic [31:0] RAM[63:0];  // tem tamnho 32 bytes e 64 posições
	
	assign rd = RAM[a[31:2]]; // word aligned  , ele ignora os 2 ultimos bits, para alinhar o endereço de 4 em 4 bytes.
	
	always_ff @(posedge clk)
		if (we) RAM[a[31:2]] <= wd;   //se sinal de escrita escreve.
		
endmodule