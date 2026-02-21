module HandsOnExam(a,b,c,f1,f2);
   
   input a,b,c;
   output f1,f2;
   wire t1,t2,t3,t4,t5,t6,t7;
   
   or G1(t1,a,b,c);
   and G2(t2,a,b,c);
   and G3(t3,t3,t1,t7);
   and G4(t4,a,b);
   and G5(t5,a,c);
   and G6(t6,b,c);
   or G7(f2,t4,t5,t6);
   not G8(t7,f2);
   or G9(f1,t2,t3);
   
   endmodule
   
   module HandsOnExamSimulator(a,b,c);
        output a,b,c;
		reg a,b,c;
		
		
		initial
		    begin
			$dumpfile("HandsOnExam.vcd");
            $dumpvars;

			a=0; b=0; c=0; #4
            a=0; b=0; c=1; #4
			a=0; b=1; c=0; #4
			a=0; b=1; c=1; #4
			a=1; b=0; c=0; #4
			a=1; b=0; c=1; #4
			a=1; b=1; c=0; #4
			a=1; b=1; c=1; #4
			
			
			$finish;
 
     end
   endmodule
   
   module HandsOnExamTestBench;
   
    wire t1,t2,t3,t4,t5,t6,t7;
	HandsOnExam sw1(a,b,c,f1,f2);
    HandsOnExamSimulator sws1(a,b,c);
	
	endmodule
	