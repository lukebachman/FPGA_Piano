`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2022 02:45:22 AM
// Design Name: 
// Module Name: seven_segment_decoder_tb
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


module seven_segment_decoder_tb();
    reg [3:0] bin_in;
    wire [6:0] hex_out;
    integer i;

    // Instantiate the Unit Under Test (UUT)
    seven_segment_decoder uut (
        .bin_in(bin_in), 
        .hex_out(hex_out)
    );

//Apply inputs
    initial begin
        for(i = 0;i < 16;i = i+1) //run loop for 0 to 15.
        begin
            bin_in = i; 
            #10; //wait for 10 ns
        end     
    end
      
endmodule
