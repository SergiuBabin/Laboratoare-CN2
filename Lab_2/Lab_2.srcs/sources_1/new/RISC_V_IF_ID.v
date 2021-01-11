`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2020 02:20:50 PM
// Design Name: 
// Module Name: RISC_V_IF_ID
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


module RISC_V_IF_ID(input clk,
                    input reset,
                    input IF_ID_write,
                    input PCScr, PC_write,
                    input [31:0] PC_Branch,
                    input RegWrite_WB,
                    input [31:0] ALU_DATA_WB,
                    input [4:0] RD_WB,
                    output [31:0] PC_ID,
                    output [31:0] INSTRUCTION_ID,
                    output [31:0] IMM_ID,
                    output [31:0] REG_DATA1_ID,
                    output [31:0] REG_DATA2_ID,
                    output [2:0] FUNCT3_ID,
                    output [6:0] FUNCT7_ID,
                    output [6:0] OPCODE_ID,
                    output [4:0] RD_ID,
                    output [4:0] RS1_ID,
                    output [4:0] RS2_ID);

wire [31:0] PC_IF, INSTRUCTION_IF;
IF I(clk, reset, PCScr, PC_write, PC_Branch, PC_IF, INSTRUCTION_IF);
regPipe R(clk, reset, IF_ID_write, PC_IF, INSTRUCTION_IF, PC_ID, INSTRUCTION_ID);
ID D(clk, PC_ID, INSTRUCTION_ID, RegWrite_WB, ALU_DATA_WB, RD_WB, IMM_ID, REG_DATA1_ID, REG_DATA2_ID, FUNCT3_ID, FUNCT7_ID, OPCODE_ID, RD_ID, RS1_ID, RS2_ID);

endmodule
