`timescale 1ns / 1ps

module register(
	input [7:0] D,
	input En,
	input Clk,
	output [7:0] Q
);
	reg [7:0] tmp;

	always @ (posedge Clk) begin
		if (En) begin
			tmp <= D;
		end
	end

	assign Q = tmp;
endmodule

module mux(
	input [7:0] I0,
	input [7:0] I1,
	input Sel,
	output [7:0] O
);
	reg [7:0] res;

	always @ (I0, I1, Sel) begin
		case (Sel)
			0: res <= I0;
			1: res <= I1;
		endcase
	end

	assign O = res;
endmodule

module main(
	input [7:0] sw,
	input [1:0] btn,
	input clk,
	output [7:0] led
);
	wire [7:0] reg_to_mux;

	register r(.D(sw), .En(btn[0]), .Clk(clk), .Q(reg_to_mux));
	mux m(.I0(sw), .I1(reg_to_mux), .Sel(btn[1]), .O(led));
endmodule
