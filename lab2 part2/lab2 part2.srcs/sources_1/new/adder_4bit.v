`timescale 1ns / 1ps

module adder_4bit(
    input [3:0] A,  // initiating the variables with specific bits
    input [3:0] B,  // now it is 3:0 because it is 4 bits, so 3 2 1 0, 4 bits
    input K,
    output [3:0] Sum_out,   // 4 bit sum out now
    output Carry_out
    );
    
    wire Carry_0, Carry_1, Carry_2, Sum_0, Sum_1, Sum_2, Sum_3;
    wire EXOR0, EXOR1, EXOR2, EXOR3;
    
    assign EXOR0 = B[0] ^ K;
    assign EXOR1 = B[1] ^ K;
    assign EXOR2 = B[2] ^ K;
    assign EXOR3 = B[3] ^ K;
     
    assign Sum_out = {Carry_2, Carry_1, Carry_0, Sum_3, Sum_2, Sum_1, Sum_0};
    
    FA
        FA_0(.A(A[0]), .B(EXOR0), .c_in(K), .c_out(Carry_0), .sum(Sum_0)),
        FA_1(.A(A[1]), .B(EXOR1), .c_in(Carry_0), .c_out(Carry_1), .sum(Sum_1)),
        FA_2(.A(A[2]), .B(EXOR2), .c_in(Carry_1), .c_out(Carry_2), .sum(Sum_2)),
        FA_3(.A(A[3]), .B(EXOR3), .c_in(Carry_2), .c_out(Carry_out), .sum(Sum_3));
endmodule
