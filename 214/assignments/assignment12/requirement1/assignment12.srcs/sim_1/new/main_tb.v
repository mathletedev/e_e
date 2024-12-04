`timescale 1ns / 1ps

module main_tb;
    reg clk = 0;
    reg rst = 0;
    reg sw = 0;
    wire db = 0;
    wire [1:0] s = 0;
    wire [1:0] ns = 0;

    main main (
        .clk(clk),
        .sw (sw),
        .db (db),
        .s  (s),
        .ns (ns)
    );

    always begin
        #100 clk <= ~clk;
    end

    initial begin
        rst = 1;
        #50 rst = 0;

        #81 sw = 1;
        #41 sw = 0;
        #21 sw = 1;
        #11 sw = 0;
        #5 sw = 1;

        #1001;

        #81 sw = 0;
        #41 sw = 1;
        #21 sw = 0;
        #11 sw = 1;
        #5 sw = 0;
    end
endmodule
