module example1 (a,b,c,q);

	input a,b,c;

	output q;
		
	wire [1:4] T;

	and G1(T[1],a,b), G3(T[3],b,c),G4(T[4],T[2],T[3]);

	or G2(T[2],b,c), G5(q,T[1],T[4]);
				
	endmodule

	module example1Generator(a,b,c);
	output a,b,c;
	reg a,b,c;

	initial 
	begin
		$dumpfile("example1.vcd");
		$dumpvars(0,example1TestBench);
		
		a=0;	b=0;	c=0;	#3
		a=1;	b=0;	c=1;	#3
		a=1;	b=1;	c=0;	#3
		a=0;	b=1;	c=1;	#3
		
		$finish;
	end
	endmodule
	
module example1TestBench;

    wire a,b,c;   // From Generator
    wire q;       // From example1

    // Connect Generator
    example1Generator GEN(a,b,c);

    // Connect Main Circuit (DUT)
    example1 DUT(a,b,c,q);

    initial
    begin
        $dumpfile("example1.vcd");
        $dumpvars(0, example1TestBench);
    end

endmodule
