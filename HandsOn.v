module HandsOn(A,B,C,D,w,x,y,z);

	input A,B,C,D;
	output w,x,y,z;
	wire w1,w2,w3,w4,w5,N_1,N_2;
	
	not G1(z,D);
	and G2(w1,C,D);
	or G3(w2,C,D);
	not G4(N_2,B);
	not G5(N_1,w2);
	or G6(y,w1,N_1);
	and G7(w3,N_1,B);
	and G8(w4,w2,N_2);
	and G9(w5,w2,B);
	or G10(x,w3,w4);
	or G11(w,w5,A);
	
endmodule

module HandsOnSimulator(A,B,C,D);

	output A,B,C,D;
	reg A,B,C,D;
	
	initial
	begin
		$dumpfile("HandsOn.vcd");
		$dumpvars;
		
		A=0; B=0; C=0; D=0; #4
		A=0; B=0; C=0; D=1; #4
		A=0; B=0; C=1; D=0; #4
		A=0; B=0; C=1; D=1; #4
		A=0; B=1; C=0; D=0; #4
		A=0; B=1; C=0; D=1; #4
		A=0; B=1; C=1; D=0; #4
		A=0; B=1; C=1; D=1; #4
		A=1; B=0; C=0; D=0; #4
		A=1; B=0; C=0; D=1; #4
		$finish;
	end
endmodule
	
module HandsOnTestBench;
	wire A,B,C,D;
	HandsOn ho1(A,B,C,D,w,x,y,z);
	HandsOnSimulator ho2(A,B,C,D);
	
endmodule
