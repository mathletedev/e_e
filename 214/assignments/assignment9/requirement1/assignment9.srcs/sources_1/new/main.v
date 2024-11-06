`timescale 1ns / 1ps

module mux (
    input [7:0] x,
    input sel,
    output [3:0] y
);
    reg [3:0] res;

    always @(x, sel) begin
        case (sel)
            1'b0: res <= x[3:0];
            1'b1: res <= x[7:4];
            default: res <= 4'b0000;
        endcase
    end

    assign y = res;
endmodule

module bin2seg (
    input  [3:0] bin,
    output [6:0] seg
);
    reg [6:0] res;

    always @(bin) begin
        case (bin)
            4'h0: res <= 7'b1000000;
            4'h1: res <= 7'b1111001;
            4'h2: res <= 7'b0100100;
            4'h3: res <= 7'b0110000;
            4'h4: res <= 7'b0011001;
            4'h5: res <= 7'b0010010;
            4'h6: res <= 7'b0000010;
            4'h7: res <= 7'b1111000;
            4'h8: res <= 7'b0000000;
            4'h9: res <= 7'b0011000;
            4'hA: res <= 7'b0100000;
            4'hB: res <= 7'b0000011;
            4'hC: res <= 7'b0100111;
            4'hD: res <= 7'b0100001;
            4'hE: res <= 7'b0000110;
            4'hF: res <= 7'b0001110;
            default: res <= 7'b1000000;
        endcase
    end

    assign seg = res;
endmodule

module counter (
    input  clk,
    output y
);

    reg [27:0] counter;

    always @(posedge clk) begin
        counter <= counter + 1;
    end

    assign y = counter[16];
endmodule

module bit_slice (
    input  a,
    input  b,
    input  c,
    output sum,
    output p,
    output g
);
    assign sum = a ^ b ^ c;
    assign p   = a | b;
    assign g   = a & b;
endmodule

module main (
    input clk,
    input [3:0] op1,
    input [3:0] op2,
    input [1:0] btn,
    output [7:0] led,
    output [3:0] seg_an,
    output [6:0] seg_cat
);
    wire sel;
    wire [7:0] sum, p, g;
    wire [3:0] bin;
    wire [6:0] seg;

    // individual bit slices
    bit_slice b0 (
        .a  (op1[0]),
        .b  (op2[0]),
        .c  (0),
        .sum(sum[0]),
        .p  (p[0]),
        .g  (g[0])
    );
    bit_slice b1 (
        .a  (op1[1]),
        .b  (op2[1]),
        .c  (g[0]),
        .sum(sum[1]),
        .p  (p[1]),
        .g  (g[1])
    );
    bit_slice b2 (
        .a  (op1[2]),
        .b  (op2[2]),
        .c  (g[1] | g[0] & p[1]),
        .sum(sum[2]),
        .p  (p[2]),
        .g  (g[2])
    );
    bit_slice b3 (
        .a  (op1[3]),
        .b  (op2[3]),
        .c  (g[2] | g[1] & p[2] | g[0] & p[1] & p[2]),
        .sum(sum[3]),
        .p  (p[3]),
        .g  (g[3])
    );
    bit_slice b4 (
        .a  (0),
        .b  (0),
        .c  (g[3] | g[2] & p[3] | g[1] & p[2] & p[3] | g[0] & p[1] & p[2] & p[3]),
        .sum(sum[4]),
        .p  (p[4]),
        .g  (g[4])
    );

    // displaying result
    counter c (
        .clk(clk),
        .y  (sel)
    );

    mux m (
        .x  (sum),
        .sel(sel),
        .y  (bin)
    );

    bin2seg b (
        .bin(bin),
        .seg(seg)
    );

    assign led = (op2 << 4) | op1;
    assign seg_an = 4'b1111 ^ (1 << sel);
    assign seg_cat = seg;
endmodule
