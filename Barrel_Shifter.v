`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2024 05:04:50 PM
// Design Name: 
// Module Name: Barrel_Shifter
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


module Barrel_Shifter(input [7:0] IN,
input [2:0] shift_amnt,
output reg [7:0] OUT);

always@(IN,shift_amnt)
    begin
        case(shift_amnt)    
            3'b000: OUT = IN;    
            3'b001: OUT = {IN[0],IN[7:1]};
            3'b010: OUT = {IN[1:0],IN[7:2]};
            3'b011: OUT = {IN[2:0],IN[7:3]};
            3'b100: OUT = {IN[3:0],IN[7:4]};
            3'b101: OUT = {IN[4:0],IN[7:5]};
            3'b110: OUT = {IN[5:0],IN[7:6]};
            3'b111: OUT = {IN[6:0],IN[7]};
            default: OUT = IN;
        endcase
    end

endmodule
