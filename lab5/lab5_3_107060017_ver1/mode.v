`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2019 05:52:49 PM
// Design Name: 
// Module Name: mode
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


module mode(
    clk,
    rst,
    init_val0,
    init_val1
    );
    input clk;
    input rst;
    output reg [3:0]init_val0;
    output reg [3:0]init_val1;
    reg state;
    reg next_state;
    always@*
        case(state)
            1'b0://30s
            if (rst) begin
            next_state = 1'b1;
            init_val0 = 0;
            init_val1 = 0;
            end
            else begin
            next_state = 1'b0;
            init_val0 = 0;
            init_val1 = 3;
            end
            1'b1://60s
            if (rst) begin
            next_state = 1'b0;
            init_val0 = 0;
            init_val1 = 3;
            end
            else begin
            next_state = 1'b1;
            init_val0 = 0;
            init_val1 = 0;
            end
            endcase
            
            always@(posedge clk)
                state<=next_state;
endmodule
