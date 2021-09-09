module dff(
    q,qb,d,clock,clear
);

output q,qb;
input d,clock,clear;

wire s,sb,r,rb,cb;

assign cb = ~clear;

assign sb = ~(rb & s),s= ~(sb & cb & ~clock),r= ~(rb & ~clock & s),rb= ~(r & cb & d);

assign q = ~(s & qb), qb = ~(q & r & cb);


endmodule