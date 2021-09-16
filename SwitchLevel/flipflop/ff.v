`include "not.v"

module ff(
    q,qbar,d,clk
);
    input d,clk;
    output q,qbar;

    wire e;

    notgate n1(nclk,clk);

    cmos (e,d,clk,nclk);
    cmos (e,~qbar,nclk,clk);

    notgate n2(qbar,e);
    notgate n3(q,~e);



endmodule