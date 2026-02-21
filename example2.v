module example2 (A,B,C);

input A,B;
output C;

wire [1:4] T;

not G1 (T[1],A), G2 (T[2],B);
and G3 (T[4],T[1],B), G4 (T[3],A,T[2]);
or G5 (C,T[4],T[3]);

endmodule

module example2Generator(A,B);
output A,B;
reg A,B;

initial 
begin
	
	A=0;	B=0;	#3;
	A=0;	B=1;	#3;
	A=1;	B=0;	#3;
	A=1;	B=1;	#3;
	

	
	end
	endmodule
	
	
module example2TestBench;

	wire A,B;
	wire C;
	
	example2Generator GEN(A,B);
	example2 DUT(A,B,C);
	
	initial
	begin
	$dumpfile ("example2.vcd");
	$dumpvars (0,example2TestBench);
	
	#20;
	$finish;
	end
	endmodule