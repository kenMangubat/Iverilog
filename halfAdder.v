module halfAdder(x, y, sum, carry);
	input x, y;
	output sum, carry;
	
	xor G1(sum, x, y);
	and G2(carry, x, y);

endmodule

module halfAdderGenerator(x,y);
	output x,y;
	reg x,y;
	
	initial
	begin
		$dumpfile("halfAdder.vcd");
		$dumpvars;
		x=0; y=0; #3;
		x=0; y=1; #3;
		x=1; y=0; #3;
		x=1; y=1; #3;
		
		$finish;
	end
endmodule

module halfAdderTestBench;
	wire wx, wy, wSum, wCarry;
	
	halfAdder ha1(.x(wx),.y(wy),.sum(wSum),.carry(wCarry));
	halfAdderGenerator hag1(.x(wx),.y(wy));
	
endmodule
