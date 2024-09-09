`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2024 11:11:21 AM
// Design Name: 
// Module Name: Parameterized_CLA
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Parameterized_CLA#(parameter nbits = 4)(
    input [nbits -1:0] A,
    input [nbits-1:0] B,
    input Cin,
    output [nbits-1:0] S,
    output Cout
    );
    
    
    wire [nbits:0]Ci;
    assign Ci[0] = Cin;
    
    genvar k;
    generate
        for(k = 0; k < nbits; k = k + 1)
            begin    
            assign Ci[k+1] = (A[k]&B[k]) | ((A[k]^B[k])&Ci[k]);
            end
    endgenerate
    
    assign Cout = Ci[nbits];
    assign S = A ^ B ^Ci;
    
    
endmodule
