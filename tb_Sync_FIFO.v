`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:52:31 09/14/2022
// Design Name:   Sync_FIFO
// Module Name:   C:/Users/Ravi/Xilinx/FA/tb_Sync_FIFO.v
// Project Name:  FA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Sync_FIFO
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_Sync_FIFO;

	// Inputs
	reg [7:0] data_in;
	reg clk;
	reg rst_a;
	reg wr_en;
	reg rd_en;

	// Outputs
	wire [7:0] data_out;
	wire full;
	wire empty;
	
	initial clk =0;
	always@(clk)#10 clk<=~clk;

	// Instantiate the Unit Under Test (UUT)
	Sync_FIFO uut (
		.data_out(data_out), 
		.full(full), 
		.empty(empty), 
		.data_in(data_in), 
		.clk(clk), 
		.rst_a(rst_a), 
		.wr_en(wr_en), 
		.rd_en(rd_en)
	);
	
	task initialize;
	begin
	  data_in <= 0;
		rst_a <= 0;
		wr_en <= 0;
		rd_en <= 0;
	end
	endtask
	
	task data(input[7:0] a);
	begin
	 @(negedge clk)
	  data_in <= a;
	end
	endtask
	
	task reset;
	begin
	  @(negedge clk)
	    rst_a <=1;
		@(negedge clk)
		 rst_a <=0;
	end
	endtask

	initial begin
		// Initialize Inputs
		
		initialize;
		#10 reset;
		#50 wr_en <=1;
		repeat(16)
		  begin
		    data($random);
		  end
		 #10 wr_en <=0;
		 #50 rd_en <= 1;
		 #300 rd_en <=0;
		 $finish;
	end
      
endmodule

