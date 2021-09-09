module carryLookAhead(
    cout,sum,a,b,cin
);

input [3:0]a,b;
input cin;
output [3:0]sum;
output cout;

wire [3:0]p;
wire [3:0]g;
wire c1,c2,c3,c4;

//Propagation value = P(i) = A(i) (+) B(i)
assign p[0] = a[0] ^ b[0],p[1] = a[1] ^ b[1],p[2] = a[2] ^ b[2],p[3] = a[3] ^ b[3];

//Generation value = G(i) = A(i).B(i)
assign g[0] = a[0] & b[0],g[1] = a[1] & b[1],g[2] = a[2] & b[2],g[3] = a[3] & b[3];

//Look ahead values

assign c1 = (g[0] | (p[0] & cin)),c2 = (g[1] | (p[1] & (g[0] | (p[0] & cin)))), c3 = (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))), c4 = (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin))))))));


//Sum value = S(i) = P(i) (+) C(i-1)
assign sum[0] = p[0] ^ cin,sum[1] = p[1] ^ c1,sum[2] = p[2] ^ c2,sum[3] = p[3] ^ c3;

//Carry 
assign cout = c4;


    
endmodule