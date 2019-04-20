`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2019 10:29:45 AM
// Design Name: 
// Module Name: minute
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


module minute(
        clk,
        rst,
        init_val,
        limit, 
        minute,
        carry_out
    );
    input clk;
    input rst;
    input [6:0]limit;
    input [6:0]init_val;
    output reg [6:0]minute;
    output reg carry_out;
    
    reg [6:0]minute_next;
    always@*
        if (minute<limit) begin
            minute_next = minute + 1;
            carry_out = 0;
            end
        else begin
            minute_next = init_val;
            carry_out = 1;
            end
    always@(posedge clk or posedge rst)
        if(rst) minute <= init_val;
        else minute <= minute_next;
        
endmodule
