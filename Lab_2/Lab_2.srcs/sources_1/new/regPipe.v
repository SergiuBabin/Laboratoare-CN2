`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2020 02:03:48 PM
// Design Name: 
// Module Name: regPipe
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


module regPipe(clk, RESET, EN, in1, in2, out1, out2);
input[31:0] in1, in2;
input clk, RESET, EN;
output[31:0] out1, out2;
reg[31:0] out1, out2;

always @(posedge clk)
begin
if (RESET) 
begin
    out1 = 0;
    out2 = 0;
end
else
if (EN)
begin
    out1 = in1;
    out2 = in2;
end
end
endmodule
