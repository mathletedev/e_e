`timescale 1ns / 1ps

module counter (
    input en,
    input clk,
    input rst,
    output [15:0] count
);
    reg [15:0] tmp;

    always @(posedge clk) begin
        if (rst) tmp <= 0;
        else if (en) tmp <= tmp + 1;
    end

    assign count = tmp;
endmodule
