module FullSubtractor(x,y,z,B,D);
	input x,y,z;
	output B,D;
	wire w1,w2,w3,w4,w5;
	
	xor G1(w1,x,y), G6(D,z,w1);
	not G2(w2,x), G4(w4,w1);
	and G3(w3,w2,y), G5(w5,w4,z);
	or G7(B,w5,w3);
	
endmodule

module FullSubtractorSimulator(x,y,z);
	output x,y,z;
	reg x,y,z;
	
	initial
	begin
		$dumpfile("FullSubtractor.vcd");
		$dumpvars;
		x=0; y=0; z=0; #3;
		x=0; y=0; z=1; #3;
		x=0; y=1; z=0; #3;
		x=0; y=1; z=1; #3;
		x=1; y=0; z=0; #3;
		x=1; y=0; z=1; #3;
		x=1; y=1; z=0; #3;
		x=1; y=1; z=1; #3;
		
		$finish;
	end
endmodule

module FullSubtractorTestBench;
	wire x,y,z;
	
	FullSubtractor hs1(x,y,z,B,D);
	FullSubtractorSimulator hss1(x,y,z);
endmodule
