`timescale 1ns / 1ps

module main (
    input  clk,
    input  rst,
    input  a,
    input  b,
    output f,
    output c_out
);
    localparam reg [1:0] S0 = 2'b00;
    localparam reg [1:0] S1 = 2'b01;
    localparam reg [1:0] S2 = 2'b10;
    localparam reg [1:0] S3 = 2'b11;

    reg [1:0] state;
    reg [1:0] next_state;

    always @(state, a, b) begin
        case (state)
            S0:
            if (~a & ~b) next_state = S0;
            else if (a ^ b) next_state = S1;
            else next_state = S2;
            S1:
            if (~a & ~b) next_state = S0;
            else if (a ^ b) next_state = S1;
            else next_state = S2;
            S2:
            if (~a & ~b) next_state = S1;
            else if (a ^ b) next_state = S2;
            else next_state = S3;
            S3:
            if (~a & ~b) next_state = S1;
            else if (a ^ b) next_state = S2;
            else next_state = S3;
            default: next_state = S0;
        endcase
    end

    always @(posedge clk) begin
        if (rst) state <= S0;
        else state <= next_state;
    end

    assign f = (state == S1 || state == S3);
    assign c_out = (state == S2 || state == S3);
endmodule
