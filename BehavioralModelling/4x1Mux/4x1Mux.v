module mux4x1(out, s1,s0,i0,i1,i2,i3);

input s1,s0,i0,i1,i2,i3;
output out;
reg out;

always @(s1 or s0 or i0 or i1 or i2 or i3) begin
    case({s1,s0})
    2'b00: out = i0;
    2'b01: out = i1;
    2'b10: out = i2;
    2'b11: out = i3;
    default: out = 1'bx;
    endcase
end
endmodule 