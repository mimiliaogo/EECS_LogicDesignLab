`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2019 04:19:37 PM
// Design Name: 
// Module Name: BCD_ssd
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


module BCD_ssd(
    input [3:0]i,
    output [7:0]D_ssd,
    output reg [3:0]d,
    output reg [3:0]ssd_ctl
    );
display U0(.i(i),.D_ssd(D_ssd));
always @*
begin
    d = i;
    ssd_ctl = 4'b0000;
end
endmodule
