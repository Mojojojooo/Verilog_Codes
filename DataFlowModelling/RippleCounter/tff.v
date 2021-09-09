`include "dff.v"
module tff(
    q,clock,clear
);

output q;
input clock,clear;

dff ff1(q, , ~q, clock, clear);

endmodule