
/*
   Created by : Mohamed Hazem Mamdouh
   12-08-2023
   7:30 PM
 */
//***************  MUX 2X1  ***************//
module mux_2x1 #(parameter width = 32)
          (
            input  wire [width-1 : 0] RD2 ,
	          input  wire [width-1 : 0] ImmExt ,
	          input  wire ALUSrc ,
	          output wire [width-1 : 0] SrcB 
    );
  
  assign SrcB = ALUSrc ? ImmExt : RD2 ;

endmodule
