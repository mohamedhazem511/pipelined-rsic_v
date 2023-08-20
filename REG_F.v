/*
   Created by : Mohamed Hazem Mamdouh
   12-08-2023
   7:30 PM
 */
//***************  Register of Fetch  ***************//
module REG_F (
            input  wire CLK ,
	        input  wire RST ,
            input  wire [31:0] RD ,
            input  wire [31:0] PCPlus4F ,
            input  wire [31:0] PCF ,
            output reg  [31:0] InstrD ,
            output reg  [31:0] PCPlus4D ,
            output reg  [31:0] PCD 
    );
  
  always @(posedge CLK or negedge RST)
  begin
   if(!RST)
   begin
   InstrD   <= 32'b0;
   PCPlus4D <= 32'b0;
   PCD      <= 32'b0;
   end
   else
   begin
   InstrD    <= RD;
   PCPlus4D  <= PCPlus4F;
   PCD       <= PCF;
   end
   end	

endmodule
