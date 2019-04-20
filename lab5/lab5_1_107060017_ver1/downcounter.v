`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2019 02:28:36 PM
// Design Name: 
// Module Name: downcounter
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


module downcounter(
    val,
    borrow,
    clk,
    rst,
    decrease,
    init_val,
    limit
    );
    output reg [3:0]val;
    output reg borrow;
    input [3:0]init_val;
    input decrease;
    input [3:0]limit;
    input clk;
    input rst;
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
    
    
    //register
    always@(posedge clk or posedge rst)
        if (rst) val <= init_val;
        else val <= val_tmp;
endmodule
