`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2022 02:23:25 PM
// Design Name: 
// Module Name: piano_tb
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


module piano_tb();
    reg clk;
    reg [4:0] switch;
    wire speaker;
    wire [6:0] seven_segment;
    wire [7:0] AN;
    
    piano uut (
    .clk(clk),
    .switch(switch),
    .speaker(speaker),
    .seven_segment(seven_segment),
    .AN(AN)
    );
    
    always #10 clk=!clk;
    
    initial begin
    clk = 1'b0; #10;
    switch = 0; #10;
    
    switch = 5'b00001; #20; //C
    switch = 5'b00000; #10;
    
    switch = 5'b00010; #20; //D
    switch = 5'b00000; #10;
    
    switch = 5'b00100; #20; //E
    switch = 5'b00000; #10;
    
    switch = 5'b00000; #10; //OFF

end
endmodule
