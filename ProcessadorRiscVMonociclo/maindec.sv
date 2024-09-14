
//
// maindec.sv : Decodificador Principal
//

module maindec(input  logic [6:0] op,
               output logic [1:0] ResultSrc,
               output logic       MemWrite,
               output logic       ALUSrc,
               output logic       RegWrite, Jump,
               output logic [1:0] ImmSrc,
               output logic [1:0] ALUOp);

  logic [9:0] controls;

  assign {RegWrite, ImmSrc, ALUSrc, MemWrite,
          ResultSrc,  ALUOp, Jump} = controls; //junta todos

  always_comb
    case(op)
    // RegWrite_ImmSrc_ALUSrc_MemWrite_ResultSrc_Branch_ALUOp_Jump
      7'b0000011: controls = 10'b1_00_1_0_01_00_0; // lw
      7'b0100011: controls = 10'b0_01_1_1_00_00_0; // sw
      7'b0110011: controls = 10'b1_xx_0_0_00_10_0; // R-type 
      7'b1100011: controls = 10'b0_10_0_0_00_01_0; // B-type
      7'b0010011: controls = 10'b1_00_1_0_00_10_0; // I-type ALU
      7'b1101111: controls = 10'b1_11_0_0_10_00_1; // jal
      default:    controls = 10'bx_xx_x_x_xx_xx_x; // non-implemented instruction
    endcase
endmodule

