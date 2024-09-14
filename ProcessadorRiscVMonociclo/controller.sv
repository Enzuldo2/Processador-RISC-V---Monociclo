
//
// controller.sv : Controlador RISC-V Monociclo 
//

module controller(input  logic [6:0] op,
                  input  logic [2:0] funct3,
                  input  logic       funct7b5,
                  input  logic       Zero,
						input  logic       Menor,
                  output logic [1:0] ResultSrc,
                  output logic       MemWrite,
                  output logic       PCSrc, ALUSrc,
                  output logic       RegWrite, Jump,
                  output logic [1:0] ImmSrc,
                  output logic [2:0] ALUControl,
						output logic [3:0] Branch2,
						output logic [1:0] ALUOp2,
						output logic       Bne,
						output logic       Bge,
						output logic       Blt,
						output logic       Beq);

  logic [1:0] ALUOp;
  logic [3:0] Branch; 
  
  assign Branch2 = Branch;
  assign ALUOp2 = ALUOp;
  
  assign Bne = (Branch[2] & ~Zero);
  assign Bge = ((~Menor | Zero) & Branch[3]);
  assign Blt = (Branch[1] & Menor);
  assign Beq = (Branch[0] & Zero);

  maindec md(op, ResultSrc, MemWrite,ALUSrc, RegWrite, Jump, ImmSrc, ALUOp);
  aludec  ad(op[5], funct3, funct7b5, ALUOp, ALUControl,Branch);

  assign PCSrc = (((~Menor | Zero) & Branch[3])||(Branch[1] & Menor)||(Branch[2] & ~Zero)||(Branch[0] & Zero) || Jump); 
endmodule

