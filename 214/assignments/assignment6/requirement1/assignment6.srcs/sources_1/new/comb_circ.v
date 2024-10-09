`timescale 1ns / 1ps
module comb_circ(
	input A,
	input B,
	input C,
	output X
);

wire N1, N2, N3;

assign #5 N1 = A & B;
assign #5 N2 = ~B;
assign #5 N3 = N2 & C;
assign #5 X = N1 | N3;

endmodule
