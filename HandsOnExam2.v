module HalfAdder (A,B,C);
input [1:0] A,B;
output [3:0] C;

and G1(C,x,y);
xor G2(S,x,y);

endmodule

module multiplier(A,B,C);
input [1:0] A,B;
output [3:0] C;
wire w1,w2,w3,w4;

HalfAdder ha1(w2,w3,C[1],w4); 
and G1 (C[0],B[0],A[0]),
    G2 (w1,A[0],B[1]),
	G3 (w2,A[1],B[0]),
    G4 (w3,B[1],A[1]);      
HalfAdder ha2(w3,w4,C[2],C[3],C[2]);

endmodule	

module multiplierSimulator (A,B);
output [1:0] A,B;
reg [1:0] A,B;
initial
begin

    $dumpfile ("multiplier.vcd");
		 $dumpvars;

	  A=2'b00;B=2'b00;#4
	  A=2'b00;B=2'b01;#4
	  A=2'b00;B=2'b10;#4
	  A=2'b00;B=2'b11;#4
	  A=2'b01;B=2'b00;#4
	  A=2'b01;B=2'b01;#4
	  A=2'b01;B=2'b10;#4
	  A=2'b01;B=2'b11;#4
	  A=2'b10;B=2'b00;#4
	  A=2'b10;B=2'b01;#4
	  A=2'b10;B=2'b10;#4
	  A=2'b10;B=2'b11;#4
	  A=2'b11;B=2'b00;#4
	  A=2'b11;B=2'b01;#4
	  A=2'b11;B=2'b10;#4
	  A=2'b11;B=2'b11;#4	 
		 
	$finish;
	end
    endmodule
	
	module multiplierTestBench;
	wire [3:0]A,B;
	wire [15:0]C;
	
	multiplier m1 (A,B,C);
    multiplierSimulator m2 (A,B);
	
	endmodule
	