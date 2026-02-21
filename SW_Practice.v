module SW_Practice(A0, B0, C0, C1, S0);
    input A0, B0, C0;
    output C1, S0;
    wire [1:7] N;
    
    not  G3(N[3], C0), 
         G6(N[7], N[1]), 
         G7(N[4], N[3]);
         
    nand G1(N[2], A0, B0);
    
    nor  G2(N[1], A0, B0), 
         G8(C1, N[1], N[6]);
         
    and  G4(N[6], N[2], N[3]), 
         G5(N[5], N[2], N[7]);
         
    xor  G9(S0, N[5], N[4]);
endmodule


module SW_PracticeGenerator(A0, B0, C0);
    output A0, B0, C0;
    reg A0, B0, C0;
    
    initial
    begin
        $dumpfile("SW_Practice.vcd");
        $dumpvars(0, SW_PracticeTestBench);
        
        A0 = 0; B0 = 0; C0 = 0; #3
        A0 = 1; B0 = 0; C0 = 1; #3
        A0 = 1; B0 = 1; C0 = 0; #3
        A0 = 0; B0 = 1; C0 = 1; #3
        
        $finish;
    end
endmodule 


module SW_PracticeTestBench;
    wire wA, wB, wC, wC1, wS0;
    
    SW_Practice sc1(
        .A0(wA),
        .B0(wB),
        .C0(wC),
        .C1(wC1),
        .S0(wS0)
    );
    
    SW_PracticeGenerator scg1(
        .A0(wA),
        .B0(wB),
        .C0(wC)
    );

endmodule
