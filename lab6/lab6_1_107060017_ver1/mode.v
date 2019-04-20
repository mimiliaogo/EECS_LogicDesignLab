`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2019 11:19:13 AM
// Design Name: 
// Module Name: mode
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


module mode(
    clk,
    rst,
    mode,
    minute,
    hour, 
    second,
    in0,
    in1,
    in2,
    in3,
    pm
    );
    input clk;
    input rst;
    input mode;
    input [6:0]minute, hour, second;
    output reg [4:0]in0, in1, in2, in3;
    output reg pm;
    reg [6:0] hour_tmp;
    reg [1:0]state;
    reg [1:0]next_state;
    always@*
        case(state)
        2'b00://23
        if (mode)
        begin
            next_state = 2'b01;
            if (hour>12) begin
                pm = 1;
                hour_tmp = hour - 12;
            end
            else if (hour==12) begin
                pm = 1;
                hour_tmp = hour;
            end
            else if (hour==0) begin
                pm= 0;
                hour_tmp = 12;
            end
            else begin
                pm = 0;
                hour_tmp = hour;
            end
        end
        else
            begin 
            next_state = 2'b00;
            hour_tmp = hour;
            pm = 0;
            end
        2'b01://12
        if (mode)begin
            next_state = 2'b10;
        end
        else begin
         next_state = 1'b1;
         if (hour>12) begin
                 pm = 1;
                 hour_tmp = hour - 12;
             end
             else if (hour==12) begin
                 pm = 1;
                 hour_tmp = hour;
             end
             else if (hour==0) begin
                 pm= 0;
                 hour_tmp = 12;
             end
             else begin
                 pm = 0;
                 hour_tmp = hour;
             end
         end
        2'b10:
        if (mode)begin
            next_state = 2'b00;
            if (pm==1) begin
                pm = 0;
                hour_tmp = hour;
            end
            else begin
                hour_tmp = hour;
            end
        end
        else begin
            next_state = 2'b10;
            pm = 0;
        end
        default:
        begin
        next_state = 2'b00;
        pm = 0;
        hour_tmp = hour;
        end
        endcase
        
       always@* 
        case(state)
            2'b00:begin
            in0=minute%10;
            in1=minute/10;
            in2=hour_tmp%10;
            in3=hour_tmp/10; 
            end
            2'b01:begin
            in0=minute%10;
            in1=minute/10;
            in2=hour_tmp%10;
            in3=hour_tmp/10; 
            end
            2'b10:begin
            in0=second%10;
            in1=second/10;
            in2=0;
            in3=0; 
            end
            default:in0=0;
       endcase
            
    always@(posedge clk or posedge rst)
    if (rst) state <= 0;
    else state <= next_state;
    
   /* assign in0 = minute%10;
    assign in1 = minute/10;
    assign in2 = hour_tmp%10;
    assign in3 = hour_tmp/10;
            */
endmodule
