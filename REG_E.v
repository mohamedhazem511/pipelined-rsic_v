/*
   Created by : Mohamed Hazem Mamdouh
   12-08-2023
   7:30 PM
 */
//***************  Register of Excute  ***************//
module REG_E (
            input  wire        CLK         ,
	          input  wire        RST         ,
            input  wire        RegWriteD   ,
            input  wire [1:0]  ResultSrcD  ,
            input  wire        MemWriteD   ,
            input  wire        JumpD       ,
            input  wire        BranchD     ,
            input  wire [2:0]  ALUControlD ,
            input  wire        ALUSrcD     ,
            input  wire [31:0] RD1D        ,
            input  wire [31:0] RD2D        ,
            input  wire [31:0] PCD         ,
            input  wire [4:0]  RdD         ,
            input  wire [31:0] ImmExtD     ,
            input  wire [31:0] PCPlus4D    ,
            output reg         RegWriteE   ,
            output reg  [1:0]  ResultSrcE  ,
            output reg         MemWriteE   ,
            output reg         JumpE       ,
            output reg         BranchE     ,
            output reg  [2:0]  ALUControlE ,
            output reg         ALUSrcE     ,
            output reg  [31:0] RD1E        ,
            output reg  [31:0] RD2E        ,
            output reg  [31:0] PCE         ,
            output reg  [4:0]  RdE         ,
            output reg  [31:0] ImmExtE     ,
            output reg  [31:0] PCPlus4E     
    );
  
  always @(posedge CLK or negedge RST)
  begin
   if(!RST)
   begin
   RegWriteE    <= 1'b0   ;
   ResultSrcE   <= 2'b0   ;
   MemWriteE    <= 1'b0   ;
   JumpE        <= 1'b0   ;
   BranchE      <= 1'b0   ;
   ALUControlE  <= 3'b0   ;
   ALUSrcE      <= 1'b0   ;
   RD1E         <= 32'b0  ;
   RD2E         <= 32'b0  ;
   PCE          <= 32'b0  ;
   RdE          <= 5'b0   ;
   ImmExtE      <= 32'b0  ;
   PCPlus4E     <= 32'b0  ; 
   end
   else
   begin
   RegWriteE    <= RegWriteD     ;
   ResultSrcE   <= ResultSrcD    ;
   MemWriteE    <= MemWriteD     ;
   JumpE        <= JumpD         ;
   BranchE      <= BranchD       ;
   ALUControlE  <= ALUControlD   ;
   ALUSrcE      <= ALUSrcD       ;
   RD1E         <= RD1D          ;
   RD2E         <= RD2D          ;
   PCE          <= PCD           ;
   RdE          <= RdD           ;
   ImmExtE      <= ImmExtD       ;
   PCPlus4E     <= PCPlus4D      ; 
   end
   end	

endmodule