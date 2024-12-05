`timescale 1ns / 1ps

module bin2bcd (
    input [15:0] bin,
    output reg [15:0] res
);
    integer i;
    always @(bin) begin
        res = 0;
        for (i = 0; i < 16; i = i + 1) begin
            if (res[3:0] >= 5) res[3:0] = res[3:0] + 3;
            if (res[7:4] >= 5) res[7:4] = res[7:4] + 3;
            if (res[11:8] >= 5) res[11:8] = res[11:8] + 3;
            if (res[15:12] >= 5) res[15:12] = res[15:12] + 3;
            res = res << 1 | bin[15-i];
        end
    end
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

module selector (
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

module display (
    input en,
    input clk,
    input div_clk,
    input [15:0] data,
    output wire [3:0] seg_an,
    output wire [6:0] seg_cat
);
    wire [ 1:0] sel;
    wire [15:0] bcd;
    wire [ 3:0] muxed;
    wire [ 6:0] seg;

    bin2bcd bin2bcd (
        .bin(data),
        .res(bcd)
    );

    selector selector (
        .clk(clk),
        .res(sel)
    );

    mux mux (
        .data(bcd),
        .sel (sel),
        .res (muxed)
    );

    bin2seg bin2seg (
        .bin(muxed),
        .res(seg)
    );

    assign seg_an  = 4'b1111 ^ (en << sel);
    assign seg_cat = seg;
endmodule
