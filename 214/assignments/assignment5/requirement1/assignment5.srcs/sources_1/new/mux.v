`timescale 1ns / 1ps

module mux (
	// inputs
	input [7:0] I,
	// selector
	input [2:0] S,
	// outputs
	output wire Y
);

reg res;

always @(I, S) begin
	case (S)
		3'd0:    res <= I[0];
		3'd1:    res <= I[1];
		3'd2:    res <= I[2];
		3'd3:    res <= I[3];
		3'd4:    res <= I[4];
		3'd5:    res <= I[5];
		3'd6:    res <= I[6];
		3'd7:    res <= I[7];
		default: res <= 0;
	endcase
end

assign Y = res;

endmodule
