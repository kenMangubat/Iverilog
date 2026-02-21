module HalfAdder(x,y,C,S);
     input x,y;
	 output C,S;
	 
	 and G1(C,x,y);
	 xor G2(S,x,y);
endmodule	 

	 module FullAdder2(x,y,z,C,S);
     input x,y,z;
	 output C,S;
	 
	 wire [2:0] w;
	 
	 HalfAdder ha1(x,y,w[1],w[0]);
	 HalfAdder ha2(w[0],z,w[2],S);
	 or G3C(C,w[1],w[2]);
	 	 
endmodule
 module FullAdderSimulator(x,y,z);
	   output x,y,z;
	   reg x,y,z;
	   
	   initial 
	   begin
	     $dumpfile ("FullAdder2.vcd");
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
		 
    module FullAdder2TestBench;
	
	wire x,y,z;
	FullAdder2 fa2(x,y,z,C,S);
	FullAdderSimulator fas2(x,y,z);
	endmodule