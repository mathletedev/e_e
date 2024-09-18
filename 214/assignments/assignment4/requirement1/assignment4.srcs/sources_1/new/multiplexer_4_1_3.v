`timescale 1ns / 1ps

module multiplexer_4_1_3(
	input [11:0] data,
	input [1:0] sel,
	output [2:0] led
);

reg [2:0] tmp;

always @(data, sel) begin
	case (sel)
		2'b00:   tmp <= (data[2] << 2 | data[1] << 1 | data[0]);
		2'b01:   tmp <= (data[5] << 2 | data[4] << 1 | data[3]);
		2'b10:   tmp <= (data[8] << 2 | data[7] << 1 | data[6]);
		2'b11:   tmp <= (data[11] << 2 | data[10] << 1 | data[9]);
		default: tmp <= 3'b000;
	endcase
end

assign led = tmp;

endmodule
