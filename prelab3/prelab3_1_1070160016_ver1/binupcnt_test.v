`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2019 03:14:14 PM
// Design Name: 
// Module Name: binupcnt_test
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
`define CNT_BIT_WIDTH 4

module binupcnt_test;
    wire [`CNT_BIT_WIDTH-1:0]q;
    reg clk;
    reg rst_n;
binupcnt U0(.q(q),.clk(clk),.rst_n(rst_n));
initial begin 
clk=0;
forever #5 clk=~clk;
end
initial begin
rst_n=0;
#10;
rst_n=1;
end
 
endmodule
