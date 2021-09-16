`timescale 1ps/1ps
`include "mux2x1.v"

module mux2x1_tb();
    
    reg i0,i1,s;
    wire out;

    mux2x1 uut(out,s,i0,i1);

    initial begin
        $dumpfile("Mux.vcd");
        $dumpvars(0,mux2x1_tb);
        $monitor($time,"\tout=%b\ts=%b\ti0=%b\ti1=%b",out,s,i0,i1);

        i0 = 1'b1; i1=1'b1;
        s = 1'b0;
        #10 s = 1'b1;

        #10 i0 = 1'b0; i1=1'b1;
        s = 1'b0;
        #10 s = 1'b1;
        
        #10 i0 = 1'b1; i1=1'b0;
        s = 1'b0;
        #10 s = 1'b1;
        #10 $finish;
    end

endmodule