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
    in0,//input from cnt
    in1,
    in2,
    in3
    );
    output reg [3:0]ssd_in;
    output reg [3:0]ssd_ctl;
    input [1:0]ssd_en_ctl;
    input [3:0]in0;
    input [3:0]in1;
    input [3:0]in2;
    input [3:0]in3;
    always@*
        case(ssd_en_ctl) 
           2'b00:
           begin
           ssd_ctl = 4'b1110;
           ssd_in = in0;
           end
           2'b01:
           begin
           ssd_ctl = 4'b1101;
           ssd_in = in1;
           end
            2'b10:
             begin
             ssd_ctl = 4'b1011;
             ssd_in = in2;
             end
             2'b11:
             begin
             ssd_ctl = 4'b0111;
             ssd_in = in3;
             end
           default:
            begin
            ssd_ctl = 4'b0111;
            ssd_in = in3;
            end
        endcase
           
            
    
endmodule
