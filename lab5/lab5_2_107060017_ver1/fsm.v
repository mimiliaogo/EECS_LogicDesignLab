`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2019 02:58:50 PM
// Design Name: 
// Module Name: fsm
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
`define STATE_COUNT 1'b1
`define STATE_PAUSE 1'b0

module fsm(
    count_en,
    in,
    clk,
    rst
    );
    output reg count_en;
    input clk;
    input in;
    input rst;
    
    reg state;
    reg next_state;
    
    always@*
        case(state)
            1'b0:
            if (in)
            begin
            next_state = 1'b1;
            count_en = 1;
            end
            else
            begin 
            next_state = 1'b0;
            count_en = 0;
            end
            1'b1:
            if (in)
            begin
            next_state = 1'b0;
            count_en = 0;
            end
            else 
            begin
            next_state = 1'b1;
            count_en = 1;
            end
            default:
            begin
            next_state = 1'b0;
            count_en = 0;
            end
            endcase
   
    always@(posedge clk or posedge rst)
            if(rst) state<=`STATE_PAUSE;
            else state<=next_state;
    
endmodule
