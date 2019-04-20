`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2019 01:30:56 PM
// Design Name: 
// Module Name: display
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



`define SS_n 8'b11010101
`define SS_t 8'b11100001
`define SS_h 8'b10010001
`define SS_u 8'b10000011
`define SS_e 8'b01100001
module display(
    input [2:0]i,
    output reg [7:0]D_ssd
    );
    always @* 
      begin
        case(i)
            4'd0: D_ssd = `SS_n;
            4'd1: D_ssd = `SS_t;
            4'd2: D_ssd = `SS_h;
            4'd3: D_ssd = `SS_u;
            4'd4: D_ssd = `SS_e;
           
            default: D_ssd = `SS_n;
      
        endcase
      end
        
endmodule

