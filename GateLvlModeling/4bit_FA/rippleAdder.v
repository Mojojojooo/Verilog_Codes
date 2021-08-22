// Riple carry adder: where the carry generated it sent to next block
// this code requires full adder module.

`include "../Full_adder/Full_adder.v"

module rippleAdder(out,cout,a,b,cin);

input [3:0]a,b;
// input [3:0]b;
output [3:0]out;
output cout;
input cin; // Initially set to 0 in TB;

wire c1,c2,c3;

//module full_adder(sum,c_out,a,b,c_in);
full_adder f0(out[0],c1,a[0],b[0],cin);
full_adder f1(out[1],c2,a[1],b[1],c1);
full_adder f2(out[2],c3,a[2],b[2],c2);
full_adder f3(out[3],cout,a[3],b[3],c3);

endmodule
