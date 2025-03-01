module rsa_tb;

    reg clk, rst;  // Clock and reset signals
    reg [7:0] message;  // 8-bit input message
    wire [7:0] encrypted, decrypted;  // Encrypted and decrypted outputs

    // Instantiate the encryption and decryption modules
    rsa_encrypt u_encrypt(
        .clk(clk),
        .rst(rst),
        .message(message),
        .encrypted(encrypted)
    );

    rsa_decrypt u_decrypt(
        .clk(clk),
        .rst(rst),
        .cipher(encrypted),
        .decrypted(decrypted)
    );
	 
	     initial begin
        clk = 0;  // Initialize clock to 0
        rst = 1;  // Set reset initially to 1

        #20;  // Hold reset for a few cycles
        rst = 0;  // Release reset

        message = 8'd65;  // Set message to ASCII value for 'A'

        #5000;  // Wait enough cycles to see encryption and decryption complete
		  
		  
        // Display the final decrypted message
        $display("Final decrypted message = %d (Should match original message: 65)", decrypted);
        $stop;  // Halt the simulation
    end

    // Clock generation: Toggle clock every 5 time units
    always #5 clk = ~clk;

endmodule
