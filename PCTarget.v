/*
   Created by : Mohamed Hazem Mamdouh
   12-08-2023
   7:30 PM
 */


//*********** 32-bit alu for only addition operation *****************//

module PCTargt (PC,ImmExt ,PCTargt);
     
	input  wire  [31:0] PC;
  input  wire  [31:0] ImmExt;
	output wire  [31:0] PCTargt ;
	assign PCTargt = PC + ImmExt;

endmodule