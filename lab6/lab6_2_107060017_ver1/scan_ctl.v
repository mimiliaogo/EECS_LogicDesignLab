`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2019 11:19:21 AM
// Design Name: 
// Module Name: scan_ctl
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


module scan_ctl(
    ssd_in,//output for display
    ssd_ctl,//output 7-segment
    ssd_en_ctl,//input from freqdiv
    in,
    in0,//input from cnt
    in1,
    in2,
    in3,
    in4,
    in5
    );
    output reg [3:0]ssd_in;
    output reg [3:0]ssd_ctl;
    input [1:0]ssd_en_ctl;
    input in;//dipswitch
    input [3:0]in0;//month
    input [3:0]in1;//month
    input [3:0]in2;//day
    input [3:0]in3;
    input [3:0]in4, in5;//year
    always@*
        case(ssd_en_ctl) 
           2'b00:
           begin
           ssd_ctl = 4'b1110;
           if (in)
           ssd_in = in0;
           else 
           ssd_in = in4;
           end
           2'b01:
           begin
           ssd_ctl = 4'b1101;
           if (in)
           ssd_in = in1;
           else
           ssd_in = in5;
           end
            2'b10:
             begin
             if (in)begin
             ssd_ctl = 4'b1011;
             ssd_in = in2;
             end
             else ssd_ctl = 4'b1111;
             end
             2'b11:
             begin
             if (in)begin
             ssd_ctl = 4'b0111;
             ssd_in = in3;
             end 
             else ssd_ctl = 4'b1111;
             end
           default:
            begin
            ssd_ctl = 4'b0111;
            ssd_in = in3;
            end
        endcase
           
            
    
endmodule
