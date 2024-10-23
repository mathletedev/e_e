`timescale 1ns / 1ps

module bin2seg (
	input [7:0] sw,
	input btn,
	output [3:0] seg_an,
	output [6:0] seg_cat
);

reg [3:0] data;
reg [6:0] res;

always @(sw, btn) begin
	if (btn)
		data = sw[7:4];
	else
		data = sw[3:0];

	case (data)
		4'h0:    res <= 7'b1000000;
		4'h1:    res <= 7'b1111001;
		4'h2:    res <= 7'b0100100;
		4'h3:    res <= 7'b0110000;
		4'h4:    res <= 7'b0011001;
		4'h5:    res <= 7'b0010010;
		4'h6:    res <= 7'b0000010;
		4'h7:    res <= 7'b1111000;
		4'h8:    res <= 7'b0000000;
		4'h9:    res <= 7'b0011000;
		4'hA:    res <= 7'b0100000;
		4'hB:    res <= 7'b0000011;
		4'hC:    res <= 7'b0100111;
		4'hD:    res <= 7'b0100001;
		4'hE:    res <= 7'b0000110;
		4'hF:    res <= 7'b0001110;
		default: res <= 7'b1000000;
	endcase
end

assign seg_cat = res;
assign seg_an = 4'b1100 | ~(1 << btn);

endmodule