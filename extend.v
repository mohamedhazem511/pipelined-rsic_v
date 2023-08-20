/*
   Created by : Mohamed Hazem Mamdouh
   12-08-2023
   7:30 PM
 */
//***************  sign extend  ***************//

module Extend #(parameter width = 32)(
    input wire  [31 : 7] INSTR ,
	 input wire [1 : 0] IMMSrc ,
	 output reg [31 : 0] IMMExt
    );
	 
	 always @(*)
	 begin
	   case(IMMSrc)
		  2'b00 : begin 
		         IMMExt = {{20{INSTR[31]}} , INSTR[31 : 20]} ;
		       end
		  2'b01 : begin 
		         IMMExt = {{20{INSTR[31]}} , INSTR[31 : 25] , INSTR[11 : 7]} ;
		       end
		  2'b10 : begin
		         IMMExt = {{20{INSTR[31]}}, INSTR[7], INSTR[30 : 25], INSTR[11 : 8], 1'b0} ;
		       end
		  2'b11 : begin 
		         IMMExt = {{12{INSTR[31]}}, INSTR[19 : 12], INSTR[20], INSTR[30 : 21], 1'b0} ;
		       end
                 default : IMMExt =32'b0;
		endcase
	 end


endmodule
