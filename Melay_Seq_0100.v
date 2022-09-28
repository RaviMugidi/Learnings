`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:36:16 09/27/2022 
// Design Name: 
// Module Name:    Melay_Seq_0100 
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
module Melay_Seq_0100(x,clk,rst,out);

input x,clk,rst;

output reg out;

reg [1:0]state;

parameter idle=2'b00;
parameter s0 = 2'b01;
parameter s01 = 2'b10;
parameter s010 =2'b11;

initial state =idle;

always@(posedge clk)
 begin
 if(rst)begin
	   state <= idle;
		out <=0;
		end
	else
	   begin
	case(state)
	  idle:begin
	     if(x)
		    begin
			    state <= idle;
				 out  <= 0;
			 end
		  else
          begin
			   state <= s0;
				out <=0;
          end
        end	
     s0:
	    begin
	     if(x)
		    begin
			    state <= s01;
				 out  <= 0;
			 end
		  else
          begin
			   state <= s0;
				out <=0;
          end
       end	
     s01:
	    begin
	     if(x)
		    begin
			    state <= idle;
				 out  <= 0;
			 end
		  else
          begin
			   state <= s010;
				out <=0;
          end
      end	
     s010:
		begin
	     if(x)
		    begin
			    state <= s01;
				 out  <= 0;
			 end
		  else
          begin
			   state <= s0;
				out <=1'b1;
          end
        end	
		endcase
     end		  
	end
endmodule
