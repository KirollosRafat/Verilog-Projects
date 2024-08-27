`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Student: Kirollos Rafat 
// 
// Create Date: 08/27/2024 08:28:45 PM
// Design Name: 
// Module Name: sequence_detector_1010
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: A finite state machine of a sequence detector that detects whenever 1010 sequence occur
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sequence_detector_1010(
    input clk,//clock input
    input resetn,//Asynchronous active low reset
    input data,//input data to the FSM
    output sequence_detected
    );
    
    parameter [2:0] s0 = 3'b000,s1 = 3'b001,s2 = 3'b010, s3= 3'b011,s4 = 3'b100;
    reg [2:0] state , next_state; 
    
    always@(posedge clk, negedge resetn)
        begin
            if(~resetn) state <= s0; // reset the FSM to a known state
            else state <= next_state;
        end
    
    //Next State Logic  (States Transitions)  
    always@(state,data)
        begin
            case(state)
             s0: if(data) next_state = s1;
                else next_state = s0;

             s1: if(data) next_state = s1;
                else next_state = s2;
                                            
             s2: if(data) next_state = s3;
                   else next_state = s0;            
   
             s3: if(data) next_state = s3;
                      else next_state = s4;            
            
             s4: if(data) next_state = s3;
                else next_state = s0;            
            endcase
        end    
    assign sequence_detected = (state == s4); //output is assigned to logic high when the sequnce is detected
endmodule
