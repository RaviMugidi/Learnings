`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:14:24 09/19/2022 
// Design Name: 
// Module Name:    dff 
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
module dff(d,clk,clr,q);
  input d,clk,clr;
  output reg q;
  
  assign qbar =~q;
  always@(posedge clk)
  begin
    if(clr)
      q<=0;
	 else 
	    q<=d;
	 end
endmodule
