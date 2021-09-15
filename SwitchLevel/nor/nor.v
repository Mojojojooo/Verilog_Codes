module switchNor (
    out,a,b
);

input a,b;
output out;

wire c;

supply1 vcc; //source 
supply0 gnd; // ground

//pmos 
nmos (out,gnd,a);
nmos (out,gnd,b);

//nmos
pmos (c,vcc,a);
pmos (out,c,b);

endmodule