`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2024 02:57:10 PM
// Design Name: 
// Module Name: up_dn_counter
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


module Up_Dn_Counter(
    input clk, //clock input
    input [4:0] IN, // input load
    input LOAD, // load signal
    input Up, //up signal for increment
    input Down, // down signal for decrement 
    output High, // output to indicate that the counter has reached Max Count (31)
    output Low, // output to indicate that the counter  has reached Min Count (0)
    output [4:0] Counter // the main output counter
    );
    
    reg [4:0] state,next_state;
    
    always@(posedge clk)
        begin
            if(LOAD) state <= IN;
            else state <= next_state;
        end

    always@(Up,Down,High,Low,state)
        begin
            next_state = state;
            if(Down && !Low) next_state = state - 1;
            else if(Up && !High ) next_state = state + 1;
        end
     
     assign Low = (state == 5'd0);   
     assign High = (state == 5'd31);
     assign Counter = state;

endmodule
