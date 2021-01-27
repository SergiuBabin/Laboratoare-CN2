`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/08/2021 11:52:03 PM
// Design Name: 
// Module Name: ID_EX_REGISTER
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


module ID_EX_REGISTER(input clk,reset,
                      input zero_in,RegWrite_in,MemtoReg_in,MemRead_in,MemWrite_in,Branch_in,ALUSrc_in,
                      input [1:0] ALUop_in,
                      input [2:0] FUNCT3_in,
                      input [4:0] RD_in,
                      input [4:0] RS1_in,
                      input [4:0] RS2_in,
                      input [6:0] FUNCT7_in,
                      input [6:0] OPCODE_in,
                      input [31:0] REG_DATA1_in, REG_DATA2_in,
                      input [31:0] PC_in,
                      input [31:0] IMM_ID_in,
                      output reg zero_out,RegWrite_out,MemtoReg_out,MemRead_out,MemWrite_out,Branch_out,ALUSrc_out,
                      output reg [1:0] ALUop_out,
                      output reg [2:0] FUNCT3_out,
                      output reg [4:0] RD_out,
                      output reg [4:0] RS1_out,
                      output reg [4:0] RS2_out,
                      output reg [6:0] FUNCT7_out,
                      output reg [6:0] OPCODE_out,
                      output reg [31:0] REG_DATA1_out, REG_DATA2_out,
                      output reg [31:0] PC_out,
                      output reg [31:0] IMM_ID_out);
                      
always@(posedge clk) begin
    if (reset) begin
        zero_out <= 1'b0;
        RegWrite_out <= 1'b0;
        MemtoReg_out <= 1'b0;
        MemRead_out <= 1'b0;
        MemWrite_out <= 1'b0;
        Branch_out <= 1'b0;
        ALUSrc_out <= 1'b0;
        ALUop_out <= 2'b0;
        FUNCT3_out <= 3'b0;
        RD_out <= 5'b0;
        RS1_out <= 5'b0;
        RS2_out <= 5'b0;
        FUNCT7_out <= 7'b0;
        OPCODE_out <= 7'b0;
        REG_DATA1_out <= 32'b0;
        REG_DATA2_out <= 32'b0;
        PC_out <= 32'b0;
        IMM_ID_out <= 32'b0;
    end
    else begin
        zero_out <= zero_in;
        RegWrite_out <= RegWrite_in;
        MemtoReg_out <= MemtoReg_in;
        MemRead_out <= MemRead_in;
        MemWrite_out <= MemWrite_in;
        Branch_out <= Branch_in;
        ALUSrc_out <= ALUSrc_in;
        ALUop_out <= ALUop_in;
        FUNCT3_out <= FUNCT3_in;
        RD_out <= RD_in;
        RS1_out <= RS1_in;
        RS2_out <= RS2_in;
        FUNCT7_out <= FUNCT7_in;
        OPCODE_out <= OPCODE_in;
        REG_DATA1_out <= REG_DATA1_in;
        REG_DATA2_out <= REG_DATA2_in;
        PC_out <= PC_in;
        IMM_ID_out <= IMM_ID_in;
    end
end

endmodule
