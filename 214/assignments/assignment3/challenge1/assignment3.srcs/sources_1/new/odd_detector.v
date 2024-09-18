`timescale 1ns / 1ps

module odd_detector(
	input [7:0] sw,
	input [3:0] btn,
	output [1:0] led
);

assign led[0] =
	(sw[7] ^ sw[6] ^ sw[5] ^ sw[4] ^ sw[3] ^ sw[2] ^ sw[1] ^ sw[0]) &
	~(btn[0] ^ btn[1] ^ btn[2] ^ btn[3]);

assign led[1] =
	~(sw[7] ^ sw[6] ^ sw[5] ^ sw[4] ^ sw[3] ^ sw[2] ^ sw[1] ^ sw[0]) &
	~(btn[0] ^ btn[1] ^ btn[2] ^ btn[3]);

endmodule
