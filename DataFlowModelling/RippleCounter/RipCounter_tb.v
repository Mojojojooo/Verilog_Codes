`timescale 1ps/1ps
`include "RipCounter.v"

module ripcounter_tb();

reg clear,clock;
wire [3:0]out;

Ripplecounter uut(out, clock, clear);

initial begin
    $dumpfile("RippleCounter.vcd");
    $dumpvars(0,ripcounter_tb);
    $monitor($time,"\tOut:%b,\tClear:%b\t",out,clear);
    // $display($time,"\tOut:%b,\tClock:%b,\tClear:%b\t",out,clock,clear);
    clear = 1'b1;
    #34 clear = 1'b0;
    #200 clear = 1'b1;
    #50 clear = 1'b0;
end

initial begin
    clock = 1'b0;
    forever #10 clock = ~clock;
end

initial begin
    #400 $finish;
end

endmodule