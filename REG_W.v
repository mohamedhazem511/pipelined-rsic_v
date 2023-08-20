/*
   Created by : Mohamed Hazem Mamdouh
   12-08-2023
   7:30 PM
 */
//***************  Register of Witeback  ***************//
module REG_W (
            input  wire        CLK         ,
	          input  wire        RST         ,
            input  wire        RegWriteM   ,
            input  wire [1:0]  ResultSrcM  ,
            input  wire [31:0] RDM         ,
            input  wire [31:0] ALUResultM  ,
            input  wire [4:0]  RdM         ,
            input  wire [31:0] PCPlus4M    ,
            output reg         RegWriteW   ,
            output reg  [1:0]  ResultSrcW  ,
            output reg  [31:0] ALUResultW  ,
            output reg  [4:0]  RdW         ,
            output reg  [31:0] RDW         ,
            output reg  [31:0] PCPlus4W    
              
    );
  
  always @(posedge CLK or negedge RST)
  begin
   if(!RST)
   begin
   RegWriteW    <= 1'b0   ;
   ResultSrcW   <= 2'b0   ;
   ALUResultW   <= 32'b0  ;
   RdW          <= 5'b0   ;
   RDW          <= 32'b0  ;
   PCPlus4W     <= 32'b0  ; 
   end
   else
   begin
   RegWriteW    <= RegWriteM   ;
   ResultSrcW   <= ResultSrcM  ;
   ALUResultW   <= ALUResultM  ;
   RdW          <= RdM         ;
   RDW          <= RDM         ;
   PCPlus4W     <= PCPlus4M    ;  
   end
   end	

endmodule