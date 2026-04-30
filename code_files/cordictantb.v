//=========================================================
// File: cordic_atan_tb.v
//=========================================================

`timescale 1ns / 1ps

module cordic_atan_tb;

    reg clk;
    reg rst;
    reg start;

    reg signed [31:0] x_in;
    reg signed [31:0] y_in;

    wire signed [31:0] angle_out;
    wire done;

    cordic_atan uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .x_in(x_in),
        .y_in(y_in),
        .angle_out(angle_out),
        .done(done)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        start = 0;

        #20;
        rst = 0;

        //==================================
        // Test atan(1/1) = 45°
        //==================================
        #10;
        x_in = 32'd65536;   // 1.0
        y_in = 32'd65536;   // 1.0
        start = 1;

        #10;
        start = 0;

        wait(done);

        $display("Test atan(1/1)");
        $display("Expected: 45.0000");
        $display("Angle = %d.%04d degrees",
                 angle_out / 10000,
                 angle_out % 10000);

        //==================================
        // Test atan(0.577) ≈ 30°
        //==================================
        #20;
        rst = 1;
        #10;
        rst = 0;

        #10;
        x_in = 32'd65536;   // 1
        y_in = 32'd37837;   // tan(30°)
        start = 1;

        #10;
        start = 0;

        wait(done);

        $display("Test atan(0.577)");
        $display("Expected: 30.0000");
        $display("Angle = %d.%04d degrees",
                 angle_out / 10000,
                 angle_out % 10000);

        #50;
        $stop;
    end

endmodule