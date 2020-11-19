`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2020 04:36:01 PM
// Design Name: 
// Module Name: PCADD
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


module PCADD(
    input [31:0] PC_in0,
    input [31:0] PC_in1,
    output [31:0] PC_out
    );

    assign PC_out = PC_in0 + PC_in1;

endmodule
