`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2019 10:49:42 AM
// Design Name: 
// Module Name: hour
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


module hour(
        clk,
        rst,
        init_val,
        limit, 
        carry_in,
        hour
    );
    input clk;
    input rst;
    input carry_in;
    input [6:0]limit;
    input [6:0]init_val;
    output reg [6:0]hour;
    reg [6:0]hour_next;
    always@*
        if (hour<=limit && carry_in)
           hour_next = hour + 1;
       else if (hour<=limit && (~carry_in))
           hour_next = hour;
       else
            hour_next = 0;
    
    always@(posedge clk or posedge rst)
        if(rst) hour <= init_val;
        else hour <= hour_next;
    
endmodule
