`timescale 1ns / 1ps

module sr_latch_tb;
	reg S, R;
	wire Q, Qn;

	sr_latch sr_latch (.S(S), .R(R), .Q(Q), .Qn(Qn));

	initial begin
		S = 1;
		R = 1;

		#100 S = 0;
		#100 S = 1;
		#100 R = 0;
		#100 R = 1;
		#100 S = 0; R = 0;
		#100 S = 1; R = 1;
		#100 S = 0; R = 0;
		#100 ;
	end
endmodule
