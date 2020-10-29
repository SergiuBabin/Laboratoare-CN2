`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2020 05:25:39 PM
// Design Name: 
// Module Name: sim_banda
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


module sim_banda();
reg clk;
reg[7:0] a, b, c, d, e ,f;
wire[7:0] out;

banda uut(clk, a, b, c, d, e, f, out);

always #20 clk = ~clk;

initial
begin
    clk = 0;
    a = 24;
    b = 2;
    c = 2; 
    d = 1;
    e = 1;
    f = 1;
    #40;
    a = 20;
    b = 5;
    c = 12; 
    d = 2;
    e = 20;
    f = 1;
    #40;
    a = 20;
    b = 4;
    c = 2; 
    d = 1;
    e = 1;
    f = 1;  
end

endmodule
