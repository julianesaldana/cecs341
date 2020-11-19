`timescale 1ns / 1ps


module adder_4bit_tb();
    
    // Inputs of UUT
    reg [3:0] A, B;
    reg K;
    
    //Outputs of UUT
    wire [3:0] Sum_out;
    wire Carry_out;
    
    //Testbench specific
    integer i;

    //Instantiate UUT
    adder_4bit uut(
                   .A(A),   // a to port a 
                   .B(B),   // all the rest same
                   .K(K),
                   .Sum_out(Sum_out),
                   .Carry_out(Carry_out)   
                   );
                   
     //Initiate test bench              
    initial begin // serves as like curly braces in java, { = begin } = end
        $timeformat(-9, 1, " ns", 9);
        
        $display(" "); $display(" ");
        $display("********************************************************************************************");
        $display("   C E C S    3 4 1    L A B    2pt2    T e s t b e n c h    R e s u l t s                  ");
        $display("********************************************************************************************");
        $display(" ");
        
        // Define test cases
//        K = 1'b0; // this is for adding
        K = 1'b1; // this is for subtraction
        for(i=1; i<17; i=i+1) begin
            A = i; B = i - 1;
            #5 $display("time=%t  A=%4b  B=%4b  ||  Sum_out=%4b", $time, A, B, Sum_out); // formatting for bit size, so %2b is 2 bit places, etc
        end
        $finish;
    end
        
endmodule
