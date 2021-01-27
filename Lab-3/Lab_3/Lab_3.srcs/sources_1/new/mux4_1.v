`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/07/2021 02:40:09 PM
// Design Name: 
// Module Name: mux4_1
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


module mux4_1(ina,inb,inc,ind,sel,out);
  
  input [31:0] ina,inb,inc,ind;
  input [1:0] sel;
  output reg [31:0] out;
  
  always@(ina,inb,inc,ind,sel) begin
    case(sel)
      2'b00: out = ina;
      2'b01: out = inb;
      2'b10: out = inc;
      2'b11: out = ind;
    endcase
  end

endmodule
