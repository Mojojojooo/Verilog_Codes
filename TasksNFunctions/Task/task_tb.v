`timescale 1ps/1ps
`include "Task.v"

module taskk_tb(
);

reg a,b;
wire op_and,op_or,op_xor;

taskk uut(op_and,op_or,op_xor,a,b);

initial begin
    $dumpfile("Task.vcd");
    $dumpvars(0,taskk_tb);
    $monitor($time,"\tAND=%b\tOR=%b\tXOR=%b\tA=%b\tB=%b",op_and,op_or,op_xor,a,b);

    a = 1'b0 ; b = 1'b0;
    #10 a = 1'b0; b = 1'b1;
    #10 a = 1'b1; b = 1'b0;
    #10 a = 1'b1; b = 1'b1;
end

endmodule