module BCD_dn_counter(
    input clk,
    input rst_n,
    output [7:0]D_ssd,
    output reg [3:0]ssd_ctl
    );
    wire clk_out;
    wire [3:0]out;
    always@*
    ssd_ctl = 4'b0000;
freqdiv U0(.clk(clk),.rst_n(rst_n),.clk_out(clk_out));
BCDcntdn U1(.clk(clk_out),.rst_n(rst_n),.out(out));
display U2(.i(out),.D_ssd(D_ssd));
endmodule