//
// aludec.sv : Decodificador da ALU
//

module aludec(input  logic       opb5,
              input  logic [2:0] funct3,
              input  logic       funct7b5, 
              input  logic [1:0] ALUOp,
              output logic [2:0] ALUControl,
				  output logic [3:0] Branch);

  logic  RtypeSub;
  assign RtypeSub = funct7b5 & opb5;  // TRUE for R-type subtract instruction
	
  always_comb
    case(ALUOp)
      2'b00:
				begin
					ALUControl = 3'b000; // addition for lw,sw
					Branch = 4'b0000;
				end
      2'b01:                
					case(funct3)
						3'b000:
								begin
								  ALUControl = 3'b001; 
						        Branch = 4'b001; // subtraction for beq
								end
						3'b100:
								begin
								  ALUControl = 3'b001;
								  Branch = 4'b0010; //sub for blt
								end
						3'b001:
								begin
								  ALUControl = 3'b001;
								  Branch = 4'b0100;  //sub for bne
								end
						3'b101:
								begin
								  ALUControl = 3'b001;
								  Branch = 4'b1000; // sub for bge
								end
						default:
							begin
								ALUControl = 3'bxxx;
								Branch = 4'bxxxx;
							end
					endcase
      default: case(funct3) // R-type or I-type ALU
                 3'b000:  if (RtypeSub) 
                            begin ALUControl = 3'b001; // sub
									 Branch = 4'b0000; end
                          else          
                            begin ALUControl = 3'b000; // add, addi
									 Branch = 4'b0000; end
                 3'b010:    begin ALUControl = 3'b101; // slt, slti
									 Branch = 4'b0000; end
                 3'b110:    begin ALUControl = 3'b011; // or, ori
									 Branch = 4'b0000; end
                 3'b111:    begin ALUControl = 3'b010; // and, andi
									 Branch = 4'b0000; end
					  3'b001:    begin ALUControl = 3'b100; //sll ,slli
									 Branch = 4'b0000; end
					  3'b101:    begin ALUControl = 3'b110; //srl , srli
					             Branch = 4'b0000; end
					  3'b100:    begin ALUControl = 3'b111; //xor , xori
									 Branch = 4'b0000; end
                 default:   begin ALUControl = 3'bxxx;
									 Branch = 4'bxxxx; end   // ???
               endcase
    endcase
endmodule

