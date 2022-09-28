`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:58:59 09/03/2022 
// Design Name: 
// Module Name:    Priority_Encoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: verilog code for 8 *3 priority encoder
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Priority_Encoder(in,out);

input [7:0]in;
output reg[2:0]out;

always@(in)
   begin
     casex(in)
	     8'b1xxxxxxx: out=3'b111;
		  8'b01xxxxxx: out=3'b110;
		  8'b001xxxxx: out=3'b101;
		  8'b0001xxxx: out=3'b100;
		  8'b00001xxx: out=3'b011;
		  8'b000001xx: out=3'b010;
		  8'b0000001x: out=3'b001;
		  8'b00000001: out=3'b000;
	  endcase
   end
endmodule
