`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2019 11:20:13 AM
// Design Name: 
// Module Name: in
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


module in(
    clk,
    rst,
    pb_in,
    led_1pulse
    );
    input clk;
    input rst;
    input pb_in;
    output led_1pulse;
    wire clk_1;
    wire clk_100;
    wire led_pb;
    clock_generator UC (
        .clk(clk),
        .rst(rst),
        .clk_1(clk_1),
        .clk_100(clk_100)
        );
    debounce UD (
        .clk(clk_100), 
        .rst(rst),
        .pb_in(pb_in),
        .pb_debounce(led_pb)
        );
    one_pulse U1P(
        .clk(clk_1),
        .rst(rst),
        .in_trig(led_pb),
        .out_pulse(led_1pulse)
        );
endmodule
