`timescale 1ns/1ns
`include "4x1mux.v"

module mux4x1_tb;

reg i0,i1,i2,i3,s0,s1;
wire out;

mux4x1 uut(out,i0,i1,i2,i3,s0,s1);

initial begin
    $dumpfile("4x1mux.vcd");
    $dumpvars(0,mux4x1_tb);
    $monitor($time,"\tOutput=%b\tS1=%b\tS0=%b",out,s1,s0);

    i0 = 1; i1= 0; i2= 1; i3= 0;
    $display("I0=%b\tI1=%b\tI2=%b\tI3=%b",i0,i1,i2,i3);
    s0 = 0 ; s1=0;
    
    #5 s0 = 1 ; s1=0;

    #5 s0 = 0 ; s1=1;

    #5 s0 = 1 ; s1=1;

end


endmodule