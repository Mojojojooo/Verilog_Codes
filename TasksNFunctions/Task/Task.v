module taskk(
    op_and,op_or,op_xor,a,b
);

parameter delay =10;
input a,b;
output op_and,op_or,op_xor;
reg op_and,op_or,op_xor;

always @(a or b) begin
    bitwise_op(op_and,op_or,op_xor,a,b);
end

task bitwise_op;
    output Op_and,Op_or,Op_xor;
    input A,B;
    begin
        Op_and = A & B;
        Op_or = A | B;
        Op_xor = A ^ B;
    end
endtask

endmodule