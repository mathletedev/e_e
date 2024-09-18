`timescale 1ns / 1ps

module decoder(
	input [1:0] sw,
	input [3:0] btn,
	output [3:0] led
);

reg [3:0] tmp;

always @ (sw) begin
	case (sw)
		2'd0: tmp <= btn[0];
		2'd1: tmp <= btn[1] << 1;
		2'd2: tmp <= btn[2] << 2;
		2'd3: tmp <= btn[3] << 3;
		default: tmp <= 2'd0;
	endcase
end

assign led = tmp;

endmodule
