`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:27:55 09/14/2022 
// Design Name: 
// Module Name:    Sync_FIFO 
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
module Sync_FIFO(data_out,full,empty,data_in,clk,rst_a,wr_en,rd_en);

parameter data_width= 8;
parameter address_width= 4;
parameter ram_depth = 16;

output reg [data_width-1:0] data_out;
output full,empty;
input clk,rst_a,wr_en,rd_en;
input [data_width-1:0] data_in;

reg [address_width-1:0] wr_pointer;
reg [address_width-1:0] rd_pointer;
reg [address_width:0] status_count;

wire [data_width-1:0] data_ram;

//wr_pointer pointing to wire address

always@(posedge clk,posedge rst_a)
  begin
    if(rst_a)
	   wr_pointer =0;
	 else
	   begin
		  if(wr_en)
		    wr_pointer = wr_pointer+1;
		end
  end

//rd_pointer points to read address

always@(posedge clk or posedge rst_a)
 begin
   if(rst_a)
	  rd_pointer =0;
	 else
	   begin
		  if(rd_en)
		    rd_pointer = rd_pointer+1;
		end
 end
 //read from FIFO
 
 always@(posedge clk, posedge rst_a)
  begin
    if(rst_a)
	   data_out =0;
	 else
	   begin
		  if(rd_en)
		    data_out = data_ram;
		end
  end

//status pointer for full and empty checking

always@(posedge clk,posedge rst_a)
 begin
  if(rst_a)
    status_count =0;
  else if((wr_en && !rd_en) && (status_count !=ram_depth))
       status_count = status_count+1;
  else if((!wr_en && rd_en) && (status_count !=0))
       status_count = status_count-1;
 end
 
 assign full =(status_count==(ram_depth));
 assign empty = (status_count == 0);
 
 Dua_port_Ram UUT(.we(wr_en),.re(rd_en),.clk(clk),.re_addr(rd_pointer),.wr_addr(wr_pointer),.din(data_in),.dout(data_ram));
 
endmodule
