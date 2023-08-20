/*
   Created by : Mohamed Hazem Mamdouh
   12-08-2023
   7:30 PM
 */
//***************  Risc-v Top Module ***************//

module risc_v  
(
 input   wire                        CLK,
 input   wire                        RST,
 //////////////// for test /////////////////////////
 output  wire     [31:0]             test    

);

/***************** Internal signal ***************/

 wire      [6:0]       OP_c;
 wire                  Zero;
 wire      [2:0]       funct3_c;
 wire                  funct7_c;
 wire                  PCSrc_c;
 wire                  ALUSrc_c;
 wire                  RegWrite_c,RegWriteE_c,RegWriteM_c,RegWriteW_c;
 wire                  MemWrite_c,MemWriteE_c,MemWriteM_c;
 wire                  JumpE_c,JumpD_c;
 wire                  BranchE_c,BranchD_c;
 wire       [1:0]      ResultSrc_c,ResultSrcE_c,ResultSrcM_c,ResultSrcW_c;
 wire       [2:0]      ALUControl_c,ALUControlE_c;
 wire       [1:0]      ImmSrc_c;
 wire       [31:0]     PC_c,PCD_c;
 wire       [31:0]     PCNext_c;
 wire       [31:0]     RD1D_c,RD2D_c;
 wire       [31:0]     ImmExt_c,ImmExtE_c;
 wire       [31:0]     PCPlus_c,PCPlus4D_C,PCPlus4E_C,PCPlus4M_c,PCPlus4W_c;
 wire       [31:0]     PCTargt_c,PCTargtE_c;
 wire       [31:0]     ALU_Result_c;  
 wire       [31:0]     ALUResultM_c,ALUResultW_c,ResultW;   
 wire       [31:0]     ReadData_c,ReadDataW_c;        
 wire       [31:0]     Instr,InstrD_c;
 wire       [31:0]     Result_c,WriteDataM_c,PCE_c; 
 wire       [31:0]     RD_c,RD1_c,RD2E_c,RD1E_c,RDW;
 wire       [31:0]     SrcB_c;
 wire       [4:0]      RdE_c,RdM_c,RdW_c;


//***************  Port Mapping for Control Unit ***************//


Control_Unit U0_Control_Unit (

  
    .OP(InstrD_c[6:0]),
    .Zero(Zero_c),
    .funct3(InstrD_c[14:12]),
    .funct7(InstrD_c[30]),
    .Jump(JumpD_c),
    .Branch(BranchD_c),
    .ALUSrc(ALUSrc_c),
    .RegWrite(RegWrite_c),
    .MemWrite(MemWrite_c),
    .ResultSrc(ResultSrc_c),
    .ALUControl(ALUControl_c),
    .ImmSrc(ImmSrc_c)

);

//***************  Port Mapping for Program counter ***************//

PC U0_PC(
    .PCNext(PCNext_c),
    .CLK(CLK),
    .RST(RST),
    .PC(PC_c) 
);

//***************  Port Mapping for PCPlus4 ***************//

PCPlus4 U0_PCPlus4(
    .PC(PC_c),
    .PCPlus4(PCPlus_c)
);

//***************  Port Mapping for PCTargt ***************//

PCTargt U0_PCTargt(
    .PC(PC_c),
    .ImmExt(ImmExtE_c),
    .PCTargt(PCTargtE_c)
);

//***************  Port Mapping for mux 2x1 for SrcB ***************//
mux_2x1 U0_mux_2x1(
    .RD2(RD2E_c),
    .ImmExt(ImmExtE_c),
    .ALUSrc(ALUSrcE_c),
    .SrcB(SrcB_c) 
);
//***************  Port Mapping for mux 2x1 for pc counter  ***************//
mux_2x1 U1_mux_2x1(
    .RD2(PCPlus_c),
    .ImmExt(PCTargtE_c),
    .ALUSrc(PCSrc),
    .SrcB(PCNext_c) 
);

//***************  Port Mapping for instraction memory  ***************//

inst_mem U0_inst_mem(
    .A(PC_c),
    .RD(Instr)
);

//***************  Port Mapping for register file  ***************//

Register_File U0_Register_File( 
    .A1(InstrD_c[19:15]),
    .A2(InstrD_c[24:20]),
    .A3(RdW_c),
    .WD3(ResultW),
    .CLK(CLK),
    .RST(RST),
    .WE3(RegWriteW_c),
    .RD1(RD1D_c),
    .RD2(RD2D_c)   
);

//***************  Port Mapping for mux 3x1  ***************//

mux_3x1 U0_mux_3x1(
    .ALUResult(ALUResultW_c),
    .ReadData(ReadDataW_c),
    .PCPlus4(PCPlus4W_c),
    .ResultSrc(ResultSrc_c),
    .Result(ResultW)
);

//***************  Port Mapping for sign extend  ***************//

Extend U0_Extend(
    .INSTR(InstrD_c[31:7]),
    .IMMSrc(ImmSrc_c),
    .IMMExt(ImmExt_c)
);

//***************  Port Mapping for alu  ***************//

alu  U0_alu(
    .SrcA(RD1E_c),
    .SrcB(SrcB_c),
    .ALUControl(ALUControlE_c),
    .ALUResult(ALU_Result_c),
    .Zero(Zero)
);

//***************  Port Mapping for data memory  ***************//

Data_Mem U0_Data_Mem(
    .A(ALUResultM_c),
    .WD(WriteDataM_c),
    .CLK(CLK),
    .RST(RST),
    .WE(MemWriteM_c),
    .RD(RD_c),
    .test(test) 
);

REG_F U0_REG_F(
    .CLK(CLK)              ,
    .RST(RST)              ,
    .RD(Instr)             ,
    .PCPlus4F(PCPlus_c)   ,
    .PCF(PC_c)             ,
    .InstrD(InstrD_c)      ,
    .PCPlus4D(PCPlus4D_C)  ,
    .PCD(PCD_c)
);

REG_E U0_REG_E (
    .CLK(CLK)                   ,
	.RST(RST)                   ,
    .RegWriteD(RegWrite_c)     ,
    .ResultSrcD(ResultSrc_c)   ,
    .MemWriteD(MemWrite_c)     ,
    .JumpD(JumpD_c)             ,
    .BranchD(BranchD_c)         ,
    .ALUControlD(ALUControl_c) ,
    .ALUSrcD(ALUSrc_c)         ,
    .RD1D(RD1D_c)               ,
    .RD2D (RD2D_c)              ,
    .PCD(PCD_c)                 ,
    .RdD(InstrD_c[11:7])                 ,
    .ImmExtD(ImmExt_c)         ,
    .PCPlus4D(PCPlus4D_C)       ,
    .RegWriteE(RegWriteE_c)     ,
    .ResultSrcE(ResultSrcE_c)   ,
    .MemWriteE(MemWriteE_c)     ,
    .JumpE(JumpE_c)             ,
    .BranchE(BranchE_c)         ,
    .ALUControlE(ALUControlE_c) ,
    .ALUSrcE(ALUSrcE_c)         ,
    .RD1E(RD1E_c)               ,
    .RD2E(RD2E_c)               ,
    .PCE(PCE_c)                 ,
    .RdE(RdE_c)                 ,
    .ImmExtE(ImmExtE_c)         ,
    .PCPlus4E(PCPlus4E_c)  

);

REG_M U0_REG_M (
    .CLK(CLK)                  ,
    .RST(RST)                  ,
    .RegWriteE(RegWriteE_c)    ,
    .ResultSrcE(ResultSrcE_c)  ,
    .MemWriteE(MemWriteE_c)    ,
    .ALUResultE(ALU_Result_c)  ,
    .WriteDataE(RD2E_c)  ,
    .RdE(RdE_c)                ,
    .PCPlus4E(PCPlus4E_c)      ,
    .RegWriteM(RegWriteM_c)    ,
    .ResultSrcM(ResultSrcM_c)  ,
    .MemWriteM(MemWriteM_c)    ,
    .ALUResultM(ALUResultM_c)  ,
    .WriteDataM(WriteDataM_c)  ,
    .RdM(RdM_c)                ,
    .PCPlus4M(PCPlus4M_c) 
);
REG_W U0_REG_W (
    .CLK(CLK)                  ,
	.RST(RST)                  ,
    .RegWriteM(RegWriteM_c)    ,
    .ResultSrcM(ResultSrcM_c)  ,
    .ALUResultM(ALUResultM_c)  ,
    .RDM(RD_c)                  ,
    .RdM(RdM_c)                ,
    .PCPlus4M(PCPlus4M_c)      ,
    .RegWriteW(RegWriteW_c)    ,
    .ResultSrcW(ResultSrcW_c)  ,
    .ALUResultW(ALUResultW_c)  ,
    .RDW(ReadDataW_c)          ,
    .RdW(RdW_c)                ,
    .PCPlus4W(PCPlus4W_c)  
);

assign PCSrc = ( ( Zero & BranchE_c) | (JumpE_c) ) ? 1'b1 : 1'b0 ;




endmodule
