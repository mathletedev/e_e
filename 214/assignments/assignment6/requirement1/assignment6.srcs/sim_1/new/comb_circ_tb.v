`timescale 1ns / 1ps
module comb_circ_tb;

wire X;
reg A, B, C;

comb_circ cut (.A(A), .B(B), .C(C), .X(X));

integer k = 0;

initial begin
	A = 0;
	B = 0;
	C = 0;

	for (k = 0; k < 4; k = k + 1) begin
		{A, C} = k;
		#40 B = 1;
		#40 B = 0;
		#40;
	end
end

endmodule
