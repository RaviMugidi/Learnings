`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:34:32 08/17/2022 
// Design Name: 
// Module Name:    melay_ex 
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
module melay_ex(x,clk,out,y);

   input x,clk;
	output [1:0] out;
	output y;
	
	wire [2:0]w;
	
	T_ff t1(x,clk,rst,out[0],w[0]);
	and a(w[2],x,out[0]);
	T_ff t2(w[2],clk,rst,out[1],w[1]);
	assign y=(x*out[1])*~out[0];


endmodule

module T_ff(T,CLK,RST,Q,Qbar);

  input T,CLK,RST;
  output reg Q;
  output Qbar;
  
  initial begin
     Q<=1'b0;
	end
  assign Qbar=~Q;
  
  always @(posedge CLK or posedge RST)
    begin 
	   if(RST==1)
		  Q <= 1'b0;
		else
		  Q <= ~Q;
	 end
endmodule