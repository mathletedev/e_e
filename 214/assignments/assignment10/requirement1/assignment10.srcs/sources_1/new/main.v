`timescale 1ns / 1ps

module alu (
    input [7:0] a,
    input [7:0] b,
    input [2:0] ctrl,
    output reg [7:0] res
);
    always @(a, b, ctrl) begin
        case (ctrl)
            3'b000:  res = a + b;
            3'b001:  res = a + 1;
            3'b010:  res = a + (~b + 1);
            3'b011:  res = a ^ b;
            3'b100:  res = a | b;
            3'b101:  res = a & b;
            default: res = 0;
        endcase
    end
endmodule

module bin2bcd (
    input [6:0] bin,
    output reg [15:0] res
);
    integer i;
    always @(bin) begin
        res = 0;
        for (i = 0; i < 7; i = i + 1) begin
            if (res[3:0] >= 5) res[3:0] = res[3:0] + 3;
            if (res[7:4] >= 5) res[7:4] = res[7:4] + 3;
            if (res[11:8] >= 5) res[11:8] = res[11:8] + 3;
            if (res[15:12] >= 5) res[15:12] = res[15:12] + 3;
            res = res << 1 | bin[6-i];
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
    input [2:0] ctrl,
    input [1:0] load,
    output [3:0] seg_an,
    output [6:0] seg_cat,
    output [3:0] status
);
    reg [7:0] a, b;
    wire [7:0] res;

    always @(posedge clk) begin
        if (load[0]) a <= data;
        if (load[1]) b <= data;

    end

    reg [7:0] fmt;
    reg cout;

    always @(res) begin
        // format res as positive number
        if (res[7]) fmt = ~res + 1;
        else fmt = res;

        cout = (ctrl == 3'b000 || ctrl == 3'b001) && res[7];
    end

    alu alu1 (
        .a(a),
        .b(b),
        .ctrl(ctrl),
        .res(res)
    );

    // display
    wire [ 1:0] sel;
    wire [15:0] bcd;
    wire [ 3:0] muxed;
    wire [ 6:0] seg;

    bin2bcd bin2bcd1 (
        .bin(fmt[6:0]),
        .res(bcd)
    );
    counter count1 (
        .clk(clk),
        .res(sel)
    );
    mux mux1 (
        .data(bcd),
        .sel (sel),
        .res (muxed)
    );
    bin2seg bin2seg1 (
        .bin(muxed),
        .res(seg)
    );

    assign seg_an = 4'b1111 ^ (1 << sel);
    assign seg_cat = seg;

    // status
    assign status[0] = res == 0;
    assign status[1] = res[7];
    assign status[2] = cout;
    assign status[3] =
        (ctrl == 3'b000 || ctrl == 3'b001 || ctrl == 3'b010) &&
        res[7] != a[7] && res[7] != b[7];
endmodule
