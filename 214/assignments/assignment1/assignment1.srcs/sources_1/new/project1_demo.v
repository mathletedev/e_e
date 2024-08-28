`timescale 1ns / 1ps

    module project1_demo(
        input clk,
        output [15:0] led,
        output [7:0] seg,
        output [3:0] an
    );

    reg [23:0] counter = 24'd0;
    reg divclk = 1'b0;
    reg [3:0] round_counter = 4'd0;
    reg [15:0] led_reg;
    reg [7:0] seg_reg;

    /* Clock Divider: 100MHz -> 10Hz (100ms) */
    always @(posedge clk)
    begin
        if (counter == 24'd4999999) begin
            divclk <= ~divclk;
            counter <= 24'd0;
        end
        else begin
            divclk <= divclk;
            counter <= counter + 1'd1;
        end
    end

    always @(posedge divclk)
    begin
        round_counter <= round_counter + 1'd1;
    end

    always @(posedge divclk)
    begin
        if (round_counter == 4'd0) begin
            led_reg <= 16'hFFFE;
            seg_reg <= 8'hFE;
        end
        else begin
            seg_reg <= {seg_reg[6:0], seg_reg[7]};
            led_reg <= {led_reg[14:0], led_reg[15]};
        end
    end

    assign led = led_reg;
    assign an = 4'h0;
    assign seg = seg_reg;

    endmodule
