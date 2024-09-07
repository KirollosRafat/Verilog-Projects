`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2024 11:08:17 AM
// Design Name: 
// Module Name: G2B_converter_tb
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


module G2B_converter_tb();
  wire[3:0] binary;
  reg [3:0] gray;
  G2B_converter g2b(gray, binary);
  
  initial begin
    $monitor("Gray = %b --> Binary = %b", gray, binary);
    gray = 4'b1110; #1;
    gray = 4'b0100; #1;
    gray = 4'b0111; #1;
    gray = 4'b1010; #1;
    gray = 4'b1000;
  end
endmodule