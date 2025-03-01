module rsa_encrypt(
    input clk,               // Clock signal
    input rst,               // Reset signal
    input [7:0] message,     // 8-bit input message
    output reg [7:0] encrypted  // 8-bit value representing the encrypted message
);

    reg [7:0] result;          // Store intermediate result for encryption
    reg [7:0] exp_count;       // Counter to track the number of exponentiation iterations
    reg [7:0] e;               // Public exponent for encryption
    reg [15:0] n;              // Modulus (product of two primes)

    // Parameters for public exponent and modulus
    initial begin
        e = 7;      // Public exponent e
        n = 143;    // Modulus n (product of 11 and 13)
    end
	 
	     mod_unit u_mod_unit_encrypt (
        .clk(clk),
        .rst(rst),
        .base(message),  // Base is the message to be encrypted
        .exp(e),         // Exponent is e (public exponent)
        .modulus(n),     // Modulus n
        .result(encrypted) // The result is the encrypted message
    );

    always @(posedge clk) begin
        if (rst) begin
            encrypted <= 0;  // Initialize encrypted message to 0 on reset
        end
    end

endmodule
