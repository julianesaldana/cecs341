`timescale 1ns/1ps

module ALU_tb();
    // inputs
    reg [31:0] a, b;
    reg [3:0] ALUCntl;
    
    // outputs 
    wire [31:0] ALUout;
    wire Carryout, OverFlow, Zero, Negative;
    reg clk;
    
    // instantiate UUT
    ALU uut(
        .a(a),
        .b(b),
        .ALUCntl(ALUCntl),
        .ALUout(ALUout),
        .Carryout(Carryout),
        .OverFlow(OverFlow),
        .Zero(Zero),
        .Negative(Negative)
        );
        
    always
        #5 clk=~clk;
        
    // initiating testbench    
    initial begin
        $timeformat(-9,1,"ns",0);
        clk = 1'b0; #50;
        
        // test case 1
        @(negedge clk)
        a = 32'hF0F03C3C; b = 32'hBF0FF5F5; ALUCntl = 4'b0000;
        #5 $display("1 time-%t a=%8h b=%8h Carryout=%h OverFlow=%h ALUCntl=%4b || ALUout=%8h",$time,a,b,Carryout,OverFlow,ALUCntl,ALUout); 
        
        // 2
        @(negedge clk)
        a = 32'hF0F03C3C; b = 32'hBF0FF5F5;  ALUCntl = 4'b0001;
        #5 $display("2 time-%t a=%8h b=%8h Carryout=%h OverFlow=%h ALUCntl=%4b || ALUout=%8h",$time,a,b,Carryout,OverFlow,ALUCntl,ALUout);
        
        // 3
        @(negedge clk)
        a = 32'hF0F03C3C; b = 32'hBF0FF5F5; ALUCntl = 4'b0011;
        #5 $display("3 time-%t a=%8h b=%8h Carryout=%h OverFlow=%h ALUCntl=%4b || ALUout=%8h",$time,a,b,Carryout,OverFlow,ALUCntl,ALUout);
        
        // 4
        @(negedge clk)
        a = 32'h00000001; b = 32'hFFFFFFFF; ALUCntl = 4'b0010;
        #5 $display("4 time-%t a=%8h b=%8h Carryout=%h OverFlow=%h ALUCntl=%4b || ALUout=%8h",$time,a,b,Carryout,OverFlow,ALUCntl,ALUout);
        
        // 5
        @(negedge clk)
        a = 32'h6389754F; b = 32'hAD5624E6; ALUCntl = 4'b0010;
        #5 $display("5 time-%t a=%8h b=%8h Carryout=%h OverFlow=%h ALUCntl=%4b || ALUout=%8h",$time,a,b,Carryout,OverFlow,ALUCntl,ALUout);
        
        // 6
        @(negedge clk)
        a = 32'h00000001; b = 32'hFFFFFFFF;  ALUCntl = 4'b0010;
        #5 $display("6 time-%t a=%8h b=%8h Carryout=%h OverFlow=%h ALUCntl=%4b || ALUout=%8h",$time,a,b,Carryout,OverFlow,ALUCntl,ALUout);
        
        // 7
        @(negedge clk)
        a = 32'h6389754F; b = 32'hAD5624E6;  ALUCntl = 4'b0010;
        #5 $display("7 time-%t a=%8h b=%8h Carryout=%h OverFlow=%h ALUCntl=%4b || ALUout=%8h",$time,a,b,Carryout,OverFlow,ALUCntl,ALUout);
        
        // 8
        @(negedge clk)
        a = 32'hFFFFFFFF; b = 32'hFFFFFFFF;  ALUCntl = 4'b0010;
        #5 $display("8 time-%t a=%8h b=%8h Carryout=%h OverFlow=%h ALUCntl=%4b || ALUout=%8h",$time,a,b,Carryout,OverFlow,ALUCntl,ALUout);
        
        // 9
        @(negedge clk)
        a = 32'h00000000; b = 32'h00000001;  ALUCntl = 4'b0110;
        #5 $display("9 time-%t a=%8h b=%8h Carryout=%h OverFlow=%h ALUCntl=%4b || ALUout=%8h",$time,a,b,Carryout,OverFlow,ALUCntl,ALUout);
        
        // 10
        @(negedge clk)
        a = 32'hF9684783; b = 32'hF998D562;  ALUCntl = 4'b0110;
        #5 $display("10 time-%t a=%8h b=%8h Carryout=%h OverFlow=%h ALUCntl=%4b || ALUout=%8h",$time,a,b,Carryout,OverFlow,ALUCntl,ALUout);
        
        // 11
        @(negedge clk)
        a = 32'hF0F03C3C; b = 32'hBF0FF5F5;  ALUCntl = 4'b1100;
        #5 $display("11 time-%t a=%8h b=%8h Carryout=%h OverFlow=%h ALUCntl=%4b || ALUout=%8h",$time,a,b,Carryout,OverFlow,ALUCntl,ALUout);
        
        // 12
        @(negedge clk)
        a = 32'h89BCDE34; b = 32'hC53BD687;  ALUCntl = 4'b0111;
        #5 $display("12 time-%t a=%8h b=%8h Carryout=%h OverFlow=%h ALUCntl=%4b || ALUout=%8h",$time,a,b,Carryout,OverFlow,ALUCntl,ALUout);
        
        // 13
        @(negedge clk)
        a = 32'hF0F03C3C; b = 32'hBF0FF5F5;  ALUCntl = 4'b1101;
        #5 $display("13 time-%t a=%8h b=%8h Carryout=%h OverFlow=%h ALUCntl=%4b || ALUout=%8h",$time,a,b,Carryout,OverFlow,ALUCntl,ALUout);
        
        // 14
        @(negedge clk)
        a = 32'hF0F03C3C; b = 32'hBF0FF5F5;  ALUCntl = 4'b1111;
        #5 $display("14 time-%t a=%8h b=%8h Carryout=%h OverFlow=%h ALUCntl=%4b || ALUout=%8h",$time,a,b,Carryout,OverFlow,ALUCntl,ALUout);
        
        // 15
        @(negedge clk)
        a = 32'hF0F03C3C; b = 32'hBF0FF5F5;  ALUCntl = 4'b1010;
        #5 $display("15 time-%t a=%8h b=%8h Carryout=%h OverFlow=%h ALUCntl=%4b || ALUout=%8h",$time,a,b,Carryout,OverFlow,ALUCntl,ALUout);
        
        // 16
        @(negedge clk)
        a = 32'hF0F03C3C; b = 32'hBF0FF5F5;  ALUCntl = 4'b1110;
        #5 $display("16 time-%t a=%8h b=%8h Carryout=%h OverFlow=%h ALUCntl=%4b || ALUout=%8h",$time,a,b,Carryout,OverFlow,ALUCntl,ALUout);
    end
    
endmodule