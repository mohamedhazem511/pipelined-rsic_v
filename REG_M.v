/*
   Created by : Mohamed Hazem Mamdouh
   12-08-2023
   7:30 PM
 */
//***************  Register of Memory R/W  ***************//
module REG_M (
            input  wire        CLK         ,
            input  wire        RST         ,
            input  wire        RegWriteE   ,
            input  wire [1:0]  ResultSrcE  ,
            input  wire        MemWriteE   ,
            input  wire [31:0] ALUResultE  ,
            input  wire [31:0] WriteDataE  ,
            input  wire [4:0]  RdE         ,
            input  wire [31:0] PCPlus4E    ,
            output reg         RegWriteM   ,
            output reg  [1:0]  ResultSrcM  ,
            output reg         MemWriteM   ,
            output reg  [31:0] ALUResultM  ,
            output reg  [31:0] WriteDataM  ,
            output reg  [4:0]  RdM         ,
            output reg  [31:0] PCPlus4M    
              
    );
  
  always @(posedge CLK or negedge RST)
  begin
   if(!RST)
   begin
   RegWriteM    <= 1'b0   ;
   ResultSrcM   <= 2'b0   ;
   MemWriteM    <= 1'b0   ;
   ALUResultM   <= 32'b0  ;
   WriteDataM   <= 32'b0  ;
   RdM          <= 5'b0   ;
   PCPlus4M     <= 32'b0  ; 
   end
   else
   begin
   RegWriteM    <= RegWriteE   ;
   ResultSrcM   <= ResultSrcE  ;
   MemWriteM    <= MemWriteE   ;
   ALUResultM   <= ALUResultE  ;
   WriteDataM   <= WriteDataE  ;
   RdM          <= RdE         ;
   PCPlus4M     <= PCPlus4E    ;  
   end
   end	

endmodule