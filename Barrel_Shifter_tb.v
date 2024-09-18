`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2024 05:13:37 PM
// Design Name: 
// Module Name: Barrel_Shifter_tb
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


module Barrel_Shifter_tb();

reg  [7:0] IN;
reg  [2:0] shift;
wire [7:0] OUT;

Barrel_Shifter barrel(
.IN(IN),
.shift_amnt(shift),
.OUT(OUT));

initial 
begin
#5
IN = 8'b1101_0010;
shift = 3'd1;

#5
IN = 8'b1101_0010;
shift = 3'd2;

#5
IN = 8'b1101_0010;
shift = 3'd3;

#5
IN = 8'b1101_0010;
shift = 3'd4;

#5
IN = 8'b1101_0010;
shift = 3'd5;

#5
IN = 8'b1101_0010;
shift = 3'd6;

#5
IN = 8'b1101_0010;
shift = 3'd7;

end

initial
begin
$dumpfile("Barrel_Shifter_tb.vcd");
$dumpvars(0,Barrel_Shifter_tb);
$monitor(" When input = %b and shift_amount = %d ---> output = %b",IN,shift,OUT);

end

endmodule
