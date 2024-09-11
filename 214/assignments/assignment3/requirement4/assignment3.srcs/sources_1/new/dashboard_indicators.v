`timescale 1ns / 1ps

module dashboard_indicators(
	input [4:0] sw,
	output [1:0] led
);

assign led[0] = sw[0] | sw[2] | sw[4] & (sw[0] | sw[1]);

assign led[1] = sw[0] & sw[4] | sw[1] | sw[2] | sw[3];

endmodule
