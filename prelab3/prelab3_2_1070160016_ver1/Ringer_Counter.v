`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2019 03:57:28 PM
// Design Name: 
// Module Name: Ringer_Counter
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


module Ringer_Counter(
    input clk,
    input rst_n,
    output [7:0]T
    );
    reg [7:0]T;  
    //combinational
    wire[7:0]T_tmp = {T[6:0], T[7]};
    //sequential
    always@(posedge clk or negedge rst_n)
    if (~rst_n) T <= 8'b01010101;
    else T <= T_tmp;
    
endmodule
