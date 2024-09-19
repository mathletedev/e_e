`timescale 1ns / 1ps

module shifter(
	input [7:0] data,
	input [1:0] shift,
	input dir,
	input rot,
	input fill,
	output [7:0] res
);

reg [7:0] add;
reg [7:0] tmp;

always @ (data, shift) begin
	if (dir) begin
		if (rot)
			add <= data >> (8 - shift);
		else if (fill)
			add <= (2 << shift) - 1; // 2^n - 1 = n 1s

		tmp <= data << shift | add;
	end
	else begin
		if (rot)
			add <= data << (8 - shift);
		if (fill)
			add <= ((2 << shift) - 1) << (8 - shift); // shift 1s to the left

		tmp <= data >> shift | add;
	end
end

assign res = tmp;

endmodule
