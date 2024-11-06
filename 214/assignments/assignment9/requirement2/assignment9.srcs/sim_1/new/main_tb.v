`timescale 1ns / 1ps

module main_tb;
    reg [7:0] a, b;
    wire [15:0] res;

    subtractor sub (
        .a  (a),
        .b  (b),
        .res(res)
    );

    initial begin
        #20 a = 8;
        #20 b = 10;
        #20 $finish;
    end
endmodule
