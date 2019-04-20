`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2019 12:27:09 AM
// Design Name: 
// Module Name: BCDcnt
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


module BCDcnt(
    input clk,
    input rst_n,
    output reg [3:0]out
    );
    reg [3:0]D_out;
    
    always@*
    if (out==4'd9) D_out = 4'd0;
    else D_out = out + 1;
    
    always@(posedge clk or negedge rst_n)
    if (~rst_n) out <= 4'd0;
    else out <= D_out; 
endmodule
