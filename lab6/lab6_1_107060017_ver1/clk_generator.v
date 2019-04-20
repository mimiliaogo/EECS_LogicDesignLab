`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2019 10:27:45 AM
// Design Name: 
// Module Name: clk_generator
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


`define DIV_BY_50M 50_000_000/900
`define DIV_BY_50M_BIT_WIDTH 27
`define DIV_BY_500K 500_000
`define DIV_BY_500K_BIT_WIDTH 20
module clk_generator(
    clk_1,
    clk_100,
    clk,
    rst
    );
    
    output clk_1;
    output clk_100;
    
    input clk;
    input rst;
    
    reg clk_1;
    reg clk_100;
    reg [`DIV_BY_50M_BIT_WIDTH-1:0] count_50M,count_50M_next;
    reg [`DIV_BY_500K_BIT_WIDTH-1:0] count_500K,count_500K_next;
    reg clk_1_next;
    reg clk_100_next;
    
    //clk_1
    always@(*)
        if(count_50M==`DIV_BY_50M-1)
        begin
            count_50M_next=`DIV_BY_50M_BIT_WIDTH'd0;
            clk_1_next=~clk_1;
        end
        else
        begin
            count_50M_next=count_50M+1'b1;
            clk_1_next=clk_1;
        end 
    
    always@(posedge clk or posedge rst)
        if(rst)
        begin
            count_50M<=`DIV_BY_50M_BIT_WIDTH'b0;
            clk_1<=1'b0;
        end
        else
        begin
            count_50M<=count_50M_next;
            clk_1<=clk_1_next;
        end
        
    //clk_100
    always@(*)
        if(count_500K==`DIV_BY_500K-1)
        begin
            count_500K_next=`DIV_BY_500K_BIT_WIDTH'd0;
            clk_100_next=~clk_100;
        end
        else
        begin
            count_500K_next=count_500K+1'b1;
            clk_100_next=clk_100;
        end
        
    always@(posedge clk or posedge rst)
        if(rst)
        begin
            count_500K<=`DIV_BY_500K_BIT_WIDTH'b0;
            clk_100<=1'b0;
        end
        else
        begin
            count_500K<=count_500K_next;
            clk_100<=clk_100_next;
        end
        
endmodule

   
