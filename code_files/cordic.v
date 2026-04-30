//=========================================================
// File: cordic_decimal.v
// Improved normalized CORDIC output with 4 decimal precision
// Output format:
// sin(90°)  = 10000  => 1.0000
// cos(45°)  = 7071   => 0.7071
// sin(30°)  = 5000   => 0.5000
//=========================================================

module cordic_decimal(
    input clk,
    input rst,
    input start,
    input signed [31:0] angle_in,    
    output reg signed [31:0] sin_out,
    output reg signed [31:0] cos_out,
    output reg done
);

    reg signed [31:0] x, y, z;
    reg signed [31:0] atan_table [0:15];
    reg [4:0] i;

    parameter SCALE = 32'd65536;
    parameter OUTPUT_SCALE = 32'd10000;  
    parameter K = 32'd39797;

    initial begin
        atan_table[0]  = 32'd2949120;
        atan_table[1]  = 32'd1740967;
        atan_table[2]  = 32'd919879;
        atan_table[3]  = 32'd466945;
        atan_table[4]  = 32'd234379;
        atan_table[5]  = 32'd117304;
        atan_table[6]  = 32'd58666;
        atan_table[7]  = 32'd29335;
        atan_table[8]  = 32'd14668;
        atan_table[9]  = 32'd7334;
        atan_table[10] = 32'd3667;
        atan_table[11] = 32'd1833;
        atan_table[12] = 32'd917;
        atan_table[13] = 32'd458;
        atan_table[14] = 32'd229;
        atan_table[15] = 32'd115;
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            x <= 0;
            y <= 0;
            z <= 0;
            i <= 0;
            done <= 0;
            sin_out <= 0;
            cos_out <= 0;
        end
        else begin
            if (start) begin
                x <= K;
                y <= 0;
                z <= angle_in;
                i <= 0;
                done <= 0;
            end
            else if (i < 16) begin
                if (z >= 0) begin
                    x <= x - (y >>> i);
                    y <= y + (x >>> i);
                    z <= z - atan_table[i];
                end
                else begin
                    x <= x + (y >>> i);
                    y <= y - (x >>> i);
                    z <= z + atan_table[i];
                end
                i <= i + 1;
            end
            else begin
                // Convert Q16 result to decimal precision
                cos_out <= (x * OUTPUT_SCALE) / SCALE;
                sin_out <= (y * OUTPUT_SCALE) / SCALE;

                // Zero correction
                if ((x < 5) && (x > -5))
                    cos_out <= 0;
                if ((y < 5) && (y > -5))
                    sin_out <= 0;

                done <= 1;
            end
        end
    end

endmodule