`timescale 1ns / 1ps

module majority_of_five(
	input [4:0] sw,
	output [0:0] led
);

assign led[0] =
	(sw[2] & sw[1] & sw[0]) |
	(sw[3] & sw[1] & sw[0]) |
	(sw[3] & sw[2] & sw[0]) |
	(sw[3] & sw[2] & sw[1]) |
	(sw[4] & sw[1] & sw[0]) |
	(sw[4] & sw[2] & sw[0]) |
	(sw[4] & sw[2] & sw[1]) |
	(sw[4] & sw[3] & sw[0]) |
	(sw[4] & sw[3] & sw[1]) |
	(sw[4] & sw[3] & sw[2]);

endmodule
