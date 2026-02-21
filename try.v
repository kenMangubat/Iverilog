module try (B,A,C,X,Y);

input A,B,C;
output X,Y;
wire [1:7] N;


nand G1(N[1],B,A);

nor G2(N[2],A,B),
	G8(X,N[2],N[7]);
	
not G3 (N[3],C),
	G4 (N[5],N[3]),
	G5 (N[4],N[2]);
	
	
and	G6(N[6],N[1],N[4]),
	G7 (N[7],N[3],N[1]);
	
xor G9 (Y,N[6],N[5]),
	
endmodule

