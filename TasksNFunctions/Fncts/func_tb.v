`timescale 1ps/1ps
`include "func.v"

module func_tb(
);

reg a,b;
wire max;

func uut(max,a,b);

initial begin
    $dumpfile("func.vcd");
    $dumpvars(0,func_tb);
    $monitor($time,"\tMAX=%b\tA=%b\tB=%b",max,a,b);

    a = 1'b0 ; b = 1'b0;
    #10 a = 1'b0; b = 1'b1;
    #10 a = 1'b1; b = 1'b0;
    #10 a = 1'b1; b = 1'b1;
end

endmodule