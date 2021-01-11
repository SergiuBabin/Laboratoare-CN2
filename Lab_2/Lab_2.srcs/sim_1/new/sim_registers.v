`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2020 10:52:37 PM
// Design Name: 
// Module Name: sim_registers
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


module sim_registers();
reg clk, reg_write;
reg [4:0] read_reg1, read_reg2, write_reg;
reg [31:0] write_data;
wire [31:0] read_data1, read_data2;

registers regs(clk, reg_write, read_reg1, read_reg2, write_reg, write_data, read_data1, read_data2);

always #25 clk = ~clk;
initial 
begin
   clk = 0; reg_write = 0; read_reg1 = 0; read_reg2 = 0;
   write_data = 0;  write_reg = 0; 
   #50
   read_reg1 = 1; 
   reg_write = 1;
   write_data = 9;  write_reg = 3;
   #50
   read_reg1 = 4; 
   reg_write = 0;
   write_data = 9;  write_reg = 3;
   #50
   read_reg1 = 2; read_reg2 = 1;
   #50
   read_reg1 = 3; 
   #50 
   read_reg2 = 5;

end
endmodule
