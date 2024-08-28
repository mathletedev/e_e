`timescale 1ns/1ps
module led_sw(
	output [11:0] led,
	input [11:0] sw
);

genvar i;
generate
	for (i=0; i<12; i=i+1) begin: led_assign
		assign led[i] = sw[11-i];
	end
endgenerate

endmodule
