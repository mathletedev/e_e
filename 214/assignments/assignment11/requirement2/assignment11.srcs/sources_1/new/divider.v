`timescale 1ns / 1ps

module divider (
    input clk,
    input rst,
    output reg res
);
    reg [17:0] counter;

    always @(posedge clk) begin
        if (rst) begin
            res <= 0;
            counter <= 0;
        end else begin
            if (counter == 100000) begin
                res <= 1;
                counter <= 0;
            end else begin
                res <= 0;
                counter <= counter + 1;
            end
        end
    end
endmodule
