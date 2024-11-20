`timescale 1ns / 1ps

module counter (
    input clk,
    input rst,
    input cen,
    output [15:0] count
);
    reg [15:0] tmp;

    always @(posedge clk) begin
        if (rst) tmp <= 0;
        else if (cen) tmp <= tmp + 1;
    end

    assign count = tmp;
endmodule
