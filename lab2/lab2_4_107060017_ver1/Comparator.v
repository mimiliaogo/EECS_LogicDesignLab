`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2019 08:05:40 PM
// Design Name: 
// Module Name: Comparator
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


module Comparator(
    input [3:0]A,
    input [3:0]B,
    output [3:0]ssd_ctl,
    output reg x,
    output [3:0]a,
    output [3:0]b,
    output [7:0]D_ssd
    );
    reg [3:0]i;
    display U0(.i(i),.D_ssd(D_ssd));
    assign a = A;
    assign b = B;
    assign ssd_ctl = 4'b0000;
    always@*
    begin
    if (A>B) begin
    x = 1;
    i = A;
    end
    else begin
    x = 0;
    i = B;
    end
    
    end
endmodule
