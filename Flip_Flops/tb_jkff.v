`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:42:43 08/25/2022
// Design Name:   JK_FF
// Module Name:   C:/Users/Ravi/Xilinx/FA/tb_jkff.v
// Project Name:  FA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: JK_FF
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_jkff;

	// Inputs
	reg clk;
	reg j;
	reg k;
	reg rst;

	// Outputs
	wire Q;
	wire Qb;
	
	initial clk =0;
	always@(clk) #10 clk<=~clk;
	

	// Instantiate the Unit Under Test (UUT)
	JK_FF uut (
		.clk(clk), 
		.j(j), 
		.k(k), 
		.rst(rst), 
		.Q(Q), 
		.Qb(Qb)
	);
	
	task jk_inp(input a, input b);
	  begin
	    @(negedge clk)
		 begin
		 j<=a;
		 k<=b;
		 end
		 end
	endtask
	
	task Rst;
	   begin
		  @(negedge clk)
		    rst=1;
		  @(negedge clk)
		    rst=0;
		end
	endtask
		
	initial begin

   Rst;
	jk_inp(1,0);
	jk_inp(0,0);
	jk_inp(1,1);
	jk_inp(0,1);
	jk_inp(0,0);
	jk_inp(0,0);
	jk_inp(1,1);
	jk_inp(0,0);
	end
      
endmodule

