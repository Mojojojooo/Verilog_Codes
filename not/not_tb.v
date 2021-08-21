`timescale 1ns/1ns
`include "not.v"

module not_tb;

reg a;
wire b;

name uut(a,b);

initial begin
    $dumpfile("not.vcd");
    $dumpvars(0,not_tb);

    a = 0;
    #20;

    a=1;
    #20;

    a=0;
    #20; 

    $display("Test complete");
end
endmodule