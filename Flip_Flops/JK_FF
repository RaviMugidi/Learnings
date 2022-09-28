`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:36:00 08/25/2022 
// Design Name: 
// Module Name:    JK_FF 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module JK_FF(clk,j,k,rst,Q,Qb);
input rst,clk;
input j,k;

output reg Q;
output Qb;

assign Qb =~Q;

always@(posedge clk)
  begin
    if(rst)
	   Q <= 1'b0;
	 else
	   begin
		  case({j,k})
		     2'b00:Q <= Q;
			  2'b01:Q <= 0;
			  2'b10:Q <= 1;
			  2'b11:Q <= ~Q;
		  endcase
		end
   end
endmodule
