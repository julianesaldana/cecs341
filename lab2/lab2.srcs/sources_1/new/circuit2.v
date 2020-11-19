`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2020 05:38:21 PM
// Design Name: 
// Module Name: circuit2
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


module circuit2(
    input A,
    input B,
    output reg F2   // identified as register
    );
    
    always @(A or B) begin
        F2 = (~A | B) & (A | ~B);
//        case ({A,B,C})
//            3'b000: F1 = 1'b0;
//            3'b000: F1 = 1'b1;
//        endcase
    end
    
endmodule
