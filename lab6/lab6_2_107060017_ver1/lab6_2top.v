`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2019 09:30:48 PM
// Design Name: 
// Module Name: lab6_2top
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


module lab6_2top(
    input clk,
    input rst,
    input in,
    output [3:0]ssd_ctl,
    output [7:0]D_ssd
    );
    wire clk_out;
    wire [1:0]clk_ctl;
    wire [3:0]day1, day0, month0, month1, year0, year1;
    wire coutday;
    wire coutmonth;
    wire [6:0]month;
    wire [3:0]ssd_in;
    freqdiv27 UFREQ(
        .clk_out(clk_out), //divided clk output
        .clk_ctl(clk_ctl),//ssd
        .clk(clk)
        );
     day UDAY(
           .clk(clk_out),
           .rst(rst),
           .month(month),
           .dig1(day1),
           .dig0(day0),
           .cout(coutday)
           );
    month UMON(
          .clk(clk_out), 
          .rst(rst),
          .cin(coutday),
          .cout(coutmonth),
          .dig1(month1),
          .dig0(month0),
          .month(month)
          );
       year UYEAR(
             .clk(clk_out), 
             .rst(rst),
             .cin(coutmonth),
             .dig1(year1),
             .dig0(year0)
             );
     scan_ctl USCAN(
                 .ssd_in(ssd_in),
                 .ssd_ctl(ssd_ctl),
                 .ssd_en_ctl(clk_ctl),
                 .in(in),
                 .in0(month1),
                 .in1(month0),
                 .in2(day1),
                 .in3(day0),
                 .in4(year1),
                 .in5(year0)
                 );
       display UDI(
        .i(ssd_in),
        .D_ssd(D_ssd)
       );
endmodule
