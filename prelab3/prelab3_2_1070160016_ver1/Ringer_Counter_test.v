`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2019 04:28:37 PM
// Design Name: 
// Module Name: Ringer_Counter_test
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


module Ringer_Counter_test;
    wire [7:0]T;
    reg clk;
    reg rst_n;
Ringer_Counter U0(.T(T),.clk(clk),.rst_n(rst_n));
initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin
rst_n = 0;
#10
rst_n = 1;
end

endmodule
