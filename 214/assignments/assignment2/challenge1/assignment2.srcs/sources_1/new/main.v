`timescale 1ns/1ps
module main(
	input [3:0] sw,
	output [1:0] led
);

// two switches
assign led[0] =
	(~sw[0] & ~sw[1] & sw[2] & sw[3]) |
	(~sw[0] & sw[1] & ~sw[2] & sw[3]) |
	(~sw[0] & sw[1] & sw[2] & ~sw[3]) |
	(sw[0] & ~sw[1] & ~sw[2] & sw[3]) |
	(sw[0] & ~sw[1] & sw[2] & ~sw[3]) |
	(sw[0] & sw[1] & ~sw[2] & ~sw[3]);

// three switches
assign led[1] =
	(~sw[0] & ~sw[1] & ~sw[2] & sw[3]) |
	(~sw[0] & ~sw[1] & sw[2] & ~sw[3]) |
	(~sw[0] & sw[1] & ~sw[2] & ~sw[3]) |
	(sw[0] & ~sw[1] & ~sw[2] & ~sw[3]);

endmodule
