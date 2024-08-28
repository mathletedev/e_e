`timescale 1ns/1ps
module led_sw(
	input [7:0] sw,
	input [3:0] btn,
	output [3:0] seg_an,
	output [7:0] seg_cat
);

assign seg_cat = ~sw;
assign seg_an = ~btn;

endmodule
