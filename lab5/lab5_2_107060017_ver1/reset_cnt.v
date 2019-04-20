`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2019 03:51:53 PM
// Design Name: 
// Module Name: reset_cnt
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


module reset_cnt(
    clk,
    in,
    rst_en
    );
    output reg rst_en;
    input in, clk;
    
    reg [29:0]rst_cnt;
    reg [29:0]rst_cnt_nxt;
    always@*
        if (in)
        rst_cnt_nxt = rst_cnt + 1;
        else 
        rst_cnt_nxt = 30'b0;
    always@(posedge clk)
        if (rst_cnt == 30'd150000000)
        begin
            rst_en <= ~rst_en;
            rst_cnt<=30'd0;
        end
        else
            rst_cnt <= rst_cnt_nxt;
    
endmodule
