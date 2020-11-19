`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2020 10:35:54 AM
// Design Name: 
// Module Name: Control
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


module Control(
    input [5:0] Op,
    input [5:0] Func,
    output reg [3:0] ALUCntl,
    output reg RegWrite
    );
    
    always@(*) begin
        if (Op == 6'b0) begin
            RegWrite = 1'b1;
            case(Func)
                6'h20: ALUCntl = 4'b1010;    // add
                6'h21: ALUCntl = 4'b0010;    // add unsigned        
                6'h22: ALUCntl = 4'b1110;    // subtract       
                6'h23: ALUCntl = 4'b0110;    // subtract unsigned          
                6'h24: ALUCntl = 4'b0000;    // and            
                6'h25: ALUCntl = 4'b0001;   // or         
                6'h26: ALUCntl = 4'b0011;   // xor             
                6'h27: ALUCntl = 4'b1100;    // nor
                6'h2A: ALUCntl = 4'b0100;   // set less than
                6'h2B: ALUCntl = 4'b1111;   // set less than unsigned
                            
                default: ALUCntl = 4'b0000;
            endcase
        end
        else begin
            RegWrite = 1'b0;
            ALUCntl  = 4'b0000;
        end
    end
endmodule
