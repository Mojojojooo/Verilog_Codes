
module mux2x1 (
    out,s,i0,i1
);
    input s,i0,i1;
    output out;

    wire sbar;
    supply1 vcc;
    supply0 gnd;

    //Not
    pmos(sbar,vcc,s);
    nmos(sbar,gnd,s);
    
    //cmos (out,data,nmosControl,pmosControl);
    cmos (out,i0,sbar,s);
    cmos (out,i1,s,sbar);

endmodule