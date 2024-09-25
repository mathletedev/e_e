`timescale 1ns / 1ps

module demux (
	input EN,
	input [2:0] I,
	output [7:0] Y
);

reg [7:0] res;

always @(I) begin
	case (I)
		3'd0:    res <= EN << 0;
		3'd1:    res <= EN << 1;
		3'd2:    res <= EN << 2;
		3'd3:    res <= EN << 3;
		3'd4:    res <= EN << 4;
		3'd5:    res <= EN << 5;
		3'd6:    res <= EN << 6;
		3'd7:    res <= EN << 7;
		default: res <= 8'd0;
	endcase
end

assign Y = res;

endmodule
