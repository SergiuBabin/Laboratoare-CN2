`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2020 06:44:58 PM
// Design Name: 
// Module Name: sim_mux4
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


module sim_mux4();
reg a, b, c, d, s0, s1;
wire out;
mux4_1 st(a, b, c, d, s0, s1, out);
initial
begin
#0 a = 0; b = 0; c = 0; d = 0; s0 = 0; s1 = 0;
#10 a = 0; b = 0; c = 0; d = 1; s0 = 0; s1 = 0;
#10 a = 0; b = 1; c = 0; d = 1; s0 = 0; s1 = 1;
#10 a = 0; b = 1; c = 1; d = 1; s0 = 1; s1 = 0;
#10 a = 1; b = 1; c = 1; d = 1; s0 = 1; s1 = 1;
#10 a = 1; b = 0; c = 1; d = 0; s0 = 1; s1 = 1;
end
endmodule
