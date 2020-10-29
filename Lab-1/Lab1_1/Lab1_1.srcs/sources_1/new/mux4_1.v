`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2020 06:35:29 PM
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


module mux4_1(a, b, c, d, s0, s1, out);
input a, b, c, d, s0, s1;
output out;

wire out1, out2;
mux2_1 n1(a, b, s1, out1);
mux2_1 n2(c, d, s1, out2);
mux2_1 n3(out1, out2, s0, out);

endmodule
