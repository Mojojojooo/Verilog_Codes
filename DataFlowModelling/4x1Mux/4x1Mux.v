module Mux4x1(
    out,s1,s0,i0,i1,i2,i3
);
    input s1,s0,i0,i1,i2,i3;
    output out;

    assign out = (~s0 & ~s1 & i0)| (s0 & ~s1 & i1) |(~s0 & s1 & i2)|(s0 & s1 & i3);

endmodule