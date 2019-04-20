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
    );
    output reg [3:0]ssd_in;
    output reg [3:0]ssd_ctl;
    input ssd_en_ctl;
    input [3:0]in0;
    input [3:0]in1;
    
    always@*
        case(ssd_en_ctl) 
           1'b0:
           begin
           ssd_ctl = 4'b0111;
           ssd_in = in0;
           end
           1'b1:
           begin
           ssd_ctl = 4'b1011;
           ssd_in = in1;
           end
           default:
            begin
            ssd_ctl = 4'b0111;
            ssd_in = in0;
            end
        endcase
           
            
    
endmodule
