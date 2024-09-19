`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2024 05:17:32 PM
// Design Name: 
// Module Name: N_bit_factorial
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


module N_bit_factorial#(parameter N = 4)(
input  [N-1:0] Number,// input number 
   output reg [10*N-1:0] Factorial // output factorial 
   );
 
  integer i;
  always@(*)
  begin
  Factorial = 1;
  for(i = 1; i <= Number; i = i + 1 )
  Factorial = Factorial * i;
  end
 
   
endmodule
