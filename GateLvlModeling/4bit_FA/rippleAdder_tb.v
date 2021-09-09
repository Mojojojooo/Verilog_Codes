`timescale 1ns/1ns
`include "rippleAdder.v"

module rippleAdder_tb();

reg [3:0]a,b;
// reg [3:0]b;
wire cout;
wire [3:0]out;
reg cin;

rippleAdder uut(out,cout,a,b,cin);

initial begin
    $dumpfile("RippleAdder.vcd");
    $dumpvars(0,rippleAdder_tb);
    $monitor($time,"\tCarryIn=%b\tA=%b\tB=%b\tOutput=%b\tCarry=%b",cin,a,b,out,cout);

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