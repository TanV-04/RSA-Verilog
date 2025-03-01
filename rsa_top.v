`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:08:11 02/27/2025 
// Design Name: 
// Module Name:    rsa_top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module rsa_top(
    input clk,
    input rst,
    input [7:0] message,   // 8-bit message (M < n)
    output [7:0] encrypted,
    output [7:0] decrypted
);
    wire [7:0] cipher;

    rsa_encrypt encryptor (
        .clk(clk),
        .rst(rst),
        .message(message),
        .encrypted(cipher)
    );

    rsa_decrypt decryptor (
        .clk(clk),
        .rst(rst),
        .cipher(cipher),
        .decrypted(decrypted)
    );
	 
	 // assign encrypted = cipher; // optional

endmodule
