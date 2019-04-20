`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2019 11:02:45 PM
// Design Name: 
// Module Name: freqdiv27
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
`define FREQ_DIV_BIT 27

module freqdiv27(
    clk_out, //divided clk output
    clk,
    rst_n
    );
    output clk_out;
    input clk;
    input rst_n;
    
    reg clk_out;
    reg [`FREQ_DIV_BIT-2:0]cnt;
    reg [`FREQ_DIV_BIT-1:0]cnt_tmp;
    //combinational
    always@*
        cnt_tmp = {clk_out, cnt} + 1'b1;
    //sequential
    always@(posedge clk or negedge rst_n)
    if (~rst_n)
        {clk_out, cnt} <= `FREQ_DIV_BIT'd0;
    else  {clk_out, cnt} <= cnt_tmp;
endmodule
