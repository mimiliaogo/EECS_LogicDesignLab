`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2019 05:57:41 PM
// Design Name: 
// Module Name: FA_test
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


module FA_test;
wire COUT, S;
reg X, Y, CIN;
FA U0(.cout(COUT),.s(S),.x(X),.y(Y),.cin(CIN));
initial
begin
    X=0;Y=0;CIN=0;
    #10 X=0;Y=0;CIN=1;
    #10 X=0;Y=1;CIN=0;
    #10 X=0;Y=1;CIN=1;
    #10 X=1;Y=0;CIN=0;
    #10 X=1;Y=0;CIN=1;
    #10 X=1;Y=1;CIN=0;
    #10 X=1;Y=1;CIN=1;
end
endmodule
