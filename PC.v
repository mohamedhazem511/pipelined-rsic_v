/*
   Created by : Mohamed Hazem Mamdouh
   12-08-2023
   7:30 PM
 */
//***************  PROGRAM COUNTER  ***************//
module PC #(parameter width = 32 )
           (
            input wire [width-1 : 0] PCNext ,
            input wire CLK ,
	          input wire RST ,
	          output reg [width-1 : 0] PC 
    );
  
  always @(posedge CLK or negedge RST)
  begin
   if(!RST)
     begin
       PC <= 32'b0 ;
     end
   else
	    begin
		     PC <= PCNext ;
		  end
	 end	

endmodule
