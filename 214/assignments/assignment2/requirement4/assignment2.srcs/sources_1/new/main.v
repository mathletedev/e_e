`timescale 1ns/1ps
module main(
	input [3:0] sw,
	output [1:0] RGB_led_A,
	output [0:0] RGB_led_B
);

// sw0 - coolant temperature
// sw1 - coolant low
// sw2 - oil temperature
// sw3 - oil low

assign RGB_led_A[0] =
	(sw[1] & ~sw[0] & ~sw[2] & ~sw[3]) |
	(sw[3] & ~sw[0] & ~sw[1] & ~sw[2]) |
	(sw[2] & ~sw[3]) |
	(sw[0] & sw[3]);

assign RGB_led_A[1] =
	(sw[1] & ~sw[0] & ~sw[2] & ~sw[3]) |
	(sw[3] & ~sw[0] & ~sw[1] & ~sw[2]) |
	(sw[2] & ~sw[3]) |
	(sw[0] & sw[3]);

assign RGB_led_B[0] =
	(sw[0] & sw[1]) |
	(sw[2] & sw[3]) |
	(sw[0] & sw[2]) |
	(sw[1] & sw[3] & sw[0] & ~sw[2]);

endmodule
