`timescale 1ns/1ns
`include "4x1Mux.v"

module mux4x1_tb(
);

reg s1,s0,i0,i1,i2,i3;
wire out;

mux4x1 uut(out,s1,s0,i0,i1,i2,i3);

initial begin
    $dumpfile("Mux4x1-data.vcd");
    $dumpvars(0,mux4x1_tb);
    $monitor($time,"\tOUT=%b\tS1=%b\tS2=%b",out,s1,s0);

    i0= 1; i1=1; i2=1; i3=1;

    $display($time,"\ti0=%b\ti1=%b\ti2=%b\ti3=%b",i0,i1,i2,i3);

    s0=1'b0 ; s1=1'b0 ;

    #10    s0=1'b1 ; s1=1'b0 ;

    #10    s0=1'b0 ; s1=1'b1 ;

    #10    s0=1'b1 ; s1=1'b1 ;

    #10 $finish;
end

    
endmodule