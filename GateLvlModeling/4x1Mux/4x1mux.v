// Code for 4x1 mux
/*
MUX:
4 inputs= i0,i1,i2,i3;
2 selections= s0,s1;
S1 | S0 | Output
0    0      i0
0    1      i1
1    0      i2
1    1      i3
*/

module mux4x1(out,i0,i1,i2,i3,s0,s1);

input i0,i1,i2,i3,s0,s1;
output  out;

wire a0,a1,a2,a3;
wire s1n,s0n;

not(s0n,s0);
not(s1n,s1);
and(a0,i0,s1n,s0n);
and(a1,i1,s1n,s0);
and(a2,i2,s1,s0n);
and(a3,i3,s1,s0);
or(out,a0,a1,a2,a3);

endmodule