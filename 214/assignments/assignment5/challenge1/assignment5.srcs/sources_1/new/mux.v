`timescale 1ns / 1ps

module mux(
	input [7:0] X,
	input S,
	output [3:0] Y
);

reg [3:0] res;

always @(X, S) begin
	case (S)
		1'b0:    res <= X[3:0];
		1'b1:    res <= X[7:4];
		default: res <= 4'd0;
	endcase
end

assign Y = res;

endmodule
