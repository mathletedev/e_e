`timescale 1ns / 1ps

module main_tb;
    reg clk, rst, a, b;
    wire f, c_out;

    main main1 (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .f(f),
        .c_out(c_out)
    );

    initial begin
        clk = 0;

        #10 clk = ~clk;
        #10 clk = ~clk;

        a = 1;
        b = 0;

        #10 clk = ~clk;
        #10 clk = ~clk;

        a = 0;
        b = 1;

        #10 clk = ~clk;
        #10 clk = ~clk;

        a = 1;
        b = 1;

        #10 clk = ~clk;
        #10 clk = ~clk;

        a = 1;
        b = 1;

        #10 clk = ~clk;
        #10 clk = ~clk;

        a = 1;
        b = 0;

        #10 clk = ~clk;
        #10 clk = ~clk;

        a = 1;
        b = 1;

        #10 clk = ~clk;
        #10 clk = ~clk;

        a = 0;
        b = 0;

        #10 clk = ~clk;
        #10 clk = ~clk;
    end
endmodule
