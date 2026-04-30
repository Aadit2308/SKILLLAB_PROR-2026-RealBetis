//=========================================================
// File: cordic_decimal_tb.v
//=========================================================

`timescale 1ns / 1ps

module cordic_decimal_tb;

    reg clk;
    reg rst;
    reg start;
    reg signed [31:0] angle_in;

    wire signed [31:0] sin_out;
    wire signed [31:0] cos_out;
    wire done;

    cordic_decimal uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .angle_in(angle_in),
        .sin_out(sin_out),
        .cos_out(cos_out),
        .done(done)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        start = 0;

        #20 rst = 0;

        //=====================
        // 90 Degrees
        //=====================
        #10;
        angle_in = 32'd5898240;
        start = 1;
        #10 start = 0;

        wait(done);
        $display("Angle = 90 degrees");
        $display("Cosine = %d (0.%04d)", cos_out, cos_out);
        $display("Sine   = %d (1.%04d)", sin_out/10000, sin_out%10000);

        //=====================
        // 45 Degrees
        //=====================
        #20 rst = 1;
        #10 rst = 0;

        #10;
        angle_in = 32'd2949120;
        start = 1;
        #10 start = 0;

        wait(done);
        $display("Angle = 45 degrees");
        $display("Cosine = 0.%04d", cos_out);
        $display("Sine   = 0.%04d", sin_out);

        //=====================
        // 30 Degrees
        //=====================
        #20 rst = 1;
        #10 rst = 0;

        #10;
        angle_in = 32'd1966080;
        start = 1;
        #10 start = 0;

        wait(done);
        $display("Angle = 30 degrees");
        $display("Cosine = 0.%04d", cos_out);
        $display("Sine   = 0.%04d", sin_out);

        #50;
        $stop;
    end

endmodule