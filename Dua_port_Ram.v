`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:47:01 09/07/2022 
// Design Name: 
// Module Name:    Dua_port_Ram 
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
module Dua_port_Ram(we,re,clk,re_addr,wr_addr,din,dout);
  
  input we,re,clk;
  input [3:0]re_addr,wr_addr;
  input [7:0]din;
  output reg [7:0]dout;
  
  reg [7:0]Mem[15:0];
  
  
  always@(posedge clk) 
  begin
   if(we) Mem[wr_addr] <= din;
	if(re) dout <= Mem[re_addr];
  end
endmodule
