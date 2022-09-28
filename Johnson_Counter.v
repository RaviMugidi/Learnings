`timescale 1ns / 1ps

module Johnson_Counter(clk,rst,out);
   input rst,clk;
	output [3:0]out;
	
	wire outbar[0:3];
	
	
	
	D_ff d1(outbar[0],clk,rst,out[3],outbar[3]);
	D_ff d2(~outbar[3],clk,rst,out[2],outbar[2]);
	D_ff d3(~outbar[2],clk,rst,out[1],outbar[1]);
	D_ff d4(~outbar[1],clk,rst,out[0],outbar[0]);
	
endmodule

module D_ff(D,CLK,RST,Q,Qbar);

  input D,CLK,RST;
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
		  Q <= D;
	 end
endmodule
