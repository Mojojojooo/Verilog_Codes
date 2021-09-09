`timescale 1ps/1ps
`include "carryLookAhead.v"

module carryLookAhead_tb();

reg CIN;
reg [3:0]A,B;
wire COUT;
wire [3:0]SUM;

carryLookAhead uut(.cout (COUT),.sum (SUM),.a (A),.b (B),.cin (CIN));

initial begin
    $dumpfile("CarryLH.vcd");
    $dumpvars(0,carryLookAhead_tb);
    $monitor($time,"\tCin=%b,A=%b,B=%b,SUM=%b,Cout=%b",CIN,A,B,SUM,COUT);

    //carry in = 1
    CIN = 1;
    A=4'd3; B=4'd4;
    #10 A=4'd2; B=4'd5;
    #10 A=4'd9; B=4'd9;
    #10 A=4'd10; B=4'd15;

    //Carry In = A
    #5 CIN = 0;
    #10 A=4'd3; B=4'd4;
    #10 A=4'd2; B=4'd5;
    #10 A=4'd9; B=4'd9;
    #10 A=4'd10; B=4'd15;
end

endmodule