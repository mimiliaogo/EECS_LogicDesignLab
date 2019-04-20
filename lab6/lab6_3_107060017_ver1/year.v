`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2019 04:41:43 PM
// Design Name: 
// Module Name: year
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


module year(
    clk,
    rst,
    carry_in,
    year
    );
    input clk;
    input rst;
    input carry_in;
    output reg [11:0]year;
    reg [11:0]year_next;
    always@*
        if (year<=2200 && carry_in)
           year_next = year + 1;
       else if (year<=2200 && (~carry_in))
           year_next = year;
       else
            year_next = 0;
    
    always@(posedge clk or posedge rst)
        if(rst) year <= 2000;
        else year <= year_next;
endmodule
