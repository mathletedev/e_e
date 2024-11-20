`timescale 1ns / 1ps

module main (
    input clk,
    input rst,
    input start,
    input stop,
    input inc,
    output [3:0] seg_an,
    output [6:0] seg_cat
);
    wire div_clk;
    wire cen;
    wire [15:0] data;

    divider divider (
        .clk(clk),
        .rst(rst),
        .res(div_clk)
    );

    state_machine state_machine (
        .clk  (div_clk),
        .rst  (rst),
        .start(start),
        .stop (stop),
        .inc  (inc),
        .cen  (cen)
    );

    counter counter (
        .clk  (div_clk),
        .rst  (rst),
        .cen  (cen),
        .count(data)
    );

    seg_controller seg_controller (
        .clk(clk),
        .div_clk(div_clk),
        .data(data),
        .seg_an(seg_an),
        .seg_cat(seg_cat)
    );
endmodule
