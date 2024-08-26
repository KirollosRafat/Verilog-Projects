`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2024 11:41:54 AM
// Design Name: 
// Module Name: Branch_Predictor
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


module Branch_Predictor(
    input clk,
    input reset_n,
    input taken,
    output [1:0] prediction
    );
    
    parameter [1:0] SNT = 2'b00,//Strongly Not Taken
                    WNT = 2'b01,//Weakly Not Taken
                    WT  = 2'b10,//Weakly Taken
                    ST  = 2'b11;//Stongly Taken
                    
    
    reg [1:0] present_state,next_state;//two bit register for four states machine
    
    
    always@(posedge clk,negedge reset_n)
        begin
            if(~reset_n) present_state <= SNT; //reset the FSM to strongly not taken state
            else present_state <= next_state;
        end
    
    //Next State Logic
    always@(present_state,taken)
        begin
            case(present_state)
                SNT: if(~taken) next_state = SNT; 
                     else next_state = WNT;   
            
                WNT: if(~taken) next_state = SNT; 
                     else next_state = WT;
                     
                WT: if(~taken) next_state = WNT; 
                    else next_state = ST;
        
                ST: if(~taken) next_state = WT;
                    else next_state = ST;      
            endcase
        end
    
    
    assign prediction = present_state;//prediction outcome
    
endmodule
