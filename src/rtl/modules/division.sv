module division #(
    parameter WIDTH      = 32,
    parameter ITER_BEGIN = 0,
    parameter ITER_END   = 32
) (
    input  [WIDTH-1:0] dividend,
    input  [WIDTH-1:0] divisor,
    input  [WIDTH:0]   r_i,
    input  [WIDTH-1:0] q_i,
    output  [WIDTH:0]   r_o,
    output  [WIDTH-1:0] q_o
);

    reg [WIDTH:0]   r;    // 33-bit remainder (extra bit for overflow)
    reg [WIDTH-1:0] q;    // Quotient

    parameter HIGHEST_BIT = WIDTH - 1;

    always @(*) begin
        integer i;

        r = r_i;
        q = q_i;

        for (i = ITER_BEGIN; i < ITER_END; i = i + 1) begin
            // Shift remainder left and insert next bit of dividend
            r = (r << 1) | ((dividend >> (HIGHEST_BIT - i)) & 1'b1);
            
            // Compare and subtract if possible
            if (r >= divisor) begin
                r = r - divisor;
                q[HIGHEST_BIT - i] = 1'b1;  // Set cur_ient quotient bit
            end else begin
                q[HIGHEST_BIT - i] = 1'b0;
            end
        end
    end

    assign r_o = r;
    assign q_o = q;

endmodule