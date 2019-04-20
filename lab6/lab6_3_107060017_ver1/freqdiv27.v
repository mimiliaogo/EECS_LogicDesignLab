`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2019 02:18:26 PM
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
    clk_ctl,//ssd
    clk
    );
    output clk_out;
    output clk_ctl;
    input clk;
   
    
    reg clk_out;
    reg [1:0]clk_ctl;
    reg [16:0]clk_l;
    reg [8:0]clk_h;
    reg [`FREQ_DIV_BIT-1:0]cnt_tmp;
    //combinational
    always@*
        cnt_tmp = {clk_out, clk_h, clk_ctl, clk_l} + 1'b1;
    //sequential
    always@(posedge clk)
        {clk_out, clk_h, clk_ctl, clk_l} <= cnt_tmp;
endmodule
