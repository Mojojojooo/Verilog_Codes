`timescale 1ps/1ps
`include "counter.v"

module counter_tb();

reg clock,clear;
wire [3:0]q;

counter uut(q,clock,clear);

initial begin
    $dumpfile("Counter.vcd");
    $dumpvars(0,counter_tb);
    $monitor($time,"\tCount=%b\tClock=%b\tclear=%b",q,clock,clear);

    clear = 1'b1;
    #10 clear =1'b0; 
    #80 clear =1'b1; 
    #20 clear =1'b0;
end

initial begin
    clock = 1'b0;
    forever #10 clock=~clock;
end

initial begin
     #200 $finish;
end

endmodule