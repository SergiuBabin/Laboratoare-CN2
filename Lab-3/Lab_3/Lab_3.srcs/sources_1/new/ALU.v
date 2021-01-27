`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2021 04:19:33 PM
// Design Name: 
// Module Name: ALU
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


module ALU(input [3:0] ALUop,
           input [31:0] ina,inb,
           output zero,
           output reg [31:0] out);
           
            
always@(*) begin
    case(ALUop)
      4'b0000: out <= ina & inb; // and
      4'b0001: out <= ina | inb; // or
      4'b0010: out <= ina + inb; // add
      4'b0011: out <= ina ^ inb; // xor
      4'b0100: out <= ina << inb[4:0]; // sll (shift left)
      4'b0101: out <= ina >> inb[4:0]; // srl (shift right)
      4'b0110: out <= ina - inb; // sub
      4'b0111: out <= (ina < inb) ? 32'b1 : 32'b0; // sltu (Set on Less Than unsigned)
      4'b1000: out <= ($signed(ina) < $signed(inb)) ? 32'b1 : 32'b0; // slt (Set on Less Than signed)
      4'b1001: out <= ina >>> inb[4:0]; // sra (shift right)
    endcase
  end
  
assign zero = (out == 32'b0)? 1 : 0;
endmodule
