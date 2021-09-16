module notgate(out,in);
    
    input in;
    output out;

    supply1 vcc;
    supply0 gnd;

    pmos (out,vcc,in);
    nmos (out,gnd,in);

endmodule