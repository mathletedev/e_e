`timescale 1ns / 1ps

module five_way(
	input [4:0] sw,
	output [0:0] led
);

assign led[0] =
	// one switch
	(~sw[4] & ~sw[3] & ~sw[2] & ~sw[1] & sw[0]) |
	(~sw[4] & ~sw[3] & ~sw[2] & sw[1] & ~sw[0]) |
	(~sw[4] & ~sw[3] & sw[2] & ~sw[1] & ~sw[0]) |
	(~sw[4] & sw[3] & ~sw[2] & ~sw[1] & ~sw[0]) |
	(sw[4] & ~sw[3] & ~sw[2] & ~sw[1] & ~sw[0]) |
	// three switches
	(~sw[4] & ~sw[3] & sw[2] & sw[1] & sw[0]) |
	(~sw[4] & sw[3] & ~sw[2] & sw[1] & sw[0]) |
	(~sw[4] & sw[3] & sw[2] & ~sw[1] & sw[0]) |
	(~sw[4] & sw[3] & sw[2] & sw[1] & ~sw[0]) |
	(sw[4] & ~sw[3] & ~sw[2] & sw[1] & sw[0]) |
	(sw[4] & ~sw[3] & sw[2] & ~sw[1] & sw[0]) |
	(sw[4] & ~sw[3] & sw[2] & sw[1] & ~sw[0]) |
	(sw[4] & sw[3] & ~sw[2] & ~sw[1] & sw[0]) |
	(sw[4] & sw[3] & ~sw[2] & sw[1] & ~sw[0]) |
	(sw[4] & sw[3] & sw[2] & ~sw[1] & ~sw[0]) |
	// five switches
	(sw[4] & sw[3] & sw[2] & sw[1] & sw[0]);

endmodule
