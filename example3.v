module example3(X,Y,Z,A);

input X,Y,Z;
output A;

wire [1:7] T;

not G1(T[1],Y), G2(T[2],Z), G3 (T[4],X);
or G5 (T[6],Z, T[4]), G4(T[5],Y,Z), G6(T[7],T[1],T[2]);
and G7(A,T[7],T[5],T[6]);

endmodule

module example3Generator(X,Y,Z);
output X,Y,Z;
reg X,Y,Z;

initial
begin

	X=0;	Y=0;	Z=0;   	#3;
	X=1;	Y=0;	Z=1;	#3;
	X=1;	Y=1;	Z=0;	#3;
	X=0;	Y=1;	Z=1;	#3;
	
	end 
	endmodule
	
	
module example3TestBench;

wire X,Y,Z;
wire A;

	example3Generator GEN(X,Y,Z);
	example3 DUT(X,Y,Z,A);
	
	
	initial
	begin
	
		$dumpfile ("example3.vcd");
		$dumpvars (0,example3TestBench);
		
		
		#20;
		
		$finish;
		
		end
		endmodule
	