`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2019 02:53:32 PM
// Design Name: 
// Module Name: scrolling
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


module scrolling(
    input clk,
    input rst_n,
    output [7:0]D_ssd,
    output [3:0]ssd_ctl
    );
    
    wire clk_out;
    wire [1:0]clk_ctl;
    wire [2:0] in0,in1, in2, in3;
    wire [2:0]ssd_in;
    freqdiv27 U0(
        .clk_out(clk_out), //divided clk output
        .clk_ctl(clk_ctl),//ssd
        .clk(clk)
    );
    shifter U1(
        .clk(clk_out),
        .rst_n(rst_n),
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3)
    );
    scan_ctl U2(
        .ssd_ctl(ssd_ctl),
        .ssd_in(ssd_in),
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .ssd_ctl_en(clk_ctl)
    );
    display U3(
        .i(ssd_in),
        .D_ssd(D_ssd)
    );
    
   
endmodule
