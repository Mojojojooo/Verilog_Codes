module Mux4x1(
    out,s1,s0,i0,i1,i2,i3
);
    input s1,s0,i0,i1,i2,i3;
    output out;

    assign out = s1 ? (s0 ?i3 : i2):(s0 ? i1: i0);

endmodule