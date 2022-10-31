`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:53:55 09/07/2022
// Design Name:   Dua_port_Ram
// Module Name:   C:/Users/Ravi/Xilinx/FA/tb_dual_port_ram.v
// Project Name:  FA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Dua_port_Ram
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_dual_port_ram;

	// Inputs
	reg we;
	reg re;
	reg clk;
	reg [3:0] re_addr;
	reg [3:0] wr_addr;
	reg [7:0] din;
	
	integer i,j;

	// Outputs
	wire [7:0] dout;
	initial clk=0;
	always @(clk) #10 clk <= ~clk;

	// Instantiate the Unit Under Test (UUT)
	Dua_port_Ram uut (
		.we(we), 
		.re(re), 
		.clk(clk), 
		.re_addr(re_addr), 
		.wr_addr(wr_addr), 
		.din(din), 
		.dout(dout)
	);
   task write(input[3:0]W,input [7:0]Din);
	  begin
	    @(negedge clk)
		 we <=1;
		 wr_addr<=W;
		 din <= Din;
		 
	  end
	endtask
	
	task read(input [3:0]R);
	  begin
	    @(negedge clk)
	      re <= 1;
		   re_addr <= R;
	  end
	endtask
	initial
	  fork
		for(i=0;i<16;i=i+1)
		  begin
		   write(i,i+10);
		  end
		for(j=0;j<16;j=j+1)
		  #40
		  begin
		    read(j);
		  end
	join
      
endmodule
