`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2024 11:21:32 AM
// Design Name: 
// Module Name: Parameterized_CLA_tb
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


module Parameterized_CLA_tb#(parameter n = 4)();
  reg [n-1:0]A, B; 
  reg Cin;
  wire [n-1:0] S;
  wire Cout;
  wire[n:0] add;
  
  Parameterized_CLA#(.nbits(n)) CLA(A, B, Cin, S, Cout);
  
  assign add = {Cout, S};
  initial begin
    $monitor("A = %b: B = %b, Cin = %b --> S = %b, Cout = %b, Addition = %0d", A, B, Cin, S, Cout, add);
    A = 10; B = 0; Cin = 0; #3;
    A = 11; B = 4; Cin = 1; #3;
    A = 4'hb; B = 4'h6; Cin = 0; #3;
    A = 5; B = 3; Cin = 1; #3;
    A = 8; B = 8; Cin = 1;
  end
endmodule







