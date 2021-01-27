`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2021 11:47:46 AM
// Design Name: 
// Module Name: RISC_V
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


module RISC_V(input clk,
              input reset,
              
              output [31:0] PC_EX,
              output [31:0] ALU_OUT_EX,
              output [31:0] PC_MEM,
              output PCSrc,
              output [31:0] DATA_MEMORY_MEM,
              output [31:0] ALU_DATA_WB,
              output [1:0] forwardA, forwardB,
              output pipeline_stall
             );
            
wire IF_ID_write;
wire PC_write;
wire PCSrc_V;
wire [31:0] PC_Branch_ID;  
wire [4:0] RD_WB;

wire [31:0] PC_ID,INSTRUCTION_ID,IMM_ID,REG_DATA1_ID,REG_DATA2_ID;
wire [2:0] FUNCT3_ID;
wire [6:0] FUNCT7_ID,OPCODE_ID;
wire [4:0] RD_ID,RS1_ID,RS2_ID;

wire zero_ID,RegWrite_ID,MemtoReg_ID,MemRead_ID,MemWrite_ID,Branch_ID,ALUSrc_ID;
wire [1:0] ALUop_ID;

wire [31:0] INSTRUCTION_EX,IMM_EX,REG_DATA1_EX,REG_DATA2_EX;
wire [2:0] FUNCT3_EX;
wire [6:0] FUNCT7_EX,OPCODE_EX;
wire [4:0] RD_EX,RS1_EX,RS2_EX;

wire zero_EX,RegWrite_EX,MemtoReg_EX,MemRead_EX,MemWrite_EX,Branch_EX,ALUSrc_EX;
wire [1:0] ALUop_EX;

wire [31:0] ALU_OUT_EX_l;
wire [31:0] PC_Branch_EX;
wire [31:0] REG_DATA2_EX_FINAL;


wire zero_MEM,RegWrite_MEM,MemtoReg_MEM,MemRead_MEM,MemWrite_MEM,Branch_MEM,ALUSrc_MEM;
wire [1:0] ALUop_MEM;
wire [4:0] RD_MEM;
wire [31:0] PC_Branch_MEM;
wire [31:0] ALU_OUT_MEM;
wire [31:0] REG_DATA2_MEM_FINAL;


wire zero_WB,RegWrite_WB,MemtoReg_WB,MemRead_WB,MemWrite_WB,Branch_WB,ALUSrc_WB;
wire [1:0] ALUop_WB;
wire [31:0] READ_DATA_WB;
wire [31:0] ALU_OUT_MEM_WB;

//////////////////////////////////////////////RISC-V_IF_ID_MODULE///////////////////////////////////////////////////
RISC_V_IF_ID IF_ID(clk,
                   reset,
                   IF_ID_write,
                   PCSrc_V,PC_write,
                   PC_Branch_ID,
                   RegWrite_WB,
                   ALU_DATA_WB,
                   RD_WB,
                
                   PC_ID,
                   INSTRUCTION_ID,
                   IMM_ID,
                   REG_DATA1_ID,
                   REG_DATA2_ID,
                   FUNCT3_ID,
                   FUNCT7_ID,
                   OPCODE_ID,
                   RD_ID,
                   RS1_ID,
                   RS2_ID
                   );

 ////////////////////////////////////////hazard_detection Module////////////////////////////////// 
 hazard_detection H_D(RD_EX,
                      RS1_ID,
                      RS2_ID,
                      MemRead_ID,
                      PC_write,
                      IF_ID_write,
                      pipeline_stall);
 
 
 ////////////////////////////////////////control_path Module////////////////////////////////// 
 control_path control(OPCODE_ID,
                      pipeline_stall,
                      RegWrite_ID,MemtoReg_ID,MemRead_ID,MemWrite_ID,Branch_ID,ALUSrc_ID,
                      ALUop_ID);
 
//////////////////////////////////////pipeline registers////////////////////////////////////////////////////////////
ID_EX_REGISTER ID_EX_pipeline(clk,reset,
                              zero_ID,RegWrite_ID,MemtoReg_ID,MemRead_ID,MemWrite_ID,Branch_ID,ALUSrc_ID,
                              ALUop_ID,
                              FUNCT3_ID,
                              RD_ID,
                              RS1_ID,
                              RS2_ID,
                              FUNCT7_ID,
                              OPCODE_ID,
                              REG_DATA1_ID,REG_DATA2_ID,
                              PC_ID,
                              IMM_ID,
                              
                              zero_EX,RegWrite_EX,MemtoReg_EX,MemRead_EX,MemWrite_EX,Branch_EX,ALUSrc_EX,
                              ALUop_EX,
                              FUNCT3_EX,
                              RD_EX,
                              RS1_EX,
                              RS2_EX,
                              FUNCT7_EX,
                              OPCODE_EX,
                              REG_DATA1_EX,REG_DATA2_EX,
                              PC_EX,
                              IMM_EX);

/////////////////////////////////////EX Module//////////////////////////////////////////////////////////////////////
EX ex(IMM_EX,
      REG_DATA1_EX,
      REG_DATA2_EX,
      PC_EX,
      FUNCT3_EX,
      FUNCT7_EX,
      RD_EX,
      RS1_EX,
      RS2_EX,
      RegWrite_EX,
      MemtoReg_EX,
      MemRead_EX,
      MemWrite_EX,
      ALUop_EX,
      ALUSrc_EX,
      Branch_EX,
      forwardA,forwardB,
      
      ALU_DATA_WB,
      ALU_OUT_MEM,
      
      zero_EX,
      ALU_OUT_EX,
      PC_Branch_EX,
      REG_DATA2_EX_FINAL);

/////////////////////////////////////forwarding Module//////////////////////////////////////////////////////////////////////
forwarding fw(RS1_EX,
              RS2_EX,
              RD_MEM,
              RD_WB,
              RegWrite_MEM,
              RegWrite_WB,
              forwardA,forwardB);

//////////////////////////////////////pipeline registers////////////////////////////////////////////////////////////
EX_MEM_REGISTER EX_MEM_pipeline(clk,reset,
                                zero_EX,RegWrite_EX,MemtoReg_EX,MemRead_EX,MemWrite_EX,Branch_EX,ALUSrc_EX,
                                ALUop_EX,
                                RD_EX,
                                PC_Branch_EX,
                                ALU_OUT_EX,
                                REG_DATA2_EX_FINAL,
                                
                                zero_MEM,RegWrite_MEM,MemtoReg_MEM,MemRead_MEM,MemWrite_MEM,Branch_MEM,ALUSrc_MEM,
                                ALUop_MEM,
                                RD_MEM,
                                PC_MEM,
                                ALU_OUT_MEM,
                                REG_DATA2_MEM_FINAL
                                );
                                                               
assign PCSrc_V = zero_MEM & Branch_MEM;
assign PCSrc = PCSrc_V;                      
/////////////////////////////////////data_memory Module//////////////////////////////////////////////////////////////////////                                
data_memory dm(clk,
               MemRead_MEM,
               MemWrite_MEM,
               ALU_OUT_MEM,
               REG_DATA2_MEM_FINAL,
               DATA_MEMORY_MEM
               );
               

//////////////////////////////////////pipeline registers////////////////////////////////////////////////////////////
MEM_WB_REGISTER MEM_WB_pipeline(clk,reset,
                                zero_MEM,RegWrite_MEM,MemtoReg_MEM,MemRead_MEM,MemWrite_MEM,Branch_MEM,ALUSrc_MEM,
                                ALUop_MEM,
                                RD_MEM,
                                DATA_MEMORY_MEM,
                                ALU_OUT_MEM,
                                
                                zero_WB,RegWrite_WB,MemtoReg_WB,MemRead_WB,MemWrite_WB,Branch_WB,ALUSrc_WB,
                                ALUop_WB,
                                RD_WB,
                                READ_DATA_WB,
                                ALU_OUT_MEM_WB
                                );
                                
mux2_1 MUX_WB(ALU_OUT_MEM_WB,READ_DATA_WB,MemtoReg_WB,ALU_DATA_WB);

endmodule