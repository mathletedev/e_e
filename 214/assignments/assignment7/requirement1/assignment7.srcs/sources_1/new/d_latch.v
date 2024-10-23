`timescale 1ns / 1ps

module d_latch(
	input D,
	input G,
	output Q,
	output Qn
);
	wire gate1, gate2, gate3;
	
	sr_latch sl(.S(gate1), .R(gate3), .Q(Q), .Qn(Qn));

	assign #1 gate1 = ~(D & G);
	assign #2 gate2 = ~D;
	assign #3 gate3 = ~(gate2 & G);
endmodule
