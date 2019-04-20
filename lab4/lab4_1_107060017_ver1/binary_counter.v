`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2019 12:16:50 AM
// Design Name: 
// Module Name: binary_counter
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


module binary_counter(
    input clk,
    input rst_n,
    output [3:0]out
    );
    wire clk_out;
freqdiv U0(.clk(clk),.rst_n(rst_n),.clk_out(clk_out));
bincnt U1(.clk(clk_out),.rst_n(rst_n),.out(out));
endmodule
