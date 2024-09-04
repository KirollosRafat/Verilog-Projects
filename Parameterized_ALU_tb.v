`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2024 07:58:58 PM
// Design Name: 
// Module Name: Parameterized_ALU_tb
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


module Parameterized_ALU_tb#(parameter n = 16)();

//Inputs and Outputs declarations
reg clk;
reg [3:0] ALU_Func;
reg [n-1:0] A,B;
wire [n-1:0] out;
wire Arith,CMP,Logic,Carry,Shift;
localparam T = 10;
// Clock  Generation : 
always
begin
#(T/2) clk = ~clk;
end

//Instansiate A Design Under Test:
  Parameterized_ALU ALU_DUT#(.N(n))(
.clk(clk),
.ALU_Func(ALU_Func),
.A(A),
.B(B),
.ALU_out(out),
.Arith(Arith),
.CMP(CMP),
.Logic(Logic),
.Carry(Carry),
.Shift(Shift)
);


//Stimulli:
initial
begin

clk =1'b0;
  
#T 
A = 16'h0010; 
B = 16'h000A; 
ALU_Func = 4'b0000; //ADD

#T 
A = 16'hFFFD; 
B = 16'h0003; 
ALU_Func = 4'b0000; //ADD with a carry


#T 
A = 16'd16; 
B = 16'd10; 
ALU_Func = 4'b0001;//SUB

#T 
A = 16'd16; 
B = 16'd10;  
ALU_Func = 4'b0010;//MUL

#T 
A = 16'd200; 
B = 16'd10; 
ALU_Func = 4'b0011;//DIV 

#T 
A = 16'h0011; 
B = 16'h1111; 
ALU_Func = 4'b0100;//AND

#T 
A = 16'h0011; 
B = 16'h1111; 
ALU_Func = 4'b0101;//OR


#T 
A = 16'h0011; 
B = 16'h1111; 
ALU_Func = 4'b0110;//NAND

#T 
A = 16'h0011; 
B = 16'h1111; 
ALU_Func = 4'b0111;//NOR

#T 
A = 16'h0011; 
B = 16'h1111; 
ALU_Func = 4'b1000;//XOR


#T 
A = 16'h0011; 
B = 16'h1111; 
ALU_Func = 4'b1001;//XNOR

#T
A = 16'd12886;
B = 16'd12886;
ALU_Func = 4'b1010;//CMP if equal

#T
A = 16'd12889;
B = 16'd12886;
ALU_Func = 4'b1011;//CMP if A > B

#T
A = 16'd12883;
B = 16'd12886;
ALU_Func = 4'b1100;//CMP if A < B

#T
A = 16'd620;
ALU_Func = 4'b1101;//A >> 1

#T
A = 16'd620;
ALU_Func = 4'b1101;//A << 1

#T $finish;
     
end

initial
begin
$dumpfile("Parameterized_ALU_tb.vcd");
$dumpvars(0,Parameterized_ALU_tb);

$monitor("At time %0t: A = %d , B = %d, ALU_Result = %d,Carry =%b, Arith = %b,Logic = %b,CMP = %b,Shift = %b",
$time,A, B,out,Carry,Arith,Logic,CMP,Shift);

end

endmodule
