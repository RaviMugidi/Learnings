`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:52:46 09/27/2022
// Design Name:   Melay_Seq_0100
// Module Name:   C:/Users/Ravi/Xilinx/FA/tb_Melayseq_0100.v
// Project Name:  FA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Melay_Seq_0100
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_Melayseq_0100;

	// Inputs
	reg x;
	reg clk;
	reg rst;

	// Outputs
	wire out;
	
	initial clk =0;
	always@(clk) #10 clk <= ~clk;

	// Instantiate the Unit Under Test (UUT)
	Melay_Seq_0100 uut (
		.x(x), 
		.clk(clk), 
		.rst(rst), 
		.out(out)
	);
	
	task reset;
	begin
	  @(negedge clk)
	    rst <=1;
	  @(negedge clk)
	    rst <=0;
	end
	endtask
	
	task in(input a);
	begin
	@(negedge clk)
	  x <= a;
	end
	endtask

	initial begin
     
	  {x,rst} =0;
	  reset;
	  
	  in(0);
	  in(1);
	  in(0);
	  in(0);
	  in(1);
	  in(0);
	  in(0);
	  in(0);
	  in(1);
	  
	end
      
endmodule

