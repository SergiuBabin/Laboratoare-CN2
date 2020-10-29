`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2020 07:56:16 PM
// Design Name: 
// Module Name: sim_mux8
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


module sim_mux8();
reg I0, I1, I2, I3, I4, I5, I6, I7, s0, s1, s2;
wire out;
mux8_2 st(I0, I1, I2, I3, I4, I5, I6, I7, s0, s1, s2, out);
initial
begin
#0 I0=1; I1=0; I2=0; I3=0; I4=0; I5=0; I6=0; I7=0; s0=0; s1=0; s2=0;
#10 I0=0; I1=1; I2=0; I3=0; I4=0; I5=0; I6=0; I7=0; s0=0; s1=0; s2=1;
#10 I0=0; I1=0; I2=1; I3=0; I4=0; I5=0; I6=0; I7=0; s0=0; s1=1; s2=0;
#10 I0=1; I1=0; I2=0; I3=0; I4=0; I5=0; I6=0; I7=0; s0=0; s1=1; s2=1;
#10 I0=0; I1=0; I2=0; I3=0; I4=1; I5=0; I6=0; I7=0; s0=1; s1=0; s2=0;
#10 I0=0; I1=0; I2=0; I3=1; I4=0; I5=0; I6=0; I7=0; s0=1; s1=0; s2=1;
#10 I0=0; I1=0; I2=0; I3=0; I4=0; I5=0; I6=1; I7=0; s0=1; s1=1; s2=0;
#10 I0=0; I1=0; I2=0; I3=0; I4=0; I5=0; I6=0; I7=1; s0=1; s1=1; s2=1;

end
endmodule
