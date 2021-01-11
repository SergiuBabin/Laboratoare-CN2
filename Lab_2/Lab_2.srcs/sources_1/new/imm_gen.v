`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2020 11:59:30 PM
// Design Name: 
// Module Name: imm_gen
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


module imm_gen(input [31:0] in,
               output reg [31:0] out);
              
always @(in)
begin
    case (in [6:0])
    7'b0000011 : out = {{20{in[31]}}, in[30:20]};  //LW = I TYPE
    7'b0100011 : out = {{20{in[31]}}, in[30:25], in[11:7]};   //SW = S TYPE
    7'b0010011 : out = {{20{in[31]}}, in[30:20]}; //ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI = I TYPE
    7'b1100011 : out = {{19{in[31]}}, in[7],in[30:25],in[11:8],1'b0}; //BEQ, BNE, BLT, BGE, BLTU, BGEU = B TYPE
    default: out = 32'b0;
    endcase
end    
endmodule
