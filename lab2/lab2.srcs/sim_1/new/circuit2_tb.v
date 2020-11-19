`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2020 05:43:54 PM
// Design Name: 
// Module Name: circuit2_tb
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


module circuit2_tb();
    // inputs of uut
    reg A;
    reg B;
    
    integer i;
    // output of UUT
    wire F2;
    
    //instantiate UUT
    circuit2 uut(.A(A), .B(B), .F2(F2));
    
// can use same tb sometimes depending
//    circuit2 uut(.A(A), .B(B), .F2(F1));
    
    // initiate test bench
    initial begin
        $timeformat(-9, 1, " ns", 9);
        $display(" ");
        $display(" ");
        $display(" ");
        
        for (i=0; i<8; i=i+1) begin
            {A,B} = i;
            #5 $display("time=%t  A=%0b B=%0b || F2=%0b", $time, A, B, F2);
        end
        
        $finish;
    end    
endmodule
