`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2019 12:08:08 PM
// Design Name: 
// Module Name: Decimal_adder_test
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
module Decimal_adder_test;
    
    wire [3:0]s;
    wire co;
    reg [3:0]a;
    reg [3:0]b;
    reg ci;   

 Decimal_adder U0(.s(s),.co(co),.a(a),.b(b),.ci(ci));

initial
begin
    ci = 0;
    repeat(2)
    begin
         a = 0;
         b = 0;
         #1
        repeat(10)
             begin
                 #1
                 repeat(10)
                 begin
                     #1
                     b = b + 1;
                 end
                 a = a + 1;
                 b = 0;
             end
         ci = ci + 1;
    end
   
   
    
end

endmodule