`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2020 07:50:46 PM
// Design Name: 
// Module Name: mux8_2
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


module mux8_2(I0, I1, I2, I3, I4, I5, I6, I7, s0, s1, s2, out);
input I0, I1, I2, I3, I4, I5, I6, I7, s0, s1, s2;
output out;
wire out1, out2;
mux4_1 st1(I0,I1,I2,I3, s1, s2, out1);
mux4_1 st2(I4,I5,I6,I7, s1, s2, out2);
mux2_1 st3(out1, out2, s0, out);
endmodule
