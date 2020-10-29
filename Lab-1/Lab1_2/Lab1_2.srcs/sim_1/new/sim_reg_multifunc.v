`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2020 03:58:44 PM
// Design Name: 
// Module Name: sim_reg_multifunc
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


module sim_reg_multifunc();
reg [3:0]in;
reg clk, EN, RESET, INC, DEC, SHL, SHR;
wire [3:0]out;
reg_multifunc my_reg(in, clk, EN, RESET, INC, DEC, SHL, SHR, out);

always #25 clk = ~clk;
initial 
begin
   clk = 0; in = 0; EN = 0; RESET = 0; 
   INC = 0; DEC = 0; SHL = 0; SHR = 0;
   #50
   EN = 1;
   in = 2;
   #45
   EN = 0;
   RESET = 1;
   #5
   RESET = 0;
   #50
   in = 2;
   EN = 1;
   #50
   EN = 0; INC = 1;
   #50
   INC = 0; DEC = 1;
   #50
   DEC = 0; SHL = 1;
   #50
   SHL = 0; SHR = 1;
   #50
   SHR = 0;  
   
end
endmodule
