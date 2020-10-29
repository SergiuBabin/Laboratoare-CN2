`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2020 11:46:43 AM
// Design Name: 
// Module Name: sim_mux2
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


module sim_mux2();
reg a, b, sel;
wire out;
mux2_1 st(a,b,sel,out);
initial
begin
#0 a = 0; b = 0; sel = 0;
#30 a = 0; b = 0; sel = 0;
#30 a = 0; b = 0; sel = 1;
#30 a = 0; b = 1; sel = 0;
#30 a = 0; b = 1; sel = 1;
#30 a = 1; b = 0; sel = 0;
#30 a = 1; b = 1; sel = 0;
#30 a = 1; b = 0; sel = 1;
#30 a = 1; b = 1; sel = 1;
end
endmodule
