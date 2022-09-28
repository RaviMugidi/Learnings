`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:09:25 08/24/2022 
// Design Name: 
// Module Name:    T_FF 
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module T_FF (clk, T, rst, Q, Qb);

input clk, T, rst;
output reg Q;
output Qb;

assign Qb=~Q;

always@(posedge clk)
  begin 
   if(rst)
     Q <= 1'b0;
   else 
     begin
       if(T)
         Q <= ~Q;
       else 
         Q <= Q;
     end
  end
endmodule

