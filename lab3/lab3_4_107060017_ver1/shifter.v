`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2019 07:41:43 PM
// Design Name: 
// Module Name: shifter
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


module shifter(
    input clk,
    input rst_n,
    output reg [2:0] in0,in1, in2, in3
    );
    reg [2:0]in4, in5;

    //sequential
    always@(posedge clk or negedge rst_n)
    if (~rst_n) begin
        in0 <= 3'd0;
        in1 <= 3'd1;
        in2 <= 3'd2;
        in3 <= 3'd3;
        in4 <= 3'd4;
        in5 <= 3'd4;
    end
    else begin
        in0 <= in1;
        in1 <= in2;
        in2 <= in3;
        in3 <= in4;
        in4 <= in5;
        in5 <= in0;
    end
endmodule

