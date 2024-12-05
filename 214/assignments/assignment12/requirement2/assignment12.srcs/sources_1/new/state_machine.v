`timescale 1ns / 1ps

module state_machine (
    input clk,
    input start,
    input react,
    input [12:0] random,
    input [15:0] data,
    output cen,
    output den,
    output aen,
    output idx,
    output [15:0] avg,
    output crst
);
    localparam reg [2:0] S0 = 3'b000;
    localparam reg [2:0] S1 = 3'b001;
    localparam reg [2:0] S2 = 3'b010;
    localparam reg [2:0] S3 = 3'b011;
    localparam reg [2:0] S4 = 3'b100;

    reg [ 2:0] state;
    reg [ 2:0] next_state;

    reg [13:0] counter;
    reg [13:0] target;

    reg [ 3:0] _idx;
    reg [18:0] sum;

    always @(posedge clk) begin
        case (state)
            S0: begin
                if (start) begin
                    target = random + 1000;
                    counter = 0;
                    next_state = S1;
                end else next_state = S0;
            end
            S1:
            if (counter == target) next_state = S2;
            else next_state = S1;
            S2: begin
                if (react) begin
                    sum = sum + data;
                    next_state = S3;
                end else next_state = S2;
            end
            S3:
            if (start) next_state = S4;
            else next_state = S3;
            S4: begin
                if (!start) begin
                    _idx = _idx + 1;
                    next_state = S0;
                end else next_state = S4;
            end
            default: next_state = S0;
        endcase

        state   = next_state;
        counter = counter + 1;
    end

    assign cen  = state == S2;
    assign den  = state != S0;
    assign aen  = state == S0 || state == S3;
    assign idx  = _idx;
    assign avg  = sum >> 3;
    assign crst = state == S0;
endmodule
