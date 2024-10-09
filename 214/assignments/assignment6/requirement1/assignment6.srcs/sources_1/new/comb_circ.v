`timescale 1ns / 1ps
module comb_circ(
	input A,
	input B,
	input C,
	output X
);

wire N1, N2, N3;

assign #1 N1 = A & B;
assign #1 N2 = ~B;
assign #1 N3 = N2 & C;
assign #1 X = N1 | N3;

endmodule
