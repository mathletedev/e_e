`timescale 1ns / 1ps

module counter (
	input C,
	output B
);

reg [27:0] counter;

always @ (posedge C) begin
	counter <= counter + 1;
end

assign B = counter[16];

endmodule
