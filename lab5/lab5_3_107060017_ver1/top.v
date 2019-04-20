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
    input rst,
    input pb_in,
    output [7:0]D_ssd,
    output [3:0]ssd_ctl
    );
    wire in;
    in UIN (
        .clk(clk),
        .rst(rst),
        .pb_in(pb_in),
        .led_1pulse(in)
        );
    stopwatch USTOP(
        .clk(clk),
        .rst(rst),
        .in(in),
        .ssd_ctl(ssd_ctl),
        .D_ssd(D_ssd)
        );
        
endmodule
