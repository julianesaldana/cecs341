`timescale 1ns / 1ps

module PCADD(
    input [31:0] PC_in0,
    input [31:0] PC_in1,
    output [31:0] PC_out
    );

    assign PC_out = PC_in0 + PC_in1;

endmodule
