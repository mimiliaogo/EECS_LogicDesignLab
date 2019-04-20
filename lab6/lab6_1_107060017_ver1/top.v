`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2019 11:51:15 AM
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
    display,
    ssd_ctl,
    pm,
    clk,
    rst,
    modeo
    );
    output [7:0] display;
    output [3:0] ssd_ctl;
    output pm;
       
    input clk;
    input rst;
    input modeo;
    
    wire clk_out;
    wire [1:0]clk_ctl;
    wire clk_o;
    wire clk_out;
    wire [6:0]minute;
    wire [6:0]hour, second;
    wire carry_out;
    wire [3:0]in0, in1, in2, in3;
    wire [3:0]ssd_in;
    wire mode;
    wire clk_100;
    wire led_pb;
    wire secondout;
     clk_generator UC (
           .clk(clk),
           .rst(rst),
           .clk_1(clk_out),
           .clk_100(clk_100)
           );
       debounce UD (
           .clk(clk_100), 
           .rst(rst),
           .pb_in(modeo),
           .pb_debounce(led_pb)
           );
       one_pulse U1P(
           .clk(clk_100),
           .rst(rst),
           .in_trig(led_pb),
           .out_pulse(mode)
           );
    
    freqdiv27 UFRE(
        .clk_out(clk_o), //divided clk output
        .clk_ctl(clk_ctl),//ssd
        .clk(clk)
        );
        second USE(
            .clk(clk_out),
            .rst(rst), 
            .second(second),
            .carry_out(secondout)
            );
    
    minute UMIN(
                .clk(clk_out),
                .rst(rst),
                .init_val(7'd0),
                .limit(7'd59), 
                .minute(minute),
                .carry_out(carry_out),
                 .carry_in(secondout)
            );
    hour  UHOU(
            .clk(clk_out),
            .rst(rst),
            .init_val(7'd0),
            .limit(7'd23), 
            .carry_in(carry_out),
            .hour(hour)
            );
    mode UMODE(
            .clk(clk_100),
            .rst(rst),
            .mode(mode),
            .minute(minute),
            .second(second),
            .hour(hour), 
            .in0(in0),
            .in1(in1),
            .in2(in2),
            .in3(in3),
            .pm(pm)
            );
        scan_ctl USCAN(
            .ssd_ctl(ssd_ctl),
            .ssd_in(ssd_in),
            .in0(in3),
            .in1(in2),
            .in2(in1),
            .in3(in0),
            .ssd_ctl_en(clk_ctl)
            );
        display UDIS(
                .i(ssd_in),
                .D_ssd(display)
                );
                
    
    
endmodule
