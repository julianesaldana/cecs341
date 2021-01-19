`timescale 1ns / 1ps

module Datapath_tb();

    reg clk;
    reg reset;
    integer i;
    
    wire [31:0] D_out;
     
    Datapath uut(.clk(clk), .reset(reset), .D_out(D_out));
    
    always
        #10 clk = ~clk;
        

    task Dump_DataMem; begin
        $timeformat(-9, 1, " ns", 9);
        $display("Initial Values:");
        for(i = 0; i < 17; i = i + 4) begin
            @(posedge clk)
            $display("t=%t  datamem[%0d]:    %h%h%h%h", $time, i, uut.DataMem.dmem[i], uut.DataMem.dmem[i+1], uut.DataMem.dmem[i+2], uut.DataMem.dmem[i+3]);
            end
        $display("Final Values:");
        for(i = 20; i < 37; i = i + 4) begin
            @(posedge clk)
            $display("t=%t  datamem[%0d]:    %h%h%h%h", $time, i, uut.DataMem.dmem[i], uut.DataMem.dmem[i+1], uut.DataMem.dmem[i+2], uut.DataMem.dmem[i+3]);
        end
    end
    endtask
    
    initial begin
        clk = 0; reset = 1; #45;
        $readmemh("imem.dat", uut.Instruction_Memory.imem);
        $readmemh("DataMem.dat", uut.DataMem.dmem);
        reset = 0; #900;
        Dump_DataMem;
        $finish;
    end
    
endmodule