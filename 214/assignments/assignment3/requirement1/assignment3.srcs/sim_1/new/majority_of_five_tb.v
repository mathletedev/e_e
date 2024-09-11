`timescale 1ns / 1ps

module majority_of_five_tb;

reg [4:0] sw;
wire led;

majority_of_five cut (.sw(sw), .led(led));

integer k;

initial
begin
	sw = 0;

	for (k = 0; k < 32; k = k + 1)
		#20 sw = k;

	#20 $finish;
end

endmodule
