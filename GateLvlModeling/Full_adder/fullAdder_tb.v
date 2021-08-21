// Full adder test bench
`timescale 1ns/1ns
`include "Full_adder.v"

module fullAdder_tb;

reg a,b,c_in;
wire sum,c_out;

full_adder uut(sum,c_out,a,b,c_in);

initial begin
    $monitor($time,"Test Bench :A=%b , B=%b , CarryIN=%b , Sum=%b ,CarryOUT=%b",a,b,c_in,sum,c_out);
end

initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars(0,fullAdder_tb);

    a = 1'b0; b = 1'b0; c_in = 1'b0;
    #5 a = 1'b0; b = 1'b0; c_in = 1'b1;
    #5 a = 1'b0; b = 1'b1; c_in = 1'b0;
    #5 a = 1'b0; b = 1'b1; c_in = 1'b1;
    #5 a = 1'b1; b = 1'b0; c_in = 1'b0;
    #5 a = 1'b1; b = 1'b0; c_in = 1'b1;
    #5 a = 1'b1; b = 1'b1; c_in = 1'b0;
    #5 a = 1'b1; b = 1'b1; c_in = 1'b1;

    #5 $display($time,"Test complete");

end

endmodule