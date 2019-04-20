`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2019 11:29:34 AM
// Design Name: 
// Module Name: shift_reg
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


module shift_reg(
    q,//LED
    clk,
    rst_n
    );
    input clk;
    input rst_n;
    output [7:0]q;
    
    wire clk_d;
    wire [7:0]q;
    
    //insert freqdiv
    freqdiv50M U0(
        .clk_out(clk_d),
        .clk(clk),
        .rst_n(rst_n)
    );
    //insert shifter
    shifter U1(
        .clk(clk_d),
        .rst_n(rst_n),
        .T(q)
    );
endmodule
