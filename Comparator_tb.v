`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2024 04:27:51 PM
// Design Name: 
// Module Name: Comparator_tb
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


module Comparator_tb#(parameter N = 4)();

reg [N-1:0] A,B;
reg clk,reset_n;
wire GT,LT,EQ;

always
begin
#5 clk = ~clk;
end

Comparator #(.N(N)) DUT(
.clk(clk),
.reset_n(reset_n),
.A(A),
.B(B),
.GT(GT),
.LT(LT),
.EQ(EQ)
);

initial
begin
clk =1'b0;
reset_n =1'b0;
A = 4'b1010;
B = 4'b1001;

@(negedge clk) 
reset_n = 1'b1;

#10 
A = 4'b0110;
B = 4'b1000;

#10
A = 4'b1110;
B = 4'b1110;

#10 
A = 4'b1011;
B = 4'b1110;

#10
A = 4'b0101;
B = 4'b0001;

#10
A = 4'b0000;
B = 4'b0000;  
end


initial
begin
$dumpfile("Comparator_tb.vcd");
$dumpvars(0,Comparator_tb);
$monitor("A = %d and B = %d -----> LT = %b ,EQ = %b,GT = %b",A,B,LT,EQ,GT);
end


endmodule
