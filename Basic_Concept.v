
module Basic_Concept(a, b, c, d, e, f, y1, y2);

    input  a, b, c, d, e, f;
    output y1, y2;

   
    wire [0:2] w;

    
    not G1(w[0], b);

   
    or  G2(w[1], c, d, e);

   
    xor G3(y1, a, w[1]);

    
    nand G4(w[2], w[1], w[0], f);

    
    not G5(y2, w[2]);

endmodule



module Basic_Concept_Simulator(a, b, c, d, e, f);

    output a, b, c, d, e, f;
    reg    a, b, c, d, e, f;

    initial
    begin
        
        $dumpfile("Basic_Concept.vcd");
        $dumpvars(0, Basic_Concept_testBench);

        
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



module Basic_Concept_testBench;

    wire a, b, c, d, e, f;
    wire y1, y2;

    
    Basic_Concept bc1(
        a, b, c, d, e, f,
        y1, y2
    );

    
    Basic_Concept_Simulator bcs1(
        a, b, c, d, e, f
    );

endmodule
