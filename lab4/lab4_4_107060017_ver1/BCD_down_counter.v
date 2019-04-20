`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2019 11:30:47 AM
// Design Name: 
// Module Name: BCD_down_counter
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


module BCD_down_counter(
    input clk,
    input rst_n,
    output [7:0]D_ssd,
    output [3:0]ssd_ctl
    );
    wire clk_out;
    wire ssd_ctl_en;
    wire [3:0]in0;
    wire [3:0]in1;
    wire [3:0]ssd_in;
    wire br0;
    wire br1;
    reg cnt_en;
    
freqdiv27 U0(.clk(clk),.clk_out(clk_out),.clk_ctl(ssd_ctl_en));
always@*
if (in0==0&&in1==0) cnt_en = 1'b0;
else cnt_en = 1'b1;
downcnt U1(
    .val(in0),//counter output
    .borrow(br0),
    .decrease(cnt_en),
    .limit(4'd9),
    .startval(4'd0),
    .clk(clk_out),
    .rst_n(rst_n)
    );
downcnt U2(
        .val(in1),//counter output
        .borrow(br1),
        .decrease(br0),
        .limit(4'd3),
        .startval(4'd3),
        .clk(clk_out),
        .rst_n(rst_n)
        );
        
scan_ctl U3(
        .ssd_in(ssd_in),//output for display
        .ssd_ctl(ssd_ctl),//output 7-segment
        .ssd_en_ctl(ssd_ctl_en),//input from freqdiv
        .in0(in0),//input from cnt
        .in1(in1)
        );
display U4(
        .i(ssd_in),
        .D_ssd(D_ssd)
        );
        
endmodule
