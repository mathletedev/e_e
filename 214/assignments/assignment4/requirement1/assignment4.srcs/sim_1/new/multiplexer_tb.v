`timescale 1ns / 1ps

module multiplexer_tb;

reg [7:0] data;
reg [2:0] sel;
wire Y;

multiplexer cut (.data(data), .sel(sel), .Y(Y));

integer k;
integer l;

initial
begin
	sel = 0;

	for (k = 0; k < 8; k = k + 1) begin
		#20 sel = k;

		for (l = 0; l < 8; l = l + 1) begin
			#20 data = 0;
			data[l] = 1;
		end
	end

	#20 $finish;
end

endmodule
