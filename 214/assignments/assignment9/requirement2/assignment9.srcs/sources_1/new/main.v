`timescale 1ns / 1ps

module adder (
    input  [15:0] a,
    input  [15:0] b,
    output [15:0] res
);
    assign res = a + b;
endmodule

module subtractor (
    input  [15:0] a,
    input  [15:0] b,
    output [15:0] res
);
    adder _add (
        .a  (a),
        .b  (~b + 1),
        .res(res)
    );
endmodule

module multiplier (
    input  [ 7:0] a,
    input  [ 7:0] b,
    output [15:0] res
);
    assign res = a * b;
endmodule

module bin2bcd (
    input [14:0] bin,
    output reg [15:0] res
);
    integer i;
    always @(bin) begin
        res = 0;
        for (i = 0; i < 15; i = i + 1) begin
            if (res[3:0] >= 5) res[3:0] = res[3:0] + 3;
            if (res[7:4] >= 5) res[7:4] = res[7:4] + 3;
            if (res[11:8] >= 5) res[11:8] = res[11:8] + 3;
            if (res[15:12] >= 5) res[15:12] = res[15:12] + 3;
            res = res << 1 | bin[14-i];
        end
    end
endmodule

module comparator (
    input  [15:0] a,
    input  [15:0] b,
    output [ 2:0] res
);
    assign res[0] = a > b;
    assign res[1] = a == b;
    assign res[2] = a < b;
endmodule

module bin2seg (
    input [3:0] bin,
    output reg [6:0] res
);
    always @(bin) begin
        case (bin)
            4'h0: res = 7'b1000000;
            4'h1: res = 7'b1111001;
            4'h2: res = 7'b0100100;
            4'h3: res = 7'b0110000;
            4'h4: res = 7'b0011001;
            4'h5: res = 7'b0010010;
            4'h6: res = 7'b0000010;
            4'h7: res = 7'b1111000;
            4'h8: res = 7'b0000000;
            4'h9: res = 7'b0011000;
            4'hA: res = 7'b0100000;
            4'hB: res = 7'b0000011;
            4'hC: res = 7'b0100111;
            4'hD: res = 7'b0100001;
            4'hE: res = 7'b0000110;
            4'hF: res = 7'b0001110;
            default: res = 7'b1000000;
        endcase
    end
endmodule

module counter (
    input clk,
    output [1:0] res
);
    reg [27:0] count;

    always @(posedge clk) begin
        count <= count + 1;
    end

    assign res = count[17:16];
endmodule

module mux (
    input [15:0] data,
    input [1:0] sel,
    output reg [3:0] res
);
    always @(data, sel) begin
        case (sel)
            2'd0: res = data[3:0];
            2'd1: res = data[7:4];
            2'd2: res = data[11:8];
            2'd3: res = data[15:12];
            default: res = 4'b0000;
        endcase
    end
endmodule

module main (
    input clk,
    input [7:0] data,
    input [2:0] load,
    input neg_en,
    input mul_en,
    output [3:0] seg_an,
    output [6:0] seg_cat,
    output neg,
    output [2:0] cmp
);
    // arithmetic
    reg [15:0] a, b;
    wire [15:0] sum, diff, prod;
    reg [15:0] res;
    reg [15:0] hist;

    adder _add (
        .a  (a),
        .b  (b),
        .res(sum)
    );
    subtractor _sub (
        .a  (a),
        .b  (b),
        .res(diff)
    );
    multiplier _mul (
        .a  (a),
        .b  (b),
        .res(prod)
    );

    always @(posedge clk) begin
        if (load[0]) a <= data;
        if (load[1]) b <= data;
        if (load[2]) hist <= res;

        if (~mul_en) begin
            if (~neg_en) begin
                res = sum;
            end else begin
                if (diff[15]) res = (~diff + 1) | (1 << 15);
                else res = diff;
            end
        end else begin
            res = prod;
        end
    end

    // display
    wire [ 1:0] sel;
    wire [15:0] bcd;
    wire [ 3:0] muxed;
    wire [ 6:0] seg;

    bin2bcd _b2b (
        .bin(res[14:0]),
        .res(bcd)
    );
    counter _cnt (
        .clk(clk),
        .res(sel)
    );
    mux _mux (
        .data(bcd),
        .sel (sel),
        .res (muxed)
    );
    bin2seg _b2s (
        .bin(muxed),
        .res(seg)
    );

    comparator _cmp (
        .a  (res),
        .b  (hist),
        .res(cmp)
    );

    assign seg_an = 4'b1111 ^ (1 << sel);
    assign seg_cat = seg;
    assign neg = res[15];
endmodule
