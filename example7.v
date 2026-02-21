module example7(a,b,c,d,e,f,Y1,Y2);

	input a,b,c,d,e,f;
	output Y1,Y2;
	
	wire [1:3] T;
	
	not G1(T[1],b), G5(Y2,T[3]);
	or G2(T[2],c,d,e);
	nor G3(Y,a,T[2]);
	nand G4(T[3],T[1],T[2],f);
	
	endmodule
	
module example7Generator (a,b,c,d,e,f);

	output a,b,c,d,e,f;
	reg a,b,c,d,e,f;
	
	initial 
	begin
		$dumpfile("example7.vcd");
		$dumpvars;
		
		
		a=0; b=0; c=0; d=0; e=0; f=0; #10;
        a=0; b=0; c=0; d=0; e=0; f=1; #10;
        a=0; b=0; c=0; d=0; e=1; f=0; #10;
        a=0; b=0; c=0; d=0; e=1; f=1; #10;
        a=0; b=0; c=0; d=1; e=0; f=0; #10;
        a=0; b=0; c=0; d=1; e=0; f=1; #10;
        a=0; b=0; c=0; d=1; e=1; f=0; #10;
        a=0; b=0; c=0; d=1; e=1; f=1; #10;
        a=0; b=0; c=1; d=0; e=0; f=0; #10;
        a=0; b=0; c=1; d=0; e=0; f=1; #10;
        a=0; b=1; c=1; d=0; e=1; f=1; #10;
        a=1; b=0; c=1; d=1; e=0; f=1; #10;
		
		$finish;
		
		end
		endmodule
		
		
module example7TestBench;
	
	wire a,b,c,d,e,f;
	wire Y1,Y2;
	
	example7Generator GEN (a,b,c,d,e,f);
	example7 DUT (a,b,c,d,e,f,Y1,Y2);
	
	
endmodule