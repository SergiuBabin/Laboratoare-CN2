`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2020 06:53:11 PM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(input [9:0] address,
                          output reg [31:0] instructiune);

reg [31:0] codeMemory [0:1023];

initial $readmemh("code.mem", codeMemory);

always @(address)
begin
instructiune = codeMemory [address];
end

endmodule
