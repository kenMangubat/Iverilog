module FullAdder(x,y,z,C,S);
     input x,y,z;
	 output C,S;
	 wire [3:0] w;
	 
	 xor G1(w[0],x,y), G2(S,w[0],z);
	 and G4(w[1],x,y),G5(w[2],x,z), G6(w[3],y,z);
	 or G7(C,w[1],w[2],w[3]);
	 
	 endmodule
	 
	 module FullAdderSimulator(x,y,z);
	   output x,y,z;
	   reg x,y,z;
	   
	   initial 
	   begin
	     $dumpfile ("FullAdder.vcd");
		 $dumpvars;
		 
		  x=0; y=0; z=0; #2;
	      x=0; y=0; z=1; #2;
		  x=0; y=1; z=0; #2;
		  x=0; y=1; z=1; #2;
		  x=1; y=0; z=0; #2;
		  x=1; y=0; z=1; #2;
		  x=1; y=1; z=0; #2;
		  x=1; y=1; z=1; #2;
	 	  
	     
		 $finish;
		 end
		 endmodule
		 
    module FullAdderTestBench;
	
	wire x,y,z;
	FullAdder fa1(x,y,z,C,S);
	FullAdderSimulator fas1(x,y,z);
	endmodule
	