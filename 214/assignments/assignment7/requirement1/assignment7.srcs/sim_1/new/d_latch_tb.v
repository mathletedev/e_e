`timescale 1ns / 1ps

module d_latch_tb;
	reg D, G;
	wire Q, Qn;

	d_latch dl (.D(D), .G(G), .Q(Q), .Qn(Qn));

	initial begin
		D = 1;
		G = 1;

		#1 D = 0; G = 0;
		#10 D = 1; G = 1;
		#1 D = 0;
		#1 G = 0;
		#10 ;
	end
endmodule
