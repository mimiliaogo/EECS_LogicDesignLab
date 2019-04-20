`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2019 11:21:36 AM
// Design Name: 
// Module Name: one_pulse
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
module one_pulse(
    out_pulse,
    in_trig,
    clk,
    rst
    );
    
    output out_pulse;
    
    input in_trig;
    input clk;
    input rst;
    
    reg out_pulse;
    reg in_trig_delay;
    
    always@(posedge clk or posedge rst)
        if(rst)
            in_trig_delay<=1'b0;
        else
            in_trig_delay<=in_trig;
    
    assign out_pulse_next=in_trig&(~in_trig_delay);
    
    always@(posedge clk or posedge rst)
        if(rst)
            out_pulse<=1'b0;
        else
            out_pulse<=out_pulse_next;
    
endmodule




