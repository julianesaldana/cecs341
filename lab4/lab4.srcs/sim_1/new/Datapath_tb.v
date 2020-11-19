`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2020 11:24:07 PM
// Design Name: 
// Module Name: Datapath_tb
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


module Datapath_tb();
    // inputs to uut
    reg clk;
    reg reset;
    
    // testbench specific
    integer i;
    
    // outputs to uut
    wire [31:0] D_out;
    
    Datapath uut(.clk(clk), .reset(reset), .D_out(D_out));
    
    always
        #10 clk = ~clk;
        
    task Dump_RegFile; begin
        $timeformat(-9, 1, " ns", 9);
        for (i = 0; i < 32; i = i + 1) begin
            @(posedge clk)
            $display("t=%t rf[%0h]:     %h", $time, i, uut.regfile.regArray[i]);
            end
        end
    endtask
    
    initial begin
        clk = 0; reset = 1; #20;
        $readmemh("imem.dat", uut.imem.imem);
        $readmemh("regfile.dat", uut.regfile.regArray);
        reset = 0; #200;
        Dump_RegFile;
        $finish;
    end
endmodule
