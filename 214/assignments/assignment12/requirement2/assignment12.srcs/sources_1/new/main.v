`timescale 1ns / 1ps

module main (
    input clk,
    input start,
    input react,
    input avg,
    output [3:0] seg_an,
    output [6:0] seg_cat,
    output led,
    output [7:0] idx
);
    wire div_clk;
    wire cen;
    wire den;
    wire aen;
    wire crst;
    wire [15:0] data;

    wire [12:0] random;

    wire [3:0] _idx;
    wire [15:0] _avg;

    random_generator random_generator (
        .clk(clk),
        .random(random)
    );

    divider divider (
        .clk(clk),
        .rst(rst),
        .res(div_clk)
    );

    state_machine state_machine (
        .clk(div_clk),
        .start(start),
        .react(react),
        .random(random),
        .data(data),
        .cen(cen),
        .den(den),
        .aen(aen),
        .idx(_idx),
        .avg(_avg),
        .crst(crst)
    );

    counter counter (
        .en(cen),
        .clk(div_clk),
        .rst(crst),
        .count(data)
    );

    display display (
        .en(den | (avg & aen)),
        .clk(clk),
        .div_clk(div_clk),
        .data((avg & aen) ? _avg : data),
        .seg_an(seg_an),
        .seg_cat(seg_cat)
    );

    assign led = cen;
    assign idx = 1 << _idx;
endmodule
