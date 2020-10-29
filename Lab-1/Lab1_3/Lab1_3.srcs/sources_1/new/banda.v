`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2020 06:25:53 PM
// Design Name: 
// Module Name: banda
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

module registru(clk, in1, out1);
input[7:0] in1;
input clk;
output[7:0] out1;
reg[7:0] out1;

always @(posedge clk)
    out1 = in1;
endmodule

module registru2(clk, in1, in2, out1, out2);
input[7:0] in1, in2;
input clk;
output[7:0] out1, out2;
reg[7:0] out1, out2;

always @(posedge clk)
begin
    out1 = in1;
    out2 = in2;
end
endmodule

module registru3(clk, in1, in2, in3, out1, out2, out3);
input[7:0] in1, in2, in3;
input clk;
output[7:0] out1, out2, out3;
reg[7:0] out1, out2, out3;

always @(posedge clk)
begin
    out1 = in1;
    out2 = in2;
    out3 = in3;
end
endmodule

module banda(clk, a, b, c, d, e, f, out);
input clk;
input[7:0] a, b, c, d, e ,f;
output[7:0] out;
wire[7:0] w1, w2, w3, w4, w5, w6, w7, w8, w9, w10;

assign w1 = a/b;
assign w2 = c/d;
assign w3 = e/f;
registru3 r1(clk, w1, w2, w3, w4, w5, w6);

assign w7 = w4 * w5;
registru2 r2(clk, w6, w7, w8, w9);
assign w10 = w9 - w8;

registru r(clk, w10, out);

endmodule
