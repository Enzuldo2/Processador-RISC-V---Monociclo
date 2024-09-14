

module top(input  logic        clk, reset, 
           output logic [31:0] WriteData, DataAdr, 
           output logic        MemWrite,
			  output logic [3:0]  Branch,
			  output logic [1:0] ALUOp2,
			  output logic       Bne,
			  output logic       Bge,
			  output logic       Blt,
			  output logic       Beq,
			  output logic       Zero,
			  output logic       Menor);

  logic [31:0] PC, Instr, ReadData;
  
  // instantiate processor and memories
  riscvsingle rvsingle(clk, reset, PC, Instr, MemWrite, DataAdr, 
                       WriteData, ReadData,Branch,ALUOp2,Bne,Bge,Blt,Beq,Zero,Menor);
					  
  imem imem(PC, Instr);
  
  dmem dmem(clk, MemWrite, DataAdr, WriteData, ReadData);
  
    
endmodule

