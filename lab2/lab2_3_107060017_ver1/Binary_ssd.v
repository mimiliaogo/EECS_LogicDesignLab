`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2019 05:26:50 PM
// Design Name: 
// Module Name: Binary_ssd
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


module Binary_ssd(
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
