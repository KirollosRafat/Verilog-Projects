`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2024 05:32:13 PM
// Design Name: 
// Module Name: N_bit_factorial_tb
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


module N_bit_factorial_tb#(parameter N = 4)();

reg   [N-1:0] number;
  wire [10*N-1:0] factorial;

N_bit_factorial DUT(
.Number(number),
.Factorial(factorial));

initial 
begin
#3 number = 4'b0000;
#2 number = 4'b0001;
#5 number = 4'b0010;
#5 number = 4'b0100;
#5 number = 4'b0101;
#5 number = 4'b1000;
#5 number = 4'b1001;
#5 number = 4'b1010;
end

initial
begin
$dumpfile("N_bit_factorial_tb.vcd");
$dumpvars(0,N_bit_factorial_tb);
$monitor("number in decimal = %d -----> factorial = %d",number,factorial);

end

endmodule
