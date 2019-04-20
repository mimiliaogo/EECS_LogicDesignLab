`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2019 02:58:13 PM
// Design Name: 
// Module Name: stopwatch
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


module stopwatch(
    input clk,
    input rst_n,
    input in,
    output [3:0]digit0,
    output [3:0]digit1,
    output reg state_led,
    output reg [14:0]led
    );
    wire state;
    wire count_en;
    always@*
    if (digit0==4'd0&&digit1==4'd0)
        {led, state_led} = 16'b1111111111111111;
    else begin
        state_led = state;
        led = 15'b000_0000_0000_0000;
        end
    downcounter_2d U0(
        .digit1(digit1),
        .digit0(digit0),
        .clk(clk),
        .rst_n(rst_n),
        .en(count_en)
        );
    fsm U1(
        .count_en(count_en),
        .state(state),
        .in(in),
        .clk(clk),
        .rst_n(rst_n)
        );
endmodule
