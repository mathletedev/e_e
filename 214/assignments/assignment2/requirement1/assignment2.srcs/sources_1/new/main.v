`timescale 1ns/1ps
module main(
	input [7:0] sw,
	output [3:0] led
);

// initial design
// assign led[0] = sw[0] ^ sw[1];

// assign led[1] =
// 	~(sw[1] | sw[2] | sw[3]) |
// 	(sw[1] & (sw[2] ^ sw[3]));

// assign led[2] =
// 	(sw[4] & ~sw[6] & ~sw[7]) |
// 	(sw[6] & ~(sw[4] | sw[5] | sw[7])) |
// 	(sw[4] & sw[5] & sw[6] & sw[7]);

// assign led[3] = sw[3] ^ sw[5];

// sop design
// assign led[0] =
// 	(~sw[1] & sw[0]) |
// 	(sw[1] & ~sw[0]);

// assign led[1] =
// 	(~sw[3] & ~sw[2] & ~sw[1]) |
// 	(~sw[3] & sw[2] & sw[1]) |
// 	(sw[3] & ~sw[2] & sw[1]);

// assign led[2] =
// 	(~sw[7] & ~sw[6] & ~sw[5] & sw[4]) |
// 	(~sw[7] & ~sw[6] & sw[5] & sw[4]) |
// 	(~sw[7] & sw[6] & ~sw[5] & ~sw[4]) |
// 	(sw[7] & sw[6] & sw[5] & sw[4]);

// assign led[3] =
// 	(~sw[5] & sw[3]) |
// 	(sw[5] & ~sw[3]);

// pos design
// to convert sop to pos, take each zero-result row and negate it
assign led[0] =
	(sw[1] | sw[0]) &
	(~sw[1] | ~sw[0]);

assign led[1] =
	(sw[3] | sw[2] | ~sw[1]) &
	(sw[3] | ~sw[2] | sw[1]) &
	(~sw[3] | sw[2] | sw[1]) &
	(~sw[3] | ~sw[2] | sw[1]) &
	(~sw[3] | ~sw[2] | ~sw[1]);

assign led[2] =
	(sw[7] | sw[6] | sw[5] | sw[4]) &
	(sw[7] | sw[6] | ~sw[5] | sw[4]) &
	(sw[7] | ~sw[6] | sw[5] | ~sw[4]) &
	(sw[7] | ~sw[6] | ~sw[5] | sw[4]) &
	(sw[7] | ~sw[6] | ~sw[5] | ~sw[4]) &
	(~sw[7] | sw[6] | sw[5] | sw[4]) &
	(~sw[7] | sw[6] | sw[5] | ~sw[4]) &
	(~sw[7] | sw[6] | ~sw[5] | sw[4]) &
	(~sw[7] | sw[6] | ~sw[5] | ~sw[4]) &
	(~sw[7] | ~sw[6] | sw[5] | sw[4]) &
	(~sw[7] | ~sw[6] | sw[5] | ~sw[4]) &
	(~sw[7] | ~sw[6] | ~sw[5] | sw[4]);

assign led[3] =
	(sw[5] | sw[3]) &
	(~sw[5] | ~sw[3]);

endmodule
