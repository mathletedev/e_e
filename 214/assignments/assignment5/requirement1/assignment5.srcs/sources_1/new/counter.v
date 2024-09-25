`timescale 1ns / 1ps

module counter (
	input C,
	output [2:0] B
);

reg [27:0] counter;

always @(posedge C) begin
	counter <= counter + 1;
end

assign B = counter[27:25];

endmodule
