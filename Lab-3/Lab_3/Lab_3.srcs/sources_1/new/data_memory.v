`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/07/2021 05:24:12 PM
// Design Name: 
// Module Name: data_memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module data_memory(input clk,       
                   input mem_read,
                   input mem_write,
                   input [31:0] address,
                   input [31:0] write_data,
                   output reg [31:0] read_data);

reg [31:0] DataMemory [0:1023];
wire [31:0] address_small = address>>2;
             
integer i;
initial begin
    for (i = 0; i < 1024; i = i + 1) begin
        DataMemory[i] = 32'b0;
    end
end
  
always@(posedge clk) begin
    if(mem_write)
        DataMemory[address_small[9:0]] <= write_data;
end

always@(*) begin
   if (mem_read==1'b1) begin 
    read_data = DataMemory[address_small[9:0]];
    end else 
    read_data = read_data;
    
end 

endmodule
