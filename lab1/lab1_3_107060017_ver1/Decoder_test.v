module Decoder_test;
wire [7:0]d;
reg [2:0]in;
reg en;

Decoder U0(.in(in),.en(en),.d(d));
initial
begin
in=0;
en=0;
repeat(8)
begin
    #10
    in = in + 1;
end
in=0;
en=1;
repeat(8)
begin
    #10
    in = in + 1;
end
end
endmodule