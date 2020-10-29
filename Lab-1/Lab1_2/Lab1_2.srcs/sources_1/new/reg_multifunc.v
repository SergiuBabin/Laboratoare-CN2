`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2020 12:49:31 PM
// Design Name: 
// Module Name: reg_multifunc
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


module reg_multifunc(input [3:0]in, clk, EN, RESET, INC, DEC, SHL, SHR,
                      output [3:0]out);
reg [3:0]out;

always @(posedge clk or RESET)
begin
if(RESET) out = 0;
else
if(EN) out = in;
else
if(INC) out = out + 1;
else
if(DEC) out = out - 1;
else
if(SHL) out = out << 1;
else
if(SHR) out = out >> 1;
end

endmodule
