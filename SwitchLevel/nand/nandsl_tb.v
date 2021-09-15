`timescale 1ps/1ps
`include "nandsl.v"

module nand_tb();

reg a,b;
wire out;

switchNand uut(out,a,b);

initial begin
    $dumpfile("nand.vcd");
    $dumpvars(0,nand_tb);
    $monitor($time,"\tOut=%b\tA=%b\tB=%b",out,a,b);

    a = 1'b0 ; b=1'b0;
    #10 a = 1'b0 ; b=1'b1;
    #10 a = 1'b1 ; b=1'b0;
    #10 a = 1'b1 ; b=1'b1;
    #5 $finish;
end
    
endmodule