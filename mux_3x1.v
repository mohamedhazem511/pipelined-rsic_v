/*
   Created by : Mohamed Hazem Mamdouh
   12-08-2023
   7:30 PM
 */

 //***************  MUX_3X1 ***************//

module mux_3x1 #(parameter N =32 )
				(
					input [N-1:0] ALUResult,
					input [N-1:0] ReadData,
					input [N-1:0] PCPlus4,
					input [1:0] ResultSrc,
					output reg [N-1:0] Result
				);
				
				
				always @(*)
				 begin
					case (ResultSrc)
					 2'b00   : Result = ALUResult;
					 2'b01   : Result = ReadData;
					 2'b10   : Result = PCPlus4;
					 default : Result = 0;
					endcase
				 end

    
endmodule
