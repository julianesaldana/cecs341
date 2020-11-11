`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2020 05:25:23 PM
// Design Name: 
// Module Name: adder_2bit_tb
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


module adder_2bit_tb();
    
    // Inputs of UUT
    reg [1:0] A, B;
    
    //Outputs of UUT
    wire [2:0] Sum_out;
    
    //Testbench specific
    integer i;

    //Instantiate UUT
    adder_2bit uut(
                   .A(A),   // a to port a 
                   .B(B),
                   .Sum_out(Sum_out)
                   );
                   
     //Initiate test bench              
    initial begin // serves as like curly braces in java, { = begin } = end
        $timeformat(-9, 1, " ns", 9);
        
        $display(" "); $display(" ");
        $display("********************************************************************************************");
        $display("   C E C S    3 4 1    L A B    1    T e s t b e n c h    R e s u l t s                     ");
        $display("********************************************************************************************");
        $display(" ");
        
        // Define test cases
        for(i=0; i<4; i=i+1) begin
            A = i; B = i*2; 
            #5 $display("time=%t  A=%2b  B=%2b  ||  Sum_out=%3b", $time, A, B, Sum_out); // formatting for bit size, so %2b is 2 bit places, etc
        end
        $finish;
    end
        
endmodule
