`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2021 04:45:39 PM
// Design Name: 
// Module Name: EX
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


module EX(input [31:0] IMM_EX,         
          input [31:0] REG_DATA1_EX,
          input [31:0] REG_DATA2_EX,
          input [31:0] PC_EX,
          input [2:0] FUNCT3_EX,
          input [6:0] FUNCT7_EX,
          input [4:0] RD_EX,
          input [4:0] RS1_EX,
          input [4:0] RS2_EX,
          input RegWrite_EX,
          input MemtoReg_EX,
          input MemRead_EX,
          input MemWrite_EX,
          input [1:0] ALUop_EX,
          input ALUSrc_EX,
          input Branch_EX,
          input [1:0] forwardA,forwardB,
          
          input [31:0] ALU_DATA_WB,
          input [31:0] ALU_OUT_MEM,
          
          output ZERO_EX,
          output [31:0] ALU_OUT_EX,
          output [31:0] PC_Branch_EX,
          output [31:0] REG_DATA2_EX_FINAL);

wire [3:0] ALUcontrol_EX;
wire [31:0] MUX4_A_EX, MUX4_B_EX, MUX2_EX;

ALUcontrol ALUcont(ALUop_EX, FUNCT7_EX, FUNCT3_EX, ALUcontrol_EX);

ALU ALUout(ALUcontrol_EX, MUX4_A_EX, MUX2_EX, ZERO_EX, ALU_OUT_EX);

mux4_1 MUX4_FORWARD_A(REG_DATA1_EX, ALU_DATA_WB, ALU_OUT_MEM, 32'b0, forwardA, MUX4_A_EX);

mux4_1 MUX4_FORWARD_B(REG_DATA2_EX, ALU_DATA_WB, ALU_OUT_MEM, 32'b0, forwardB, REG_DATA2_EX_FINAL); 
 
mux2_1 MUX2_ALUsrc(REG_DATA2_EX_FINAL, IMM_EX, ALUSrc_EX, MUX2_EX);

adder ADDER_EX(PC_EX, IMM_EX, PC_Branch_EX);



endmodule
