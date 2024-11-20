`timescale 1ns / 1ps

module state_machine (
    input  clk,
    input  rst,
    input  start,
    input  stop,
    input  inc,
    output cen
);
    localparam reg [1:0] S0 = 2'b00;
    localparam reg [1:0] S1 = 2'b01;
    localparam reg [1:0] S2 = 2'b10;
    localparam reg [1:0] S3 = 2'b11;

    reg [1:0] state;
    reg [1:0] next_state;

    always @(posedge clk) begin
        case (state)
            S0:
            if (start) next_state = S1;
            else if (inc) next_state = S2;
            else next_state = S0;
            S1:
            if (stop) next_state = S0;
            else next_state = S1;
            S2: next_state = S3;
            S3:
            if (~inc) next_state = S0;
            else next_state = S3;
            default: next_state = S0;
        endcase

        if (rst) state = S0;
        else state = next_state;
    end

    assign cen = state == S1 || state == S2;
endmodule
