`timescale 1ps/1ps
`include "ff.v"

module ff_tb();
    
    reg d,clk;
    wire q,qbar;

    ff uut(q,qbar,d,clk);

    initial begin
        $dumpfile("ff.vcd");
        $dumpvars(0,ff_tb);
        $monitor($time,"\tq=%b\tqb=%b\td=%b\tclk=%b",q,qbar,d,clk);

        d = 1'b1;
        forever #20 d = ~d;
    end
    
    initial begin
        clk = 1'b0;
        forever #10 clk = ~clk;
    end

    initial begin
        #100 $finish;
    end

endmodule