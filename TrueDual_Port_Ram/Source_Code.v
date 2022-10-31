`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:44:07 09/08/2022 
// Design Name: 
// Module Name:    Tru_dual_port_Ram 
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
module True_dual_port_Ram(clk,data_0,data_1,addr_0,addr_1,we_0,we_1,re_0,re_1);
  input clk,we_0,we_1,re_0,re_1;
  input[3:0] addr_0,addr_1;
  
  inout [7:0]data_0,data_1;
  
  reg [7:0]temp_0,temp_1;
  
  reg [7:0]mem[15:0];
  
  assign data_0 = (!we_0&&re_0)?temp_0:8'hzz;
  assign data_1 = (!we_1&&re_1)?temp_1:8'hzz;
  always@(posedge clk)
  begin
    if(we_0 && !re_0)
	   begin
		  mem[addr_0] <= data_0;
		end
	 else if(!we_0 && re_0)
	   begin
		  temp_0 <= mem[addr_0];
		end
  end
  always@(negedge clk)  //single port ram design which is sensitive to negitive edge of clock
  begin
    if(we_1 && !re_1)
	   begin
		  mem[addr_1] <= data_1;
		end
	 else if(!we_1 && re_1)
	   begin
		  temp_1 <= mem[addr_1];
		end
  end

endmodule
