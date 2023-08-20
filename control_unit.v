/*
   Created by : Mohamed Hazem Mamdouh
   12-08-2023
   7:30 PM
 */

//***************  Control Unit Module Top ***************//

module Control_Unit 
(
 input   wire     [6:0]        OP,
 input   wire                  Zero,
 input   wire     [2:0]        funct3,
 input   wire                  funct7,
 output  wire                  Jump,Branch,
 output  wire                  ALUSrc,
 output  wire                  RegWrite,
 output  wire                  MemWrite,
 output  wire      [1:0]       ResultSrc, 
 output  wire      [2:0]       ALUControl,
 output  wire      [1:0]       ImmSrc

);

//*************** internal signals ***************//

wire               [1:0]        ALUOp_c;  

//*************** PORT MAPING ***************//
control_decode  U0_control_decode(
  .OP(OP),
  .Branch(Branch),
  .Jump(Jump), 
  .ALUSrc(ALUSrc),
  .RegWrite(RegWrite),
  .MemWrite(MemWrite),
  .ResultSrc(ResultSrc), 
  .ALUOp(ALUOp_c),
  .ImmSrc(ImmSrc)
);

ALU_Decoder U0_ALU_Decoder(
  .funct3(funct3),
  .funct7(funct7),
  .ALUOP(ALUOp_c),
  .OP(OP[5]),
  .ALUControl(ALUControl)
);

//assign PCSrc = ( ( Zero & Branch_c) | (Jump_c) ) ? 1'b1 : 1'b0 ;

endmodule