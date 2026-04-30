//=========================================================
// File: cordic_atan.v
// Custom CORDIC Arctangent (Vectoring Mode)
// Computes angle = atan(y/x)
// Input: x_in, y_in (Q16 fixed point)
// Output: angle_out (degrees scaled by 10000)
// Example:
// atan(1/1) ≈ 45.0000 => 450000
//=========================================================

module cordic_atan(
    input clk,
    input rst,
    input start,
    input signed [31:0] x_in,
    input signed [31:0] y_in,
    output reg signed [31:0] angle_out,
    output reg done
);

    reg signed [31:0] x, y, z;
    reg signed [31:0] atan_table [0:15];
    reg [4:0] i;

    parameter OUTPUT_SCALE = 32'd10000;

    initial begin
        // atan(2^-i) in degrees ×10000
        atan_table[0]  = 32'd450000;
        atan_table[1]  = 32'd265651;
        atan_table[2]  = 32'd140362;
        atan_table[3]  = 32'd71250;
        atan_table[4]  = 32'd35763;
        atan_table[5]  = 32'd17899;
        atan_table[6]  = 32'd8952;
        atan_table[7]  = 32'd4476;
        atan_table[8]  = 32'd2238;
        atan_table[9]  = 32'd1119;
        atan_table[10] = 32'd560;
        atan_table[11] = 32'd280;
        atan_table[12] = 32'd140;
        atan_table[13] = 32'd70;
        atan_table[14] = 32'd35;
        atan_table[15] = 32'd17;
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            x <= 0;
            y <= 0;
            z <= 0;
            i <= 0;
            angle_out <= 0;
            done <= 0;
        end
        else begin
            if (start) begin
                x <= x_in;
                y <= y_in;
                z <= 0;
                i <= 0;
                done <= 0;
            end
            else if (i < 16) begin
                if (y > 0) begin
                    x <= x + (y >>> i);
                    y <= y - (x >>> i);
                    z <= z + atan_table[i];
                end
                else begin
                    x <= x - (y >>> i);
                    y <= y + (x >>> i);
                    z <= z - atan_table[i];
                end
                i <= i + 1;
            end
            else begin
                angle_out <= z;
                done <= 1;
            end
        end
    end

endmodule