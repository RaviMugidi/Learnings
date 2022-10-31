`timescale 1ns / 1ps
// detector of sequence "11011"
module detector(z,clk,x);

input clk,x;
output reg z;

reg [2:0]state;

parameter a=0;
parameter b=1;
parameter c=2;
parameter d=3;
parameter e=4;

initial state<=a;

always @(posedge clk )
    begin 
       case(state)
		         a:begin
			         if(x)
						    begin
							   state<=b;
								z<=1'b0;
							 end
						else
						    begin 
							   state<=a;
								z<=1'b0;
							 end
						end

		         b:begin
			         if(x)
						    begin
							   state<=c;
								z<=1'b0;
							 end
						else
						    begin 
							   state<=a;
								z<=1'b0;
							 end
						end

		         c:begin
			         if(x==1)
						    begin
							   state<=b;
								z<=1'b0;
							 end
						else
						    begin 
							   state<=d;
								z<=1'b0;
							 end
						end
						
		         d:begin
			         if(x)
						    begin
							   state<=e;
								z<=1'b0;
							 end
						else
						    begin 
							   state<=a;
								z<=1'b0;
							 end
						end
						
		         e:begin
			         if(x==1)
						    begin
							   state<=a;
								z<=1'b1;
							 end
						else
						    begin 
							   state<=a;
								z<=1'b0;
							 end
						end
       endcase
		
    end
endmodule
