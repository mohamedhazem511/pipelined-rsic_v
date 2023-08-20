/*
   Created by : Mohamed Hazem Mamdouh
   12-08-2023
   7:30 PM
 */
//***************  Data Memory  ***************//

module Data_Mem( 
    input  wire [31:0]   A,
    input  wire [31:0]   WD,
    input  wire          CLK,
    input  wire          RST,
    input  wire          WE,
    output wire [31:0]   RD,
    output wire [31:0]   test
 
  );

//***************  memory decleration   ***************//
reg [31:0] MEM [100:0];

integer i ;
 

always@(posedge CLK or negedge RST)
begin
    if(!RST)
        begin
            for (i=0;i<=100;i=i+1)
                begin
                    MEM[i] <= 0 ;
                end
        end
    else if(WE)
        begin
         MEM[A] <= WD ;
        end
end

assign RD = MEM[A];                                //for read data
assign test = MEM[100];                            //for testing


 
 
endmodule
