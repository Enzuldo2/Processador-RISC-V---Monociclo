
module riscvsingle(input  logic        clk, reset,
                   output logic [31:0] PC,
                   input  logic [31:0] Instr,
                   output logic        MemWrite,
                   output logic [31:0] ALUResult, WriteData,
                   input  logic [31:0] ReadData,
						 output logic [3:0]  Branch,
						 output logic [1:0] ALUOp2,
						 output logic       Bne,
						 output logic       Bge,
						 output logic       Blt,
						 output logic       Beq,
						 output logic       Zero2,
						 output logic       Menor2);
						

  logic       ALUSrc, RegWrite, Jump, Zero , Menor , PCSrc;
  logic [1:0] ResultSrc, ImmSrc;
  logic [2:0] ALUControl;
  
  assign Zero2 = Zero;
  assign Menor2 = Menor;

  controller c(Instr[6:0], Instr[14:12], Instr[30], Zero,Menor,
               ResultSrc, MemWrite, PCSrc,
               ALUSrc, RegWrite, Jump,
               ImmSrc, ALUControl,Branch,ALUOp2,Bne,Bge,Blt,Beq);
					
  datapath dp(clk, reset, ResultSrc, PCSrc,
              ALUSrc, RegWrite,
              ImmSrc, ALUControl,
              Zero,Menor, PC,
				  Instr,
              ALUResult, WriteData, ReadData);
endmodule

