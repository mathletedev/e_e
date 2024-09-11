`timescale 1ns / 1ps

module temperature_indicator(
	input [7:0] sw,
	output [0:0] led
);

assign led[0] = sw[7] & ~sw[6] & sw[5] & (~(sw[4] & sw[3]) | ~(sw[2] | sw[1] | sw[0]));

endmodule
