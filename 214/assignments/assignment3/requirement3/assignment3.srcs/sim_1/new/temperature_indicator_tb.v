`timescale 1ns / 1ps

module temperature_indicator_tb;

reg [7:0] sw;
wire led;

temperature_indicator cut (.sw(sw), .led(led));

integer k;

initial
begin
	sw = 0;

	for (k = 0; k < 256; k = k + 1)
		#20 sw = k;

	#20 $finish;
end

endmodule
