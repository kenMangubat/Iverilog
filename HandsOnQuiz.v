module HandsOnQuiz(a,b,c,d,z,y,x,w);
        
	 input a,b,c,d;
	 output z,y,x,w;
	 wire w1,w2,w3,w4,w5,w6,w7;
	 
	 and G1(w1,d,c);
	 or G2(w2,d,c);
	 not G3(w3,b);
	 or G4(y,w1,w7);
	 and G5(w4,w7,b);
	 and G6(w5,w2,w3);
	 and G7(w6,w2,b);
	 or G8(w,w4,w5);
	 or G9(w,w6,a);
	 not G10(x,d);
	 not G11(w7,w2);
	 
	 endmodule
	 
	 module HandsOnQuizSimulator(a,b,c,d);
	 
	    output a,b,c,d;
		reg a,b,c,d;
		
		initial
		begin
		   $dumpfile("HandsOnQuiz.vcd");
		   $dumpvars;
		   
		    a=0; b=0; c=0; d=0; #4
            a=0; b=0; c=0; d=1; #4
			a=0; b=0; c=1; d=0; #4
			a=0; b=0; c=1; d=1; #4
			a=0; b=1; c=0; d=0; #4
			a=0; b=1; c=0; d=1; #4
			a=0; b=1; c=1; d=0; #4
			a=0; b=1; c=1; d=1; #4
			a=0; b=0; c=0; d=0; #4
			a=1; b=0; c=0; d=1; #4
			
			$finish;
 
     end
	 endmodule
	 
	 module HandsOnQuizTestBench;
   
    wire w1,w2,w3,w4,w5,w6,w7;
	HandsOnQuiz pc1(a,b,c,d,z,y,x,w);
    HandsOnQuizSimulator pcs1(a,b,c,d);
	 
	 
	 endmodule
	 