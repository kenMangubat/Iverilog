module HalfSub(a,b,diff,bo);
input a,b;
output diff,bo;
wire w1;

xor G1(diff,b,a);
not G2(w1,a);
and G3(bo,w1,b);

endmodule

module FullSubv2(a,b,bin,d,bo);
input a,b,bin;
output d,bo;
wire [2:0]w;

HalfSub hs1(a,b,w[0],w[1]);
HalfSub hs2(w[0],bin,d,w[2]);
or G1(bo,w[2],w[1]);
endmodule
module FullSubv2Simulator(a,b,bin);

output a,b,bin;
reg a,b,bin;

    initial
	begin
	    $dumpfile("FullSubv2.vcd");
		$dumpvars;
		
		a=0; b=0; bin=0; #3
		a=0; b=0; bin=1; #3
		a=0; b=1; bin=0; #3
		a=0; b=1; bin=1; #3
		a=1; b=0; bin=0; #3
		a=1; b=0; bin=1; #3
		a=1; b=1; bin=0; #3
		a=1; b=1; bin=1; #3
		$finish;
	end
endmodule

module FullSubv2Testbench;
wire a,b,bin;
FullSubv2 fs1(a,b,bin,d,bo);
FullSubv2Simulator fs2(a,b,bin);
endmodule	