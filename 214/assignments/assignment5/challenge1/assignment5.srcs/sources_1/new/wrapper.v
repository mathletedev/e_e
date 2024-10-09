`timescale 1ns / 1ps

module wrapper(
	input clk,
	input [7:0] sw,
	output [3:0] seg_an,
	output [6:0] seg_cat
);

wire select;
wire [3:0] mux_out;
wire [6:0] bin2seg_out;

counter counter(
	.C(clk),
	.B(select)
);

mux mux(
	.X(sw),
	.S(select),
	.Y(mux_out)
);

bin2seg bin2seg(
	.X(mux_out),
	.Y(bin2seg_out)
);

assign seg_an = 4'b1100 | 1 << ~select;
assign seg_cat = bin2seg_out;

endmodule
