`timescale 1ns / 1ps

module sr_latch_tb;
	reg S, R;
	wire Q, Qn, nor_Q, nor_Qn;

	sr_latch sr_latch (.S(S), .R(R), .Q(Q), .Qn(Qn));
	nor_sr_latch nor_sr_latch (.S(S), .R(R), .Q(nor_Q), .Qn(nor_Qn));

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
