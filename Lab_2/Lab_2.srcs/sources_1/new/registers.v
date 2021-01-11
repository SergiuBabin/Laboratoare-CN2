`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2020 08:52:31 PM
// Design Name: 
// Module Name: registers
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

module registers(input clk, reg_write,
                 input [4:0] read_reg1, read_reg2, write_reg,
                 input [31:0] write_data,
                 output reg [31:0] read_data1, read_data2);
                 
reg [31:0] reg_banc [0:31];

integer i;
initial begin
    for(i = 0; i < 32; i = i + 1) begin
        reg_banc [i] = i;
    end
end

always @(posedge clk)
begin
if (reg_write)
    reg_banc [write_reg] = write_data;
    
end

always @(read_reg1 , read_reg2)
begin
    read_data1 = reg_banc [read_reg1];
    read_data2 = reg_banc [read_reg2];
end
endmodule
