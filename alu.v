/*
   Created by : Mohamed Hazem Mamdouh
   12-08-2023
   7:30 PM
 */
//***************  ALU  ***************//
 module alu
   (
   input     wire  [31:0]  SrcA,
   input     wire  [31:0]  SrcB,
   input     wire  [2:0]   ALUControl,
   output    reg   [31:0]  ALUResult,
   output    wire          Zero
   );
    
 always @(*) // Cobinational Always
   begin
   case(ALUControl)
	 3'b000: begin  //ADD 
           ALUResult = SrcA+SrcB; 
           end
	 3'b001: begin  //SUB
           ALUResult = SrcA-SrcB; 
           end
	 3'b010: begin  //AND 
           ALUResult = SrcA&SrcB;
           end
	 3'b011: begin  //OR
           ALUResult = SrcA|SrcB; 
           end
	 3'b101: begin  // SIL
           if(SrcA < SrcB)
           begin
				   ALUResult = 32'b1;
           end 
				   else
           begin
				   ALUResult = 0;
           end
	         end
    default:begin
            ALUResult = 0;
            end         
    endcase	
  end
 
  assign Zero = (ALUResult == 0 ) ? 1'b1 :1'b0; /// zero flag
endmodule
