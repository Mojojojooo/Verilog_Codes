`include "tff.v"

module Ripplecounter(
    q,clock,clear
);

 output [3:0]q;
 input clock,clear;

tff t1(q[0],clock,clear);
tff t2(q[1],q[0],clear);
tff t3(q[2],q[1],clear);
tff t4(q[3],q[2],clear);

endmodule

// module tff(
//     q,clock,clear
// );

// input clock,clear;
// output q;

// dff ff1(q,,~q,clk,clear);

// endmodule

// module dff(
//     q,qb,d,clk,clear
// );

// output q,qb;
// input d,clk,clear;

// wire s,sb,r,rb,cb;

// assign cb = ~clear;

// assign sb = ~(rb & s), s= ~(sb & cb & ~clk),r= ~(rb & ~clk & s),rb= ~(r &cb & d);

// assign q = ~(s & qb), qb = ~(q & r & cb);


// endmodule