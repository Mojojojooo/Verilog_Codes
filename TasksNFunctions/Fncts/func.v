module func(
    max,a,b
);

parameter delay =10;
input a,b;
output max;
reg max;

always @(a or b) begin
    bitwise_op(max,a,b);
end

task bitwise_op;
    output max;
    input A,B;
    begin
        max = (A > B)? A : B;
    end
endtask

endmodule