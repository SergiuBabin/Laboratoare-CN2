`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2020 10:39:16 PM
// Design Name: 
// Module Name: IF
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


module IF(input clk, reset,
          input PCScr, PC_write,
          input [31:0] PC_Branch,
          output [31:0] PC_IF, INSTRUCTION_IF);
          
wire [31:0] add, mux, If, fo;
assign fo = 4;
adder ad(fo, PC_IF, add);          
mux2_1 mu(add, PC_Branch, PCScr, mux);
PC P(clk, reset, PC_write, mux, PC_IF);
instruction_memory I(PC_IF >> 2, INSTRUCTION_IF);
endmodule
