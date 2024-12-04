`timescale 1ns / 1ps

module main (
    input  clk,
    input  sw,
    output db
);
    localparam reg [1:0] S0 = 2'b00;
    localparam reg [1:0] S1 = 2'b01;
    localparam reg [1:0] S2 = 2'b10;
    localparam reg [1:0] S3 = 2'b11;

    reg [17:0] counter;
    reg div_clk;

    always @(posedge clk) begin
        if (counter == 100000) begin
            div_clk <= 1;
            counter <= 0;
        end else begin
            div_clk <= 0;
            counter <= counter + 1;
        end
    end

    reg [1:0] state = S0;
    reg [1:0] next_state = S0;

    always @(state, sw) begin
        case (state)
            S0:
            if (sw) next_state = S1;
            else next_state = S0;
            S1:
            if (sw) next_state = S2;
            else next_state = S0;
            S2:
            if (!sw) next_state = S3;
            else next_state = S2;
            S3:
            if (!sw) next_state = S0;
            else next_state = S2;
            default: next_state = S0;
        endcase
    end

    always @(posedge div_clk) begin
        state <= next_state;
    end

    assign db = state == S2 || state == S3;
endmodule
