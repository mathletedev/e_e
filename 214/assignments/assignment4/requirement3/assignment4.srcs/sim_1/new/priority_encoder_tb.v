`timescale 1ns / 1ps

module priority_encoder_tb;

reg [3:0] I;
reg Ein;
wire [1:0] Y;
wire GS;
wire Eout;

priority_encoder cut (
	.I(I),
	.Ein(Ein),
	.Y(Y),
	.GS(GS),
	.Eout(Eout)
);

integer k;

initial begin
	I = 0;

	for (k = 0; k < 16; k = k + 1) begin
		#20 I = k;

		#20 Ein = 1;
		#20 Ein = 0;
	end

	#20 $finish;
end

endmodule
