`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2019 02:26:49 PM
// Design Name: 
// Module Name: downcounter_2d
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


module downcounter_2d(
    digit1,
    digit0,
    clk,
    rst,
    en
    );
    output [3:0]digit1;
    output [3:0]digit0;
    input clk;
    input rst;
    input en;
    
    wire br0, br1;
    wire decrease_en;
    
    assign decrease_en =  (en)&&(~((digit0==4'd0)&&(digit1==4'd0)));  
    
    downcounter U0(
        .val(digit0),
        .borrow(br0),
        .clk(clk),
        .rst(rst),
        .decrease(decrease_en),
        .init_val(4'd0),
        .limit(4'd9)
        );
     downcounter U1(
           .val(digit1),
           .borrow(br1),
           .clk(clk),
           .rst(rst),
           .decrease(br0),
           .init_val(4'd3),
           .limit(4'd5)
           );
    
endmodule
