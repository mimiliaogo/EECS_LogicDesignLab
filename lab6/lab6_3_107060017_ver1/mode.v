`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2019 05:22:07 PM
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
    in,
    year,
    month,
    day,
    hour,
    minute,
    in0,
    in1,
    in2,
    in3,
    pm
    );
    input clk, rst, in;
    input [11:0]year;
    input [6:0]month, day, hour, minute;
    output reg [3:0]in0, in1, in2, in3;
    output reg pm;
    reg [2:0]state;
    reg [2:0]next_state;
    reg [6:0]hour_tmp;
    always@*
    case (state)
        3'b000:
            if (in) begin
             next_state = 3'b001;
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
            else begin
                next_state = 3'b000;
                hour_tmp = hour;
                pm = 0;
            end
        3'b001:
            if (in)begin
                next_state = 3'b010;
                pm=0;
            end
            else begin
                next_state = 3'b001;
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
        3'b010:
            if(in) begin
                next_state = 3'b011;
                pm=0;
                end
            else begin
                next_state = 3'b010;
                pm=0;
                end
        3'b011:
            if (in) begin
                next_state = 3'b000;
                    if (pm==1) begin
                        pm = 0;
                        hour_tmp = hour;
                    end
                    else begin
                        hour_tmp = hour;
                    end
                end
            else begin
                next_state=3'b011;
                pm=0;
                end
        default: 
            next_state=3'b000;
    endcase
        //for in0-in3
        always@* 
        case(state)
            3'b000:begin
            in0=minute%10;
            in1=minute/10;
            in2=hour_tmp%10;
            in3=hour_tmp/10; 
            end
            3'b001:begin
            in0=minute%10;
            in1=minute/10;
            in2=hour_tmp%10;
            in3=hour_tmp/10; 
            end
            3'b010:begin
            in0=day%10;
            in1=day/10;
            in2=month%10;
            in3=month/10; 
            end
            3'b011:begin
            in0=year%10;
            in1=(year%100)/10;
            in2=(year%1000)/100;
            in3=year/1000; 
            end
            default:in0=0;
        endcase
    always@(posedge clk or posedge rst)
        if (rst) state <= 0;
        else state <= next_state;
   
endmodule
