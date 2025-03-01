module mod_unit(
    input clk,
    input rst,
    input [15:0] base,
    input [7:0] exp,
    input [15:0] modulus,
    output reg [15:0] result
);
	 
	 reg [7:0] exp_count;
    reg [15:0] temp;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            exp_count <= 0;
            result <= 1;       // Initialize to 1 for modular exponentiation
            temp <= base;
        end else begin
            if (exp_count < exp) begin
                result <= (result * temp) % modulus;
                exp_count <= exp_count + 1;
            end
        end
    end


endmodule
