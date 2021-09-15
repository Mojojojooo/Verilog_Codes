`timescale 1ps/1ps
`include "nor.v"

module nor_tb();

reg a,b;
wire out;

switchNor uut(out,a,b);

initial begin
    $dumpfile("nor.vcd");
    $dumpvars(0,nor_tb);
    $monitor($time,"\tOut=%b\tA=%b\tB=%b",out,a,b);

    a = 1'b0 ; b=1'b0;
    #10 a = 1'b0 ; b=1'b1;
    #10 a = 1'b1 ; b=1'b0;
    #10 a = 1'b1 ; b=1'b1;
    #5 $finish;
end
    
endmodule