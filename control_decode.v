/*
   Created by : Mohamed Hazem Mamdouh
   12-08-2023
   7:30 PM
 */


//***************  Control decode Unit Module ***************//



module control_decode  (

//*************** Inputs && Outputs Port Declaration ***************//


 input   wire     [6:0]       OP,
 output  reg                  Branch,
 output  reg                  Jump, 
 output  reg                  ALUSrc,
 output  reg                  RegWrite,
 output  reg                  MemWrite,
 output  reg      [1:0]       ResultSrc, 
 output  reg      [1:0]       ALUOp,
 output  reg      [1:0]       ImmSrc

);


parameter   [6:0]   lw    = 7'b0000011,
                    sw    = 7'b0100011,
					R     = 7'b0110011,
					I     = 7'b0010011,
					jal   = 7'b1101111,
                    beq   = 7'b1100011;


always @ (*)
begin
 case(OP)
  lw      : {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump} = 11'b 1_00_1_0_01_0_00_0;          
  sw      : {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump} = 11'b 0_01_1_1_00_0_00_0;
  R       : {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump} = 11'b 1_00_0_0_00_0_10_0;
  beq     : {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump} = 11'b 0_10_0_0_00_1_01_0;
  I       : {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump} = 11'b 1_00_1_0_00_0_10_0;
  jal     : {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump} = 11'b 1_11_0_0_10_0_00_1;
  default : {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump} = 11'b 0_00_0_0_00_0_00_0;
  endcase            
 end 
endmodule
 