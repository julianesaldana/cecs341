`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2020 05:37:32 PM
// Design Name: 
// Module Name: circuit1_tb
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


module circuit1_tb();
    // inputs of uut
    reg A;
    reg B;
    reg C;
    
    integer i;
    // output of UUT
    wire F1;
    
    //instantiate UUT
    circuit1 uut(.A(A), .B(B), .C(C), .F1(F1));
    
// can use same tb sometimes depending
//    circuit2 uut(.A(A), .B(B), .F2(F1));
    
    // initiate test bench
    initial begin
        $timeformat(-9, 1, " ns", 9);
        $display(" ");
        $display(" ");
        $display(" ");
        
        for (i=0; i<8; i=i+1) begin
            {A,B,C} = i;
            #5 $display("time=%t  A=%0b B=%0b C=%0b || F1=%0b", $time, A, B, C, F1);
        end
        
        $finish;
    end    
endmodule
