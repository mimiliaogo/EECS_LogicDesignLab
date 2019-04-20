`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2019 04:59:56 PM
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
    input in,
    input pb_in,
    output rsto,
    output [3:0]ssd_ctl,
    output [7:0]D_ssd,
    output reg [15:0]led
    );
    wire state;
    wire count_en;
    wire [3:0]ssd_in;
    wire clk_out;
    wire [1:0]clk_ctl;
    wire [3:0]digit1;
    wire [3:0]digit0;

    
    always@*
    if (digit0==4'd0&&digit1==4'd0)
        led = 16'b1111111111111111;
    else begin
        led = 16'b0000_0000_0000_0000;
        end
   
   freqdiv27 Ufre(
           .clk_out(clk_out), //divided clk output
           .clk_ctl(clk_ctl),//ssd
           .clk(clk),
           .clk_fsm(clk_fsm)
           );
    reset_cnt Ureset(
        .clk(clk),
        .in(pb_in),
        .rst_en(rsto)
        );
 
    downcounter_2d U0(
        .digit1(digit1),
        .digit0(digit0),
        .clk(clk_out),
        .rst(rsto),
        .en(count_en)
        );
    fsm U1(
        .count_en(count_en),
        .in(in),
        .clk(clk),
        .rst(rsto)
        );
    scan_ctl USCan(
        .ssd_in(ssd_in),//output for display
        .ssd_ctl(ssd_ctl),//output 7-segment
        .ssd_en_ctl(clk_ctl),//input from freqdiv
        .in0(digit1),//input from cnt
        .in1(digit0),
        .in2(4'b1111),
        .in3(4'b1111)
        );
    display Udis(
        .i(ssd_in),
        .D_ssd(D_ssd)
        );
endmodule

