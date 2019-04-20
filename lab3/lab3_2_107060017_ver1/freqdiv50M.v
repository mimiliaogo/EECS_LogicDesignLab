`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2019 10:49:05 AM
// Design Name: 
// Module Name: freqdiv50M
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


module freqdiv50M(
    clk,
    rst_n,
    clk_out
    );
    input clk;
    input rst_n;
    output clk_out;
    
    reg [25:0]clk_tmp_D;
    reg [25:0]clk_tmp;
    reg clk_out_D;
    reg clk_out;
    //combinational
    always@*
        if (clk_tmp == 50000000) begin
            clk_tmp_D = 1'b0;
            clk_out_D = ~clk_out;
            end
        else begin
            clk_tmp_D = clk_tmp + 1'b1;
            clk_out_D = clk_out;
            end
    //sequential
    always@(posedge clk or negedge rst_n)
        if (~rst_n) begin
            clk_tmp <= 1'b0;
            clk_out <= 1'b0;
            end
        else begin
            clk_tmp <= clk_tmp_D;
            clk_out <= clk_out_D;
            end
        
   
endmodule
