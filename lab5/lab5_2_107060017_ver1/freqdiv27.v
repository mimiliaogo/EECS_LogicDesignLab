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
    clk_out,
    clk_fsm,
    clk_ctl,
    clk,
    rst
    );
    
    output clk_out;
    output clk_fsm;
    output [1:0] clk_ctl;
    
    input clk;
    input rst;
    
    reg clk_out;
    reg clk_fsm;
    reg [1:0] clk_ctl;
    reg [14:0] cnt_l;
    reg [1:0] cnt_h2;
    reg [5:0] cnt_h1;
    reg [`FREQ_DIV_BIT-1:0] cnt_tmp;
    
    always@(clk_out or cnt_h1 or clk_fsm or cnt_h2 or cnt_l or clk_ctl)
        cnt_tmp={clk_out,cnt_h1,clk_fsm,cnt_h2,clk_ctl,cnt_l}+1;
        
    always@(posedge clk or posedge rst)
        if(rst)
            {clk_out,cnt_h1,clk_fsm,cnt_h2,clk_ctl,cnt_l}<=`FREQ_DIV_BIT'b0;
        else
            {clk_out,cnt_h1,clk_fsm,cnt_h2,clk_ctl,cnt_l}<=cnt_tmp;                        
             
endmodule
