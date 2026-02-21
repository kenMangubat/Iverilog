module example4(x,y,z,F);
	
	input x,y,z;
	output F;
	wire [1:6]T;
	
	not G1(T[1],y), G2 (T[2],x), G3(T[3],z);
	nor G4(T[4],x,T[1]);
	and G6(T[5],T[2],T[3],y), G5(T[6],T[4],z);
	or G7(F,T[6],T[5]);
	
	endmodule
	
	module example4Generator(x,y,z);
	output x,y,z;
	reg x,y,z;
	
	
	initial
	begin
	x=0;	y=0;	z=0; #3;
	x=0;	y=0;	z=1; #3;
	x=0;	y=1;	z=0; #3;
	x=0;	y=1;	z=1; #3;
	x=1;	y=0;	z=0; #3;
	x=1;	y=0;	z=1; #3;
	x=1;	y=1;	z=0; #3;
	x=1;	y=1;	z=1; #3;
	
	end
	endmodule
	
	module example4TestBench;
	wire x,y,z;
	wire F;
	
	example4Generator GEN(x,y,z);
	example4 DUT(x,y,z,F);
	
	
	initial
	begin 
	
	$dumpfile("example4.vcd");
	$dumpvars (0,example4TestBench);
	
	#20;
	$finish;
	
	
	end
	endmodule
	