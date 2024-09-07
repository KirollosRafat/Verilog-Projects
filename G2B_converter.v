`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2024 10:54:16 AM
// Design Name: 
// Module Name: G2B_converter
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


module G2B_converter#(parameter nbits = 4)(
    input clk, //Input Clock
    input resetn, //Low active asynchronous reset
    input [nbits-1:0] gray,//input gray encoded
    output  [nbits-1:0] binary //binary output
    );
      
    genvar i;
    generate
      for(i=0; i<nbits ;i = i + 1) 
        begin
          assign  binary[i] = ^(gray >> i);
        end
    endgenerate
    
   
    
endmodule
