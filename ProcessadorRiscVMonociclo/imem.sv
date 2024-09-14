
//
// imem.sv : memoria de instrucoes
//
// Simulacao: Waverform7.vwf
//
// Funciona como memora ROM (read-only), 
//  sendo inicializado com as instrucoes contidas 
//  no arquivo riscvtes.txt (apenas p/ simulacao)
//
// Capacidade de armazenamento: 64 posicoes de 32 bits.)
//

module imem(input logic [31:0] a,
				output logic [31:0] rd);
	
	logic [31:0] RAM[63:0];
	
	//initial
	//	$readmemh("riscvtest.txt",RAM);
	

  initial
  begin
	 RAM[0]  = 32'h00800093;		// addi x1,x0 ,8  		# x1=16 (main:)
	 RAM[1]  = 32'h00400113;		// addi x2,x0,4  			#x2 = 4
	 RAM[2]  = 32'h0010d093;      // srli x1,x1,1 		 	# x1 = 4
	 RAM[3]  = 32'h00208463;		// beq x1,x2,done 		#tomado 				
	 RAM[4]  = 32'h00112023;		// sw x1, 0(x2)   		#pulado
	 RAM[5]  = 32'h0050c093;		// xori x1,x1,5 			#x1 = 1
	 RAM[6]  = 32'h0020ca63;		// blt x1,x2,done2		#tomado
	 RAM[7]  = 32'h00111113;		// slli x2,x2,1 			#pulada 
	 RAM[8]  = 32'h002080b3;		// add x1,x1,x2  			#pulada
	 RAM[9]  = 32'h00117133;		// and x2,x2,x1  			#pulada
	 RAM[10] = 32'h00317093;		// andi x1,x2,4			#pulada
	 RAM[11] = 32'h0020d463;		// bge x1,x2,done3 		#nao tomado
	 RAM[12] = 32'h00308093;		// addi x1,x2,3  			#x1 = 4
	 RAM[13] = 32'h00209463;		// bne  x1,x2,done4  	#nao tomado x1=x2=4
	 RAM[14] = 32'h001100b3;		// add x1,x2,x1  			# x1 = 8
	 RAM[15] = 32'hfff08093;		// addi x1,x1,-1        # x1 = 7
	 RAM[16] = 32'h00112223;		// sw x1, 4(x2)   		#mem[8] = 7
	 RAM[17] = 32'h00212423;		// sw x2, 8(x2)   		#mem[12] = 4
  end
  
    
	
	assign rd = RAM[a[31:2]]; // word aligned

endmodule