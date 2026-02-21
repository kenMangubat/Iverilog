
module Basic_Concept2 (a, b, c, f1, f2);

    input a, b, c;
    output f1, f2;

    wire t1, t2, t3;
    wire t4, t5, t6, t7;

   
    and G1 (t2, a, b, c);     
    or  G2 (t1, a, b, c);      

    
    and G3 (t5, a, b);        
    and G4 (t6, a, c);        
    and G5 (t7, b, c);         
    or  G6 (f2, t5, t6, t7);   

    
    not G7 (t4, f2);          
    and G8 (t3, t1, t4);       

    
    or  G9 (f1, t2, t3);     

endmodule



module BasicGenerator (a, b, c);

    output a, b, c;
    reg a, b, c;

    initial begin
        a=0; b=0; c=0; #3;
        a=0; b=0; c=1; #3;
        a=0; b=1; c=0; #3;
        a=0; b=1; c=1; #3;
        a=1; b=0; c=0; #3;
        a=1; b=0; c=1; #3;
        a=1; b=1; c=0; #3;
        a=1; b=1; c=1; #3;
    end

endmodule



module Basic_Concept2TestBench;

    wire a, b, c;
    wire f1, f2;

    BasicGenerator GEN (a, b, c);
    Basic_Concept2  DUT (a, b, c, f1, f2);

    initial begin
        $dumpfile("Basic_Concept2.vcd");
        $dumpvars(0, Basic_Concept2TestBench);
        #30 $finish;
    end

endmodule
