`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:41:32 09/01/2022
// Design Name:   Single_Port_Ram
// Module Name:   C:/Users/Ravi/Xilinx/FA/tb_single_por_mem.v
// Project Name:  FA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Single_Port_Ram
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_single_por_mem;

	// Inputs
	reg clk;
	reg [3:0] addr;
	reg we;
	reg re;
	integer i;
	
	reg [7:0]temp;
	
	wire [7:0] data;
	
	initial 
	begin clk=0; temp=0; re=0;end
	always @(clk) #10 clk<=~clk;
	
	Single_Port_Ram uut (
		.clk(clk), 
		.data(data), 
		.addr(addr), 
		.we(we), 
		.re(re)
	);
	assign data=(!re && we)? temp:8'hzz;
	task write(input [7:0]A,input [3:0]B);
	  begin
	    @(negedge clk)
		 we<=1'b1;
		 re<=1'b0;
		 temp<=A;
		 addr<=B;
	  end
	endtask
	
	task read(input [3:0]C);
	  begin
	    @(negedge clk)
		 we<=1'b0;
		 re<=1'b1;
       addr<=C;	  
	  end
	endtask
	initial begin
     //{re,wr,addr}={0,1,0000};
	  for(i=0;i<16;i=i+1)
	    begin
		   write(i*i,i);
		 end
	  for(i=15;i>=0;i=i-1)
	  begin
	     read(i);
	  end
	  $finish;
	end  
endmodule

