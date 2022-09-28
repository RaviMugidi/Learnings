`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:27:42 09/08/2022
// Design Name:   Priority_Encoder
// Module Name:   C:/Users/Ravi/Xilinx/FA/tb_priority_encoder.v
// Project Name:  FA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Priority_Encoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_priority_encoder;

	reg [7:0] in;

	wire [2:0] out;
	integer i;

	Priority_Encoder uut (
		.in(in), 
		.out(out)
	);
   task encode(input [7:0]a);
	begin
	  in = a;
	  #100;
	  
	end
	endtask
	initial begin
      for(i=0;i<8;i=i+1)
		  begin
		    encode($random%255);
		  end
	end
      
endmodule

