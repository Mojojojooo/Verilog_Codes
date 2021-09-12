module counter(
    q,clock,clear
);

input clock,clear;
output [3:0]q;
reg [3:0]q;

always @(negedge clock or posedge clear) begin
    if(clear)
        q = 4'd0;
    else 
        q = (q+1) % 16;
end

endmodule