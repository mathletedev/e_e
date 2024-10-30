`timescale 1ns / 1ps

module flip_flop (
    input  clk,
    output count
);
    reg tmp;

    always @(posedge clk) begin
        tmp <= ~tmp;
    end

    assign count = tmp;
endmodule

module main (
    input clk,
    output led1,  // output for requirement 1
    output [3:0] led2,  // output for requirement 2
    output led3  // output for requirement 3
);
    localparam reg [5:0] N = 27;

    // requirement 1
    wire [N-1:0] count1;

    flip_flop ff1 (
        .clk  (clk),
        .count(count1[0])
    );

    genvar i;
    generate
        for (i = 1; i < N; i = i + 1) begin : gen_flip_flops1
            flip_flop ff1 (
                .clk  (count1[i-1]),
                .count(count1[i])
            );
        end
    endgenerate

    // requirement 2
    reg [27:0] counter2;
    always @(posedge clk) begin
        counter2 <= counter2 + 1;
    end

    wire [3:0] count2;

    flip_flop ff2 (
        .clk  (counter2[27]),
        .count(count2[0])
    );

    generate
        for (i = 1; i < 4; i = i + 1) begin : gen_flip_flops2
            flip_flop ff2 (
                .clk  (count2[i-1]),
                .count(count2[i])
            );
        end
    endgenerate

    // requirement 3
    reg [16:0] counter3_1;
    reg [ 9:0] counter3_2;
    always @(posedge clk) begin
        counter3_1 <= counter3_1 + 1;
    end
    always @(posedge counter3_1[16]) begin
        counter3_2 <= counter3_2 + 1;
    end

    assign led1 = count1[N-1];
    assign led2 = ~count2;
    assign led3 = counter3_2[9];
endmodule
