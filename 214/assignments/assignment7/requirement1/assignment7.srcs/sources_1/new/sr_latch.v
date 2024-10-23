`timescale 1ns / 1ps

module sr_latch(
	input S,
	input R,
	output Q,
	output Qn
);
	wire Q_gate, Qn_gate;

	assign #1 Q_gate = ~(S & Qn_gate);
	assign #1 Qn_gate = ~(R & Q_gate);

	assign Q = Q_gate;
	assign Qn = Qn_gate;
endmodule
