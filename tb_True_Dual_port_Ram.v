`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:16:37 09/08/2022
// Design Name:   True_dual_port_Ram
// Module Name:   C:/Users/Ravi/Xilinx/FA/tb_True_Dual_port_Ram.v
// Project Name:  FA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: True_dual_port_Ram
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_True_Dual_port_Ram;

	// Inputs
	reg clk;
	reg [3:0] addr_0;
	reg [3:0] addr_1;
	reg we_0;
	reg we_1;
	reg re_0;
	reg re_1;

	integer i,j;
	
	wire [7:0] data_0;
	wire [7:0] data_1;
	
	reg[7:0] temp_0,temp_1;
	
	initial clk=0;
	always@(clk) #10 clk <= ~clk;
	

	True_dual_port_Ram uut (
		.clk(clk), 
		.data_0(data_0), 
		.data_1(data_1), 
		.addr_0(addr_0), 
		.addr_1(addr_1), 
		.we_0(we_0), 
		.we_1(we_1), 
		.re_0(re_0), 
		.re_1(re_1)
	);
	assign data_0 = (we_0 && !re_0)?temp_0:8'hzz;
	assign data_1 = (we_1 && !re_1)?temp_1:8'hzz;
	
	task initialize;
	   begin
	    {we_0,re_0,we_1,re_1}<= 0;
		 temp_0 <=0;
		 temp_1 <=0;
		 addr_0 <=0;
		 addr_1 <=0;
		 end
		 endtask
	
  task write_0(input [3:0]A,input[7:0] B);
     begin
	    @(negedge clk)
       we_0<=1;
		 re_0<=0;
		 addr_0 <= A;
		 temp_0 <= B;
		 
     end
	 endtask
  task read_0(input [3:0]C);
     begin
	  @(negedge clk)
	    we_0 <= 0;
		 re_0 <= 1;
		 addr_0 <= C;
	  end
	endtask
	task write_1(input [3:0]a,input[7:0] b);
     begin
	    @(posedge clk)
       we_1<=1;
		 re_1<=0;
		 addr_1 <= a;
		 temp_1 <= b;
		 
     end
	 endtask
  task read_1(input [3:0]c);
     begin
	  @(posedge clk)
	    we_1 <= 0;
		 re_1 <= 1;
		 addr_1 <= c;
	  end
	endtask
	initial 
	  begin
	    initialize;
		 #5;
	  end
	initial 
	  fork
	    for(i=0;i<16;i=i+2)
		   begin
			  write_0(i,i*i);
			end
		 for(j=1;j<16;j=j+2)
	      begin
			  write_1(j,j*j);
			end
			
			#200 for(i=15;i>=0;i=i-2)
		   begin
			  read_0(i);
			end
			#200 for(j=14;j>=0;j=j-2)
		   begin
			  read_1(j);
			end
	  join
	  
      
endmodule

