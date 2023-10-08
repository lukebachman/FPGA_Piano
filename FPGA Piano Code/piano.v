`timescale 1ns / 1ps

module piano(switch, clk, speaker, seven_segment, AN);

    input [4:0] switch;            // mapped to input pin
    input clk;                     // mapped to system clock
    output speaker;                // mapped to output pin
    output [6:0] seven_segment;    // outputs note on seven segment
    output [7:0] AN;               //Enable only 1 of the 8 digit displays

    parameter m=100;               // base clock (in MHz) of system
    parameter n=20;                // parameter for counter bit length

    // flip-flop reset value for notes
    parameter C4 = 1911, D4 = 1703, E4 = 1517, F4 = 1432, G4 = 1276; 
    
    // count up to reset value                       
    reg [n:0] counterC4, counterD4, counterE4, counterF4, counterG4;         
    reg [4:0] flipper;             // flip-flop used to generate tone
    reg note;
     
    seven_segment s1(switch, seven_segment); //Instiated display module
      
    assign AN = 8'b11111110;
    assign speaker = note;
    
    always @(switch) begin
        case(switch)
        5'b00000 : note = 0;                        //OFF
        5'b00001 : note = switch[0] & flipper[0];   //C4
        5'b00010 : note = switch[1] & flipper[1];   //D4
        5'b00100 : note = switch[2] & flipper[2];   //E4
        5'b01000 : note = switch[3] & flipper[3];   //F4
        5'b10000 : note = switch[4] & flipper[4];   //G4
        default : note = 0;                         //OFF
        endcase
    end

    always @(posedge clk) begin
        // Each if-else block is a note frequency generator
        // Note C4
        if(counterC4==m*C4) begin
            counterC4 <= 0; // Counter reset            
            flipper[0] <= ~flipper[0]; // Toggle flip-flop
        end else counterC4 <= counterC4+1; 
        // Counter on until reaching half of tone frequency
        
        //Note D4
        if(counterD4==m*D4) begin
            counterD4 <= 0; // Counter reset            
            flipper[1] <= ~flipper[1]; // Toggle flip-flop
        end else counterD4 <= counterD4+1;
        
        //Note E4
        if(counterE4==m*E4) begin
            counterE4 <= 0; // Counter reset            
            flipper[2] <= ~flipper[2]; // Toggle flip-flop
        end else counterE4 <= counterE4+1;
        
        //Note F4
        if(counterF4==m*F4) begin
            counterF4 <= 0; // Counter reset            
            flipper[3] <= ~flipper[3]; // Toggle flip-flop
        end else counterF4 <= counterF4+1;
        
        //Note G4
        if(counterG4==m*G4) begin
            counterG4 <= 0; // Counter reset            
            flipper[4] <= ~flipper[4]; // Toggle flip-flop
        end else counterG4 <= counterG4+1;
        
    end
endmodule