`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2019 11:20:57 AM
// Design Name: 
// Module Name: debounce
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
`define DEBOUNCE_WINDOW_SIZE 4
module debounce(
    pb_debounce,
    pb_in,
    clk,
    rst
    );
    
    output pb_debounce;
    
    input pb_in;
    input clk;
    input rst;
    
    reg pb_debounce;
    reg [`DEBOUNCE_WINDOW_SIZE-1:0] debounce_window;
    reg pb_debounce_next;
    
    always@(posedge clk or posedge rst)
        if(rst)
            debounce_window<=`DEBOUNCE_WINDOW_SIZE'd0;
        else
            debounce_window<={debounce_window[`DEBOUNCE_WINDOW_SIZE-2:0],pb_in};
 
    always@(*)
        if (debounce_window == `DEBOUNCE_WINDOW_SIZE'b1111) 
            pb_debounce_next = 1'b1;
        else
            pb_debounce_next = 1'b0;
            
    always@(posedge clk or posedge rst)
        if(rst)
            pb_debounce<=1'b0;
        else
            pb_debounce<=pb_debounce_next;   
   
endmodule

