`timescale 1ps/1ps
`include "fullAdder.v"

module fullAdder_tb();

reg [3:0]a,b;
reg cin;
wire cout;
wire [3:0]sum;

fullAdder uut(cout,sum,a,b,cin);

initial begin
    $dumpfile("fullAdder.vcd");
    $dumpvars(0,fullAdder_tb);

    $monitor($time,"\tCin=%b,A=%b,B=%b,SUM=%b,Cout=%b",cin,a,b,sum,cout);

    //carry in = 1
    cin = 1;
    a=4'd3; b=4'd4;
    #10 a=4'd2; b=4'd5;
    #10 a=4'd9; b=4'd9;
    #10 a=4'd10; b=4'd15;

    //Carry In = 0
    #5 cin = 0;
    #10 a=4'd3; b=4'd4;
    #10 a=4'd2; b=4'd5;
    #10 a=4'd9; b=4'd9;
    #10 a=4'd10; b=4'd15;

end

endmodule