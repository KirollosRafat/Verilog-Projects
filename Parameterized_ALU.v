`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Student: Kirollos Rafat Foad 
// 
// Create Date: 09/04/2024 07:02:17 PM
// Design Name: 
// Module Name: Parameterized_ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: A Parameterized Arithmetic and Logical Unit that performs various operations on its operands
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Parameterized_ALU#(parameter N = 16)(
    input clk, // clock input
    input [N-1:0] A,// first operand
    input [N-1:0] B, // second operand
    input [3:0] ALU_Func, // ALU fucntion to determine which operation should be done
    output reg [N-1:0] ALU_out,// The output of ALU
    output reg Carry, //carry flag
    output  Arith,// Arithmetic flag is set to High when any Arithmetic operation is done
    output  Shift,// Shift flag is set to High when any Shift operation is done
    output  CMP,// Compare flag is set to High when any compare operation is done
    output  Logic // Logic flag is set to High when any Logic operation is done
    );
    
    localparam [N-1:0] one = 1, two = 2,three = 3;  
    
    always@(posedge clk)
        begin
            Carry <= 1'b0;
            case(ALU_Func)
                4'b0000: {Carry,ALU_out} <= A + B;
                4'b0001: {Carry,ALU_out} <= A - B;
                4'b0010: ALU_out <= A * B;
                4'b0011: ALU_out <= A / B;
                4'b0100: ALU_out <= A & B;
                4'b0101: ALU_out <= A | B;
                4'b0110: ALU_out <= ~(A & B);
                4'b0111: ALU_out <= ~(A | B);
                4'b1000: ALU_out <= A ^ B;
                4'b1001: ALU_out <= ~(A ^ B);
                4'b1010: begin
                            if (A == B) ALU_out <= one;
                            else ALU_out <= 'b0;
                         end
                4'b1011:  begin
                            if (A > B) ALU_out <= two;
                            else ALU_out <= 'b0;
                          end
                 4'b1100: begin
                            if (A < B) ALU_out <= three;
                            else ALU_out <= 'b0;
                          end
                 4'b1101: ALU_out <= A >> 1'b1;
                 4'b1110: ALU_out <= A << 1'b1;                               
                default: ALU_out <= 'b0;
            endcase
        end
        
    assign Arith = ({ALU_Func[3],ALU_Func[2]} == 2'b00 ); 
    assign Logic = ({ALU_Func[3],ALU_Func[2]} == 2'b01) || (ALU_Func == 4'b1000) || (ALU_Func == 4'b1001);
    assign CMP = (ALU_Func == 4'b1010) || (ALU_Func == 4'b1011) || (ALU_Func == 4'b1100);
    assign Shift = (ALU_Func == 4'b1101) || (ALU_Func == 4'b1110);
endmodule
