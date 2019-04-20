module year(
    clk, 
    rst,
    cin,
    dig1,
    dig0
    );
    input clk, rst, cin;
    output [3:0]dig0, dig1;
    reg [7:0]year;
    reg [7:0]year_nxt;
    always@*
        if (year==99&&cin) begin
            year_nxt=0;
            end
        else if (cin)begin
            year_nxt = year + 1;
            end
        else begin
            year_nxt = year;
            end
    always@(posedge clk or posedge rst)
            if (rst) year <= 0;
            else year <= year_nxt;
            
            
    assign dig0 = year%10;
    assign dig1 = year/10;
endmodule