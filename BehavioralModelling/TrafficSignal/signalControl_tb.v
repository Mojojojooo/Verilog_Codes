`timescale 1ps/1ps
`include "signalControl.v"

module signalControl_tb();

wire [1:0] main, cntry;
reg flag;
reg clock, clear;

signalControl uut(main,cntry,flag,clock,clear);

initial begin
    $dumpfile("Traffic.vcd");
    $dumpvars(0,signalControl_tb);
    $monitor($time,"\t Main=%b Contry =%b flag=%b",main,cntry,flag);
end

    initial begin
        clock = `FALSE;
        forever #10 clock = ~clock;
    end

    initial begin
        clear = `TRUE;
        repeat (5) @(negedge clock);
        clear = `FALSE;
    end

    initial begin
        flag = `FALSE;

        #200 flag = `TRUE;
        #100 flag = `FALSE;

        #200 flag = `TRUE;
        #100 flag = `FALSE;

        #200 flag = `TRUE;
        #100 flag = `FALSE;

        #100 $finish;

    end
endmodule