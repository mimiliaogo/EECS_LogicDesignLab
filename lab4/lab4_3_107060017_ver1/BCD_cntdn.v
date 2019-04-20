module BCDcntdn(
    input clk,
    input rst_n,
    output reg [3:0]out
    );
    reg [3:0]D_out;
    
    always@*
    if (out==4'd0) D_out = 4'd9;
    else D_out = out - 1;
    
    always@(posedge clk or negedge rst_n)
    if (~rst_n) out <= 4'd0;
    else out <= D_out; 
endmodule