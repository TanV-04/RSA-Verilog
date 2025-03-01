module rsa_decrypt(
    input clk,               // Clock signal
    input rst,               // Reset signal
    input [7:0] cipher,     // 8-bit input ciphertext
    output reg [7:0] decrypted  // 8-bit value representing the decrypted message
);

    reg [7:0] result;          // Store intermediate result for decryption
    reg [7:0] count;           // Counter to track number of decryption iterations
    reg [7:0] d;               // Private exponent for decryption
    reg [15:0] n;              // Modulus (product of two primes)

    // Parameters for private exponent and modulus
    initial begin
        d = 103;     // Private exponent d
        n = 143;     // Modulus n (product of 11 and 13)
    end

    mod_unit u_mod_unit_decrypt (
        .clk(clk),
        .rst(rst),
        .base(cipher),  // Base is the ciphertext to be decrypted
        .exp(d),        // Exponent is d (private exponent)
        .modulus(n),    // Modulus n
        .result(decrypted) // The result is the decrypted message
    );

    always @(posedge clk) begin
        if (rst) begin
            decrypted <= 0;  // Initialize decrypted message to 0 on reset
        end
    end

endmodule
