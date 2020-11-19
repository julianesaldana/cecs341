`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2020 03:58:06 PM
// Design Name: 
// Module Name: Datapath
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


module Datapath(
	input clk,
	input reset,
	output [31:0] D_out
	);
    wire [3:0] Cntl_out;
	wire [31:0] PC_out, PCAdder_output, Inst_out, Alu_out, r_s, r_t;
	wire regWrite, zero, overflow, carry, negative;
	
	assign D_out = Alu_out;
	
	PC pc(.clk(clk), .reset(reset), .PC_in(PCAdder_output), .PC_out(PC_out));
	
	PCADD add(.PC_in(PC_out), .PC_out(PCAdder_output));
	
	Instruction_Memory imem(.Addr(PC_out), .Inst_out(Inst_out));
	
	Control cntl(.Op(Inst_out[31:26]), .Func(Inst_out[5:0]), .ALUCntl(Cntl_out), .RegWrite(regWrite));
	
	regfile32 regfile(.clk(clk), .reset(reset), .regWrite(regWrite), .D_Addr(Inst_out[15:11]), .S_Addr(Inst_out[25:21]), .T_Addr(Inst_out[20:16]), .D(Alu_out), .S(r_s), .T(r_t));
	
	ALU alu (.a(r_s), .b(r_t), .ALUCntl(Cntl_out), .ALUout(Alu_out), .Carryout(carry), .Negative(negative), .Zero(zero), .OverFlow(overflow));
    
endmodule
