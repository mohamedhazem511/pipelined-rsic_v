/*
   Created by : Mohamed Hazem Mamdouh
   12-08-2023
   7:30 PM
 */


//*********** 32-bit alu for only addition operation *****************//

module PCPlus4 (PC, PCPlus4);
     
	input  wire  [31:0] PC;
	output wire  [31:0] PCPlus4 ;
	assign PCPlus4 = PC + 4;

endmodule