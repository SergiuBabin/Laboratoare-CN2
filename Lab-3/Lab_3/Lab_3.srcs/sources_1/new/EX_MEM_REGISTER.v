`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/08/2021 06:49:07 PM
// Design Name: 
// Module Name: EX_MEM_REGISTER
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


module EX_MEM_REGISTER(input clk,reset,
                       input zero_in,RegWrite_in,MemtoReg_in,MemRead_in,MemWrite_in,Branch_in,ALUSrc_in,
                       input [1:0] ALUop_in, 
                       input [4:0] rd_in,
                       input [31:0] PC_Branch_in,
                       input [31:0] ALUout_in,
                       input [31:0] REG_DATA2_MUX_in,
                       output reg zero_out,RegWrite_out,MemtoReg_out,MemRead_out,MemWrite_out,Branch_out,ALUSrc_out,
                       output reg [1:0] ALUop_out, 
                       output reg [4:0] rd_out,
                       output reg [31:0] PC_Branch_out,
                       output reg [31:0] ALUout_out,
                       output reg [31:0] REG_DATA2_MUX_out);

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
        rd_out <= 4'b0;
        PC_Branch_out <= 32'b0;
        ALUout_out <= 32'b0;
        REG_DATA2_MUX_out <= 32'b0;
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
        rd_out <= rd_in;
        PC_Branch_out <= PC_Branch_in;
        ALUout_out <= ALUout_in;
        REG_DATA2_MUX_out <= REG_DATA2_MUX_in;
    end
end
endmodule
