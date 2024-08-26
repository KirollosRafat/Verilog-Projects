`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2024 12:03:56 PM
// Design Name: 
// Module Name: Branch_Predictor_tb
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


module Branch_Predictor_tb();
    reg clk,reset,taken;
    wire [1:0] prediction;
    
    Branch_Predictor uut(.clk(clk),.reset_n(reset),.taken(taken),.prediction(prediction));
    
        initial 
        begin
           clk = 0;
           forever #5 clk = ~clk;
        end
        
            initial
            begin
            // Initialize
            reset = 0;
            #10 reset = 1;
            #10 taken = 1;
            #10 taken = 1;
            #10 taken = 0;
            #10 taken = 0;
            #10 taken = 1;
            #10 taken = 1;
            #10 taken = 1; 
            #20 $finish;
            end
            
               // Monitor the outputs
             initial begin
                 $dumpfile("Branch_Predictor_tb.vcd");
                 $dumpvars(0,Branch_Predictor_tb);
                 $monitor("At time %0t: taken = %b, prediction = %b",
                          $time,taken, prediction);
             end
        
endmodule
