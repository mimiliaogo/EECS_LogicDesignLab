`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2019 12:03:58 AM
// Design Name: 
// Module Name: bincnt
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


module bincnt(
    out,
    clk,
    rst_n
    );
    output out;
    input clk;
    input rst_n;
    
    reg [3:0]out;
    reg [3:0]D_out;
    //combinationa
    always@*
    D_out = out + 1;
    //sequential
    always@(posedge clk or negedge rst_n)
    if (~rst_n) out <= 4'b0000;
    else out <= D_out;
endmodule
