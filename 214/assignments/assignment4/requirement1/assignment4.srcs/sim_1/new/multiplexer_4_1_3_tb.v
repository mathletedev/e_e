`timescale 1ns / 1ps

module multiplexer_4_1_3_tb;

reg [11:0] data;
reg [1:0] sel;
wire [2:0] led;

multiplexer_4_1_3 cut (.data(data), .sel(sel), .led(led));

integer k;
integer l;

initial
begin
	sel = 0;

	for (k = 0; k < 4; k = k + 1) begin
		#20 sel = k;

		for (l = 0; l < 11; l = l + 1) begin
			#20 data = 0;
			data[l] = 1;
		end
	end

	#20 $finish;
end

endmodule
