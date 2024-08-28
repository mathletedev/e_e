`timescale 1ns/1ps
module main(
	input [0:0] sw,
	input [2:0] btn,
	output [2:0] RGB_led_A
);

assign RGB_led_A = btn & (sw ? 3'b111 : 3'b000);

endmodule
