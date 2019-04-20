module month(
    clk, 
    rst,
    cin,
    cout,
    dig1,
    dig0,
    month
    );
    input clk, rst, cin;
    output reg cout;
    output [3:0]dig0, dig1;
    output reg [6:0]month;
    reg [6:0]month_nxt;
    always@*
        if (month==12&&cin) begin
            cout = 1;
            month_nxt=1;
            end
        else if (cin)begin
            cout = 0;
            month_nxt = month + 1;
            end
        else begin
            cout = 0;
            month_nxt = month;
            end
   always@(posedge clk or posedge rst)
            if (rst) month <= 1;
            else month <= month_nxt;
            
            
    assign dig0 = month%10;
    assign dig1 = month/10;
endmodule