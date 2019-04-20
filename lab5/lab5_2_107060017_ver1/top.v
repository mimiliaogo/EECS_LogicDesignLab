`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2019 11:22:25 AM
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input pb_in,
    output [7:0]D_ssd,
    output [3:0]ssd_ctl,
    output [15:0]led
    );
    wire in;
    wire rst;
    in UIN (
        .clk(clk),
        .rst(rst),
        .pb_in(pb_in),
        .led_1pulse(in)
        );
    stopwatch USTOP(
        .clk(clk),
        .pb_in(pb_in),//original
        .in(in),//debounce one pulse
        .rsto(rst),//output
        .ssd_ctl(ssd_ctl),
        .D_ssd(D_ssd),
        .led(led)
        );
        
endmodule
