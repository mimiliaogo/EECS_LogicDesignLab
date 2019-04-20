`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2019 11:24:15 AM
// Design Name: 
// Module Name: Decimal_adder
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


module Decimal_adder(
    input [3:0]a,
    input [3:0]b,
    input ci,
    output reg [3:0]s,
    output reg co
    );
always@* 
begin
        if(a+b+ci > 9) 
        begin
            co=1;
            s=(a+b+ci)+6;
        end
        else 
        begin
            co=0;
            s=(a+b+ci);
        end
end
endmodule
