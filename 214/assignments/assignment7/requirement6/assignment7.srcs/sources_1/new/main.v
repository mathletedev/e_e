`timescale 1ns / 1ps

module main(
	input sw,
	input btn,
	input clk,
	output [7:0] led
);
	reg [7:0] tmp;
	reg pressed;

	always @ (posedge clk) begin
		if (btn & ~pressed) begin
			tmp <= (tmp << 1) | sw;

			pressed <= 1;
		end
		else if (~btn) begin
			pressed <= 0;
		end
	end

	assign led = tmp;
endmodule
