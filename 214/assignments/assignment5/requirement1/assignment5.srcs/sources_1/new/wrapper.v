`timescale 1ns / 1ps

module wrapper (
	input clk,
	input [7:0] sw,
	output red_led,
	output [7:0] led
);

wire [2:0] count;
wire sdata;

counter middle_counter (
	.C(clk),
	.B(count)
);

mux input_mux (
	.I(sw),
	.S(count),
	.Y(sdata)
);

demux output_demux (
	.EN(sdata),
	.I(count),
	.Y(led)
);

assign red_led = sdata;

endmodule
