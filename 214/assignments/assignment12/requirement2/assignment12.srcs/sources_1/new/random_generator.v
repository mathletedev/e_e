`timescale 1ns / 1ps

module random_generator (
    input clk,
    output [12:0] random
);
    reg [12:0] tmp;

    always @(posedge clk) begin
        tmp <= tmp + 1;
    end

    assign random = tmp;
endmodule
