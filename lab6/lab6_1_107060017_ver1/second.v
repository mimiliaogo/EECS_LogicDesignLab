`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2019 04:41:03 PM
// Design Name: 
// Module Name: second
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


module second(
    clk,
    rst, 
    second,
    carry_out
    );
    input clk;
    input rst;
    
    output reg [6:0]second;
    output reg carry_out;
    
    reg [6:0]second_next;
    always@*
        if (second<59) begin
            second_next = second + 1;
            carry_out = 0;
            end
        else begin
            second_next = 0;
            carry_out = 1;
            end
    always@(posedge clk or posedge rst)
        if(rst) second <= 0;
        else second <= second_next;
endmodule
