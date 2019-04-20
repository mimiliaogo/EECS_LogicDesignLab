`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2019 04:51:01 PM
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
    ssd_ctl,
    ssd_in,
    in0,
    in1,
    in2,
    in3,
    ssd_ctl_en
    );
    input [2:0]in0, in1, in2, in3;
    input [1:0]ssd_ctl_en;
    output [1:0]ssd_in;
    output [3:0]ssd_ctl;
    
    reg [3:0]ssd_ctl;
    reg [2:0]ssd_in;
    
     always@* 
           case(ssd_ctl_en) 
               2'b00: 
               begin
               ssd_ctl = 4'b0111;
               ssd_in = in0;
               end
               2'b01: 
               begin
               ssd_ctl = 4'b1011;
               ssd_in = in1;
               end
               2'b10:
               begin 
               ssd_ctl = 4'b1101;
               ssd_in = in2;
               end
               2'b11:
               begin
               ssd_ctl = 4'b1110;
               ssd_in = in3;
               end
               default:
               begin
               ssd_ctl = 4'b0111;
               ssd_in = in0;
               end
       endcase


endmodule
