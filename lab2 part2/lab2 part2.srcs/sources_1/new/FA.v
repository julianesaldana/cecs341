`timescale 1ns / 1ps

module FA(
    input A,
    input B,
    input c_in,
    output c_out,
    output sum
    );
    
    assign {c_out,sum} = A + B + c_in;
endmodule
