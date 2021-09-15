module switchNand (
    out,a,b
);

input a,b;
output out;

wire c;

supply1 vcc; //source 
supply0 gnd; // ground

//pmos 
pmos (out,vcc,a);
pmos (out,vcc,b);

//nmos
nmos (c,gnd,a);
nmos (out,c,b);

endmodule