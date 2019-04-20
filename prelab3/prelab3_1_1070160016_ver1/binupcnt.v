`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2019 03:01:10 PM
// Design Name: 
// Module Name: binupcnt
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
`define CNT_BIT_WIDTH 4

module binupcnt(
    q,// output
    clk, //global clock
    rst_n //active low reset
    );
    
    output [`CNT_BIT_WIDTH-1:0]q;
    input clk;
    input rst_n;
    
    reg [`CNT_BIT_WIDTH-1:0]q;
    reg[`CNT_BIT_WIDTH-1:0]q_tmp;
    
    //combinational logics
    always@*
        q_tmp = q + 1'b1;
    
    //sequential logics
    always@(posedge clk or negedge rst_n)
        if (~rst_n) q<=`CNT_BIT_WIDTH'd0;
        else q<=q_tmp;
    
endmodule
