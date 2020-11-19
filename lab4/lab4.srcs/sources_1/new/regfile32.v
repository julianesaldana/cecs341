`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2020 12:14:21 AM
// Design Name: 
// Module Name: regfile32
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


module regfile32(
    input clk, 
    input reset,
    input regWrite,
    input [4:0] S_Addr,
    input [4:0] T_Addr,
    input [4:0] D_Addr,
    input [31:0] D,
    output wire [31:0] S,
    output wire [31:0] T 
    );
     
    // instantiating 32 32-bit registers
    reg [31:0] regArray [0:31];
    
    // assign S and T, specific contents of regArray
    assign S = regArray[S_Addr[4:0]];
    assign T = regArray[T_Addr[4:0]];   
    
    // write to regArray
    // regArray[0] cannot be overwritten 
    always@(posedge clk, posedge reset) begin
        if(reset)
            regArray[0] <= 32'b0; else 
        if(regWrite && D_Addr)
            regArray[D_Addr[4:0]] <= D;
    end
endmodule

