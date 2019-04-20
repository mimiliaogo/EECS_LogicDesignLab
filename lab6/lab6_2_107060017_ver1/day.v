`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2019 08:47:26 PM
// Design Name: 
// Module Name: day
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
`define TIME_BIT_WIDTH 7 

module day(
    clk,
    rst,
    month,
    dig1,
    dig0,
    cout
    );
    input clk;
    input rst;
    input [6:0]month;
    output [3:0]dig1;
    output [3:0]dig0;
    output reg cout;
    reg [6:0]day;
    reg [6:0]day_nxt;
    reg [6:0]limit;
    always@*
          case(month)
                `TIME_BIT_WIDTH'd1:limit=`TIME_BIT_WIDTH'd31;
                `TIME_BIT_WIDTH'd2:limit=`TIME_BIT_WIDTH'd28;
                `TIME_BIT_WIDTH'd3:limit=`TIME_BIT_WIDTH'd31;
                `TIME_BIT_WIDTH'd4:limit=`TIME_BIT_WIDTH'd30;
                `TIME_BIT_WIDTH'd5:limit=`TIME_BIT_WIDTH'd31;
                `TIME_BIT_WIDTH'd6:limit=`TIME_BIT_WIDTH'd30;
                `TIME_BIT_WIDTH'd7:limit=`TIME_BIT_WIDTH'd31;
                `TIME_BIT_WIDTH'd8:limit=`TIME_BIT_WIDTH'd31;
                `TIME_BIT_WIDTH'd9:limit=`TIME_BIT_WIDTH'd30;
                `TIME_BIT_WIDTH'd10:limit=`TIME_BIT_WIDTH'd31;
                `TIME_BIT_WIDTH'd11:limit=`TIME_BIT_WIDTH'd30;
                `TIME_BIT_WIDTH'd12:limit=`TIME_BIT_WIDTH'd31;
                default:limit=5'd29;
                endcase      
    always@*
        if (day==limit) begin
            day_nxt = 1;
            cout = 1;
        end
        else begin
            day_nxt = day + 1;
            cout = 0;
            end
        
    always@(posedge clk or posedge rst)
        if (rst) day <= 1;
        else day <= day_nxt;
    
    assign dig0 = day%10;
    assign dig1 = day/10;
endmodule
