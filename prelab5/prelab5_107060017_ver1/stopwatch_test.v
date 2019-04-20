`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2019 03:21:25 PM
// Design Name: 
// Module Name: stopwatch_test
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

`define BCD_BIT_WIDTH 4 
module stopwatch_test;
    wire state_led;
    wire [`BCD_BIT_WIDTH-1:0] digit1;
    wire [`BCD_BIT_WIDTH-1:0] digit0;
    wire [14:0]led;
    
    reg clk;
    reg rst_n;
    reg in;
    
    stopwatch U0(
        .state_led(state_led),
        .digit1(digit1),
        .digit0(digit0),
        .led(led),
        .clk(clk),
        .rst_n(rst_n),
        .in(in)
    );
    
    always
        #5 clk=~clk;
        
    initial
    begin
    clk=0;rst_n=0;in=0;
    #15 in=1;
    #15 rst_n=1;
    #800 in=0;
    #10 rst_n=0;
    #10 rst_n=1;
    #10 in=1;
    #25 in=0;
    end
endmodule
