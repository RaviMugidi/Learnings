`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:12:50 08/24/2022
// Design Name:   T_FF
// Module Name:   C:/Users/Ravi/Xilinx/FA/tb_Tff.v
// Project Name:  FA


module tb_Tff;

	// Inputs
	reg clk;
	reg T;
	reg rst;

	// Outputs
	wire Q;
	wire Qb;
	
	initial 
	begin
	clk =1;
	end
	always@(clk) #10 clk <= ~clk;
	
	
	T_FF uut (.clk(clk),.T(T), .rst(rst), .Q(Q), .Qb(Qb));	
	task rst_tsk;
	   begin 
		  @(negedge clk)
		  rst =1;
		  @(negedge clk)
		  rst =0;
		 end
	endtask
	
	task t_tsk(input a);
	  begin
	    @(negedge clk)
		   T <= a;
	  end
	endtask

	initial begin
		rst_tsk;
		t_tsk(1);
		t_tsk(0);
		t_tsk(1);
		#100  rst_tsk;
	end
      
endmodule

