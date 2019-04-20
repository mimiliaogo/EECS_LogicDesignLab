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
    carry_in,
    month,
    year,//check leap year
    day,
    cout
    );
    input clk;
    input rst;
    input carry_in;
    input [6:0]month;
    input [11:0]year;
    reg [6:0]month_leap;
    output reg cout;
    output reg [6:0]day;
    reg [6:0]day_next;
    reg [6:0]limit;
    always@*
         if (((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0 && year % 3200 != 0))&&(month==2))
            month_leap = 13;
        else month_leap = month;
    always@*
          case(month_leap)
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
                `TIME_BIT_WIDTH'd13:limit=`TIME_BIT_WIDTH'd29;// for leap year
                default:limit=5'd29;
                endcase      
   
    always@*
        if (day==limit&&carry_in) begin
                day_next = 1;
                cout = 1;
            end
            else if(carry_in)begin
                day_next = day + 1;
                cout = 0;
                end
            else begin
                day_next = day;
                cout=0;
                end
    always@(posedge clk or posedge rst)
        if (rst) day <= 1;
        else day <= day_next;
    
    
endmodule
