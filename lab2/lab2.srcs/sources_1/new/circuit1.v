`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2020 05:37:05 PM
// Design Name: 
// Module Name: circuit1
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


module circuit1(
    input A,
    input B,
    input C,
    output reg F1   // identified as register
    );
    
    always @(A or B or C) begin
        F1 = (A&B) | (~A&C) | (A&~B&~C);
    end
    
endmodule
