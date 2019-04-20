`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2019 11:03:55 AM
// Design Name: 
// Module Name: downcnt
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


module downcnt(
    val,//counter output
    borrow,
    decrease,
    limit,
    startval,
    clk,
    rst_n
    );
    output reg [3:0]val;
    output reg borrow;
    input [3:0]startval;
    input decrease;
    input [3:0]limit;
    input clk;
    input rst_n;
    reg [3:0]val_tmp;
    
    always@*
    if (decrease && val== 4'd0) begin
        val_tmp = limit;
        borrow = 1;
        end
    else if (decrease && val!=4'd0) begin
        val_tmp = val-1;
        borrow = 0;
        end
    else begin
        val_tmp = val;
        borrow = 0;
        end
    
    always@(posedge clk or negedge rst_n)
    if (~rst_n) val <= startval;
    else val <= val_tmp;
endmodule
