`timescale 1ns / 1ps

module seven_segment(
    input  [4:0] bin_in,
    output [6:0] hex_out
    );
    reg [6:0] out;
    assign hex_out = out;

         always @(bin_in)
            begin
            case (bin_in) //case statement
            5'b00000 : out = 7'b1111111; //OFF
            5'b00001 : out = 7'b1000110; //C
            5'b00010 : out = 7'b0100001; //D
            5'b00100 : out = 7'b0000110; //E
            5'b01000 : out = 7'b0001110; //F
            5'b10000 : out = 7'b1000010; //G
            //switch off 7 segment character 
            default : out = 7'b1111111; 
        endcase
    end
endmodule