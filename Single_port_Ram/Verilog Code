`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:33:13 09/01/2022 
// Design Name: 
// Module Name:    Single_Port_Ram 
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
module Single_Port_Ram(clk,data,addr,we,re);

input clk,we,re;
input [3:0]addr;
inout [7:0]data;

reg [7:0] temp;

reg [7:0]Mem[15:0];

assign data=(re && !we)?temp:8'bz;
always@(posedge clk)
  begin
     if(we && !re)
	     Mem[addr] <= data;
	  else if(!we && re)
	     temp <= Mem[addr];
  end


endmodule
