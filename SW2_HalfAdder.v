module SW2_HalfAdder(x, y, sum, carry);
    input x, y;
    output sum, carry;
    
    xor G1(sum, x, y);
    and G2(carry, x, y);

endmodule


module SW2_HalfAdderGenerator(x, y);
    output x, y;
    reg x, y;
    
    initial
    begin
        $dumpfile("SW2_HalfAdder.vcd");
        $dumpvars(0, SW2_HalfAdderTestBench);
        
        x = 0; y = 0; #3;
        x = 0; y = 1; #3;
        x = 1; y = 0; #3;
        x = 1; y = 1; #3;
        
        $finish;
    end
endmodule


module SW2_HalfAdderTestBench;
    wire wx, wy, wSum, wCarry;
    
    SW2_HalfAdder ha1(
        .x(wx),
        .y(wy),
        .sum(wSum),
        .carry(wCarry)
    );
    
    SW2_HalfAdderGenerator hag1(
        .x(wx),
        .y(wy)
    );

endmodule
