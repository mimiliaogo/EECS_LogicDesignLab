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
    input rst,
    input in,
    output [3:0]ssd_ctl,
    output [7:0]D_ssd
    );
    wire state;
    wire count_en;
    wire [3:0]ssd_in;
    wire clk_out;
    wire [1:0]clk_ctl;
    wire [3:0]digit1;
    wire [3:0]digit0;
    wire [3:0]init_val0;
    wire [3:0]init_val1;
    wire state;
   freqdiv27 Ufre(
           .clk_out(clk_out), //divided clk output
           .clk_ctl(clk_ctl),//ssd
           .clk(clk)
           );
    mode UMODE(
        .clk(clk_out),
        .rst(rst),
        .init_val0(init_val0),
        .init_val1(init_val1)
        );
    downcounter_2d U0(
        .digit1(digit1),
        .digit0(digit0),
        .clk(clk_out),
        .rst(rst),
        .state(state),
        .en(count_en),
        .init_val0(init_val0),
        .init_val1(init_val1)
        );
    fsm U1(
        .count_en(count_en),
        .in(in),
        .state(state),
        .clk(clk_out),
        .rst(rst)
        );
        
    scan_ctl USCan(
        .ssd_in(ssd_in),//output for display
        .ssd_ctl(ssd_ctl),//output 7-segment
        .ssd_en_ctl(clk_ctl),//input from freqdiv
        .state(state),
        .in2(digit1),//input from cnt
        .in3(digit0),
        .in0(4'b1111),
        .in1(4'b0001)
        );
    display Udis(
        .i(ssd_in),
        .D_ssd(D_ssd)
        );
endmodule

