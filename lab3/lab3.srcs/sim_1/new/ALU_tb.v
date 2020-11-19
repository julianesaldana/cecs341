`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2020 11:18:37 AM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();
    reg [31:0] A, B;
    reg [3:0] ALUCntl;
    
    
    wire [31:0] ALUout;
    wire C,V,N,Z;
    
    reg  clk;
    
    ALU uut (.A(A), .B(B), ....);
    
    always
    #5 clk = ~clk;
    
    initial begin
        $timeformat();
        clk = 0; #50;
        
        @(negedge clk)
        A = 32'hF0F0_3C3C; B=32'hBF0F_F5F5; ALUCntl = 4'b0000;
        #1 $display("time = %t A=%h..." $time, A, ....)
        
        @(negedge clk)
        A = 32'hF0F0_3C3C; B=32'hBF0F_F5F5; ALUCntl = 4'b0000;
        #1 $display("time = %t A=%h..." $time, A, ....)
        
    end
endmodule
