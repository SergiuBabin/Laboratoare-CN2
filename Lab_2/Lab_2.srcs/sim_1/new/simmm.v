`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2020 04:46:59 PM
// Design Name: 
// Module Name: simmm
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


module simmm();
 /*
reg [9:0] address;
wire [31:0] instruction;
instruction_memory ins(
 address,
 instruction
 );
 
 initial begin 
 
 address = 10'b00_0000_0001;
#50 
 address = 10'b00_0000_0011;
 end
 */
/*
reg [31:0] ina,inb;
wire [31:0] out;
adder add(ina,inb,out);
 initial begin 
 
 ina = 1209;
 inb = 4565;
#50; 
 end
 */
/*
reg clk,reset;
reg PCSrc, PC_write;
reg [31:0] PC_Branch;
wire [31:0] PC_IF, INSTRUCTION_IF;
IF iff(
clk,reset,
PCSrc, PC_write,
PC_Branch,
PC_IF, INSTRUCTION_IF
 );
always #10 clk = ~clk;
 initial begin
 #0 clk=1'b0;
 reset=1'b1;
 
 PCSrc = 1'b0;
 PC_write = 1'b1; 
 PC_Branch = 32'b0; 
 
 
 
 
 end
*/
/*
reg [31:0] ina,inb;
reg sel;
wire [31:0] out; 
 
 
mux2_1 mmu(
ina,inb,
sel,
out );
initial begin 
#0
sel = 1'b0;
ina = 32'b00000000000000000000000000000001;
inb = 32'b00000000000000000000000000000011;
#100;
end
*/
/* 
// imm_gen simulation 

 reg [31:0] in; 
 wire [31:0] out;
 
 imm_gen gen(in,out);
 initial begin 
 in = 32'b0000_0000_0001_0000_1110_0010_0001_0011;
 end
*/
endmodule
