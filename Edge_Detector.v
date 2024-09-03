`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
//Student : Kirollos Rafat 
// 
// Create Date: 09/03/2024 05:55:16 PM
// Design Name: 
// Module Name: Edge_Detector
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


module Edge_Detector(
    input clk, //main clock signal
    input resetn, //Asynchronous active-low reset
    input clock_signal,// input clock signal
    output pose_edge,//rising edge detection
    output neg_edge // falling edge detection
    );
    
    reg Q1,Q2;
    always@(posedge clk,negedge resetn)
        begin
            if(~resetn) Q1 <= 1'b0; 
            else Q1 <= clock_signal;
        end
        
    always@(posedge clk,negedge resetn)
        begin
            if(~resetn) Q2 <= 1'b0;
            else Q2 <= Q1;
        end    
        
    assign pose_edge = Q1 & ~Q2;
    assign neg_edge = ~Q1 & Q2;   
endmodule
