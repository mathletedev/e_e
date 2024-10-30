`timescale 1ns / 1ps

module digit (
    input clk,
    input carry_in,
    output [3:0] res,
    output carry_out
);
    reg [3:0] tmp;
    always @(posedge clk) begin
        if (carry_in) begin
            tmp <= tmp + 1;
        end
        if (tmp == 10) begin
            tmp <= 0;
        end
    end

    assign res = (tmp == 10) ? 0 : tmp;
    assign carry_out = tmp == 10;
endmodule

module mux (
    input  [15:0] data,
    input  [ 1:0] sel,
    output [ 3:0] res
);
    reg [3:0] tmp;
    always @(data, sel) begin
        case (sel)
            0: tmp <= data[3:0];
            1: tmp <= data[7:4];
            2: tmp <= data[11:8];
            3: tmp <= data[15:12];
            default: tmp <= 0;
        endcase
    end

    assign res = tmp;
endmodule

module bin2seg (
    input  [3:0] data,
    output [6:0] res
);
    reg [6:0] tmp;
    always @(data) begin
        case (data)
            4'h0: tmp <= 7'b1000000;
            4'h1: tmp <= 7'b1111001;
            4'h2: tmp <= 7'b0100100;
            4'h3: tmp <= 7'b0110000;
            4'h4: tmp <= 7'b0011001;
            4'h5: tmp <= 7'b0010010;
            4'h6: tmp <= 7'b0000010;
            4'h7: tmp <= 7'b1111000;
            4'h8: tmp <= 7'b0000000;
            4'h9: tmp <= 7'b0011000;
            4'hA: tmp <= 7'b0100000;
            4'hB: tmp <= 7'b0000011;
            4'hC: tmp <= 7'b0100111;
            4'hD: tmp <= 7'b0100001;
            4'hE: tmp <= 7'b0000110;
            4'hF: tmp <= 7'b0001110;
            default: tmp <= 7'b1000000;
        endcase
    end

    assign res = tmp;
endmodule

module main (
    input clk,
    output [3:0] seg_an,
    output [6:0] seg_cat
);
    reg [28:0] counter;
    always @(posedge clk) begin
        counter <= counter + 1;
    end

    wire [15:0] data;
    wire [ 3:0] carry;

    digit d1 (
        .clk(counter[22]),
        .carry_in(1),
        .res(data[3:0]),
        .carry_out(carry[0])
    );
    digit d2 (
        .clk(counter[22]),
        .carry_in(carry[0]),
        .res(data[7:4]),
        .carry_out(carry[1])
    );
    digit d3 (
        .clk(counter[22]),
        .carry_in(carry[1]),
        .res(data[11:8]),
        .carry_out(carry[2])
    );
    digit d4 (
        .clk(counter[22]),
        .carry_in(carry[2]),
        .res(data[15:12]),
        .carry_out(carry[3])
    );

    wire [3:0] mux_to_bin;
    mux m (
        .data(data),
        .sel (counter[17:16]),
        .res (mux_to_bin)
    );

    wire [6:0] res;
    bin2seg b (
        .data(mux_to_bin),
        .res (res)
    );

    assign seg_an  = 4'b1111 ^ (1 << counter[17:16]);
    assign seg_cat = res;
endmodule
