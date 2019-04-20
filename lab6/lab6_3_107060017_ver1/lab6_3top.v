`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2019 04:46:20 PM
// Design Name: 
// Module Name: lab6_3top
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


module lab6_3watch(
    input clk,
    input rst,
    input pb_in,
    output [3:0]ssd_ctl,
    output [7:0]display,
    output pm
    );
    wire clk_out;
    wire [1:0]clk_ctl;
    wire [6:0]minute;
    wire[6:0]hour;
    wire [6:0]day;
    wire [6:0]month;
    wire [11:0]year;
    wire minout;
    wire hourout;
    wire dayout;
    wire monthout;
    wire [3:0]in0, in1, in2, in3, ssd_in;
    wire clk_27b;
    wire clk_100;
    wire led_pb;
    wire in;
    debounce UD (
            .clk(clk_100), 
            .rst(rst),
            .pb_in(pb_in),
            .pb_debounce(led_pb)
            );
    one_pulse U1P(
            .clk(clk),
            .rst(rst),
            .in_trig(led_pb),
            .out_pulse(in)
            );
    clk_generator UCLK(
       .clk_1(clk_out),
       .clk_100(clk_100),
       .clk(clk),
       .rst(rst)
       );
   
    freqdiv27 UFRE(
        .clk_out(clk_27b), //divided clk output
        .clk_ctl(clk_ctl),//ssd
        .clk(clk)
        );
    minute UMIN(
        .clk(clk_out),
        .rst(rst),
        .init_val(0),
        .limit(59), 
        .minute(minute),
        .carry_out(minout)
        );
    hour UHOUR(
        .clk(clk_out),
        .rst(rst),
        .init_val(0),
        .limit(23), 
        .carry_in(minout),
        .hour(hour),
        .cout(hourout)
        );
    day UDAY(
        .clk(clk_out),
        .rst(rst),
        .carry_in(hourout),
        .month(month),
        .year(year),//check leap year
        .day(day),
        .cout(dayout)
        );
    month UMON(
        .clk(clk_out), 
        .rst(rst),
        .cin(dayout),
        .cout(monthout),
        .month(month)
        );
     year UYEAR(
            .clk(clk_out),
            .rst(rst),
            .carry_in(monthout),
            .year(year)
            );
    mode UMODE(
            .clk(clk),
            .rst(rst),
            .in(in),
            .year(year),
            .month(month),
            .day(day),
            .hour(hour),
            .minute(minute),
            .in0(in0),
            .in1(in1),
            .in2(in2),
            .in3(in3),
            .pm(pm)
            );
    scan_ctl USCAN(
        .ssd_ctl(ssd_ctl),
        .ssd_in(ssd_in),
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .ssd_ctl_en(clk_ctl)
        );
    display UDIS(
        .i(ssd_in),
        .D_ssd(display)
        );
    
endmodule
