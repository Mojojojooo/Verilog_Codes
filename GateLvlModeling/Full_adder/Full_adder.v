// Code for full adder using gates
module full_adder(
    sum,c_out,a,b,c_in
);
input a,b,c_in;
output sum,c_out;

// intermediate values
wire s1; // sum value
wire c1,c2; // carry values
//Sum
xor(s1,a,b);
xor(sum,s1,c_in);
//Carry
and(c1,a,b);
and(c2,s1,c_in);
or(c_out,c2,c1);


endmodule