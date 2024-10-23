`timescale 1ns / 1ps

module shift_register(
	input [7:0] D,
	input En,
	input Clk,
	input SI, // shift in
	output [7:0] Q,
	output SO // shift out
);
	reg [25:0] count;
	reg [7:0] res;

	always @ (posedge(Clk)) begin
		count <= count + 1;

		if (En) begin
			res <= D;
		end
		else if (count == 1 << 20) begin
			res <= res << 1 | SI;
		end
	end

	assign Q = res;
	assign SO = res[7];
endmodule

module main(
	input [7:0] sw,
	input [1:0] btn,
	input clk,
	output [15:0] led
);
	wire SO[1:0];

	shift_register sr1(.D(sw), .En(btn[0]), .Clk(clk), .SI(SO[1]), .Q(led[7:0]), .SO(SO[0]));
	shift_register sr2(.D(sw), .En(btn[1]), .Clk(clk), .SI(SO[0]), .Q(led[15:8]), .SO(SO[1]));
endmodule
