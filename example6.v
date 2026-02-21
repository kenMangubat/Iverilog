module example6 (A,B,Z);

	input A,B;
	output Z;
	wire [1:7] T;

	not G1(T[1],A), G2(T[2],B);
	and G3(T[3],T[1],B), G4(T[4],A,T[2]);
	or G5(Z,T[3],T[4]);

	endmodule


module example6Generator(A,B);
	
	output A,B;
	reg A,B;
	
	initial 
	begin
	
		$dumpfile("example6.vcd");
		$dumpvars;
		
		A=0;	B=0;	#3;
		A=0;	B=1;	#3;
		A=1;	B=0;	#3;
		A=1;	B=1;	#3;
		
		
		$finish;
		
		end
	endmodule
	
	
module example6TestBench;
	wire A,B;
	wire Z;
	
	example6Generator GEN(A,B);
	example6 DUT (A,B,Z);
	
	
	
	
	
	endmodule