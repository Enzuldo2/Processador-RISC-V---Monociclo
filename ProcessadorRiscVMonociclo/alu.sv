
//
// alu.sv : unidade logica-aritmetica p/ algumas instrucoes
//
// Simulação: 


module alu(input  logic [31:0] a, b,
           input  logic [2:0]  alucontrol,
           output logic [31:0] result,
           output logic        Zero,
			  output logic        Menor);

  logic [31:0] condinvb; // pega o b, se alucontrol[0] for 0 e pega o b~ se for 1
  logic [31:0] sum;      //  aqui é o resultado de a + b + o bit de carry in
  logic        v;            // overflow
  logic        isAddSub;     // true when is add or subtract operation

  assign condinvb = alucontrol[0] ? ~b : b;
  assign sum = a + condinvb + alucontrol[0];
  assign isAddSub = ~alucontrol[2] & ~alucontrol[1] | //testando se foi soma ou sub
                    ~alucontrol[1] & alucontrol[0];

  always_comb
    case (alucontrol)
      3'b000:  result = sum;         // add
      3'b001:  result = sum;         // subtract
      3'b010:  result = a & b;       // and
      3'b011:  result = a | b;       // or
      3'b101:  result = sum[31] ^ v; // slt , pega o ultimo bit para ver se deu negativo(A - B , A<B), se der overflow não vale o bit mais significativo.
		3'b100:  result = a << b;   // sll
		3'b110:  result = a >> b;   // srl
		3'b111:  result = a ^ b;    //xor
      default: result = 32'bx;
    endcase

  assign Zero = (result == 32'b0); //se todos os bits derem 0 o sinal zero sai como 1.
  assign Menor = (sum[31] ^ v);  //1 se A < B
  assign v = ~(alucontrol[0] ^ a[31] ^ b[31]) & (a[31] ^ sum[31]) & isAddSub; //verifica se é overflow.
  
endmodule
