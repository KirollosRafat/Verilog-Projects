`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2024 04:16:07 PM
// Design Name: 
// Module Name: Comparator
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


module Comparator#(parameter N = 4)(
    input clk,
    input reset_n,
    input [N-1:0] A,
    input [N-1:0] B,
    output  EQ,
    output  GT,
    output  LT
    );
    
    reg F1,F2,F3;
    reg F1_next ,F2_next,F3_next;
    always@(posedge clk,negedge reset_n)
        begin
            if(~reset_n)
                begin
                    F1 <= 'b0;
                    F2 <= 'b0;
                    F3 <= 'b0; 
                end
            else 
                begin
                    F1 <= F1_next;
                    F2 <= F2_next;
                    F3 <= F3_next;
                end     
        end
    
    always@(A,B)
        begin
            F1_next = 1'b0; F2_next = 1'b0; F3_next = 1'b0;
            if(A > B) F1_next = 1'b1;
            else if(A < B) F2_next = 1'b1;
            else F3_next = 1'b1;
        end
    
    assign GT = F1;
    assign LT = F2;
    assign EQ = F3;
    
endmodule
